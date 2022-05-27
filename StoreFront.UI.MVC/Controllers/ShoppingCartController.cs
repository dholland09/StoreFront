using Microsoft.AspNetCore.Mvc;
using StoreFront.DATA.EF.Models;
using Microsoft.AspNetCore.Identity;
using StoreFront.UI.MVC.Models;
using Newtonsoft.Json;

namespace StoreFront.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        private readonly StoreFrontContext _context;
        private readonly UserManager<IdentityUser> _userManager;
        //ctor
        public ShoppingCartController(StoreFrontContext context, UserManager<IdentityUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            var sessionCart = HttpContext.Session.GetString("cart");
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (sessionCart == null || sessionCart.Count() == 0)
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                ViewBag.Message = "There are no items in you cart.";
            }
            else
            {
                ViewBag.Message = null;
                shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);
            }
            return View(shoppingCart);
        }
        public IActionResult AddToCart(int id)
        {
            //Empty shell for LOCAL shopping cart variable
            //int (key) -> Product ID
            //CartItemViewModel (value) -> Product & Qty
            Dictionary<int, CartItemViewModel> shoppingCart = null;

        

            var sessionCart = HttpContext.Session.GetString("cart");

            if (string.IsNullOrEmpty(sessionCart))
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }
            else
            {
                shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);
            }


            Cheese cheese = _context.Cheeses.Find(id);

         
            CartItemViewModel civm = new CartItemViewModel(1, cheese); 

            
            if (shoppingCart.ContainsKey(cheese.CheeseId))
            {
                
                shoppingCart[cheese.CheeseId].Qty++;
            }
            else
            {
                shoppingCart.Add(cheese.CheeseId, civm);
            }

         
            string jsonCart = JsonConvert.SerializeObject(shoppingCart);
            HttpContext.Session.SetString("cart", jsonCart);

            return RedirectToAction("Index");
        }

        public IActionResult RemoveFromCart(int id)
        {            
            var sessionCart = HttpContext.Session.GetString("cart");
            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);
            shoppingCart.Remove(id);
            if (shoppingCart.Count == 0)
            {
                HttpContext.Session.Remove("cart");
            }
            else
            {
                string jsonCart = JsonConvert.SerializeObject(shoppingCart);
                HttpContext.Session.SetString("cart", jsonCart);
            }
            return RedirectToAction("Index");

        }

        public IActionResult UpdateCart(int cheeseId, int qty)
        {
            //retrieve the cart
            var sessionCart = HttpContext.Session.GetString("cart");
            //Deserialize from JSON to C#
            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            //update the qty for our specific dictionary key
            shoppingCart[cheeseId].Qty = qty;

            //update session
            string jsonCart = JsonConvert.SerializeObject(shoppingCart);
            HttpContext.Session.SetString("cart", jsonCart);

            return RedirectToAction("Index");

        }

        //This method must be async in order to invoke the UserManager's async methods in this action.
        public async Task<IActionResult> SubmitOrder()
        {          
            string? userId = (await _userManager.GetUserAsync(HttpContext.User))?.Id;

            UserDetail ud = _context.UserDetails.Find(userId);

            Order o = new Order()
            {
                OrderDate = DateTime.Now,
                UserId = userId,
                ShipCity = ud.City,
                ShipToName = ud.FullName,
                ShipState = ud.State,
                ShipZip = ud.Zip
            };

            //Add the Order to _context
            _context.Orders.Add(o);

            //Retrieve the session cart
            var sessionCart = HttpContext.Session.GetString("cart");
            Dictionary<int, CartItemViewModel> shoppingCart = JsonConvert.DeserializeObject<Dictionary<int, CartItemViewModel>>(sessionCart);

            //Create OrderProduct object for each item in the cart

            foreach (var item in shoppingCart)
            {
                OrderProduct op = new OrderProduct()
                {
                    OrderId = o.OrderId,
                    CheeseId = item.Key,
                    Price = item.Value.Cheese.Price,
                    Quantity = (short)item.Value.Qty
                };

                //ONLY need to add items to an existing entity if the items are related record (like from a linking table)
                o.OrderProducts.Add(op);
            }


            //Commit savew to DB
            _context.SaveChanges();

            return RedirectToAction("Index", "Orders");


        }


    }
}