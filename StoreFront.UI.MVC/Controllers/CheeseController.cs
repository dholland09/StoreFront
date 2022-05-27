using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StoreFront.DATA.EF.Models;
using System.Drawing;
using StoreFront.UI.MVC.Utilities;
using X.PagedList;

namespace StoreFront.UI.MVC.Controllers
{
    
    public class CheeseController : Controller
    {
        private readonly StoreFrontContext _context;

        public CheeseController(StoreFrontContext context)
        {
            _context = context;
        }

        // GET: Cheese
        [AllowAnonymous]
        public async Task<IActionResult> Index()
        {
            var cheeses = _context.Cheeses.Where(c => c.StatusId != 2)
                
                .Include(c => c.Category).Include(c => c.Country).Include(c => c.PackageType).Include(c => c.Status).Include(c => c.Supplier).Include(c=>c.OrderProducts);
            return View(await cheeses.ToListAsync());
        }

        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Discontinued()
        {
            var cheeses = _context.Cheeses.Where(c => c.StatusId != 1)

                .Include(c => c.Category).Include(c => c.Country).Include(c => c.PackageType).Include(c => c.Status).Include(c => c.Supplier).Include(c => c.OrderProducts);
            return View(await cheeses.ToListAsync());
        }
        [AllowAnonymous]
        public async Task<IActionResult> TiledProducts(string searchTerm, int categoryId = 0, int page = 1)
        {
            int pageSize = 6;


            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            ViewBag.Category = 0;



            var cheeses = _context.Cheeses.Where(c => c.StatusId != 2)
                .Include(c => c.Category).Include(c => c.Supplier).Include(c => c.OrderProducts).ToList();

            #region Optional Category Filter
            if (categoryId != 0)
            {
                cheeses = cheeses.Where(c => c.CategoryId == categoryId).ToList();
                ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", categoryId);
                ViewBag.Category = categoryId;

            }
            #endregion

            #region Optional Search Filter
            if (!string.IsNullOrEmpty(searchTerm))
            {
                cheeses = cheeses.Where(c => c.Name.ToLower().Contains(searchTerm.ToLower())
                                || c.Supplier.SupplierName.ToLower().Contains(searchTerm.ToLower())
                                || c.Description.ToLower().Contains(searchTerm.ToLower())
                                || c.Category.CategoryName.ToLower().Contains(searchTerm.ToLower())
                ).ToList();

                ViewBag.NbrResults = cheeses.Count;
                ViewBag.SearchTerm = searchTerm;
            }
            else
            {
                ViewBag.NbrResults = null;
                ViewBag.SearchTerm = null;
            }
            #endregion

            return View(cheeses.ToPagedList(page, pageSize));
        }
        // GET: Cheese/Details/5
        [AllowAnonymous]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Cheeses == null)
            {
                return NotFound();
            }

            var cheese = await _context.Cheeses
                .Include(c => c.Category)
                .Include(c => c.Country)
                .Include(c => c.PackageType)
                .Include(c => c.Status)
                .Include(c => c.Supplier)
                .FirstOrDefaultAsync(m => m.CheeseId == id);
            if (cheese == null)
            {
                return NotFound();
            }

            return View(cheese);
        }

        [Authorize(Roles = "Admin")]
        // GET: Cheese/Create
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName");
            ViewData["CountryId"] = new SelectList(_context.CountryOfOrigins, "CountryId", "Country");
            ViewData["PackageTypeId"] = new SelectList(_context.PackageTypes, "PackageTypeId", "PackageTypeId");
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName");
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierId", "Address");
            return View();
        }

        // POST: Cheese/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([Bind("CheeseId,Name,Price,QtyInStock,QtyOnOrder,Description,CountryId,SupplierId,PackageTypeId,StatusId,CategoryId,OrderId,ProductImage")] Cheese cheese)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cheese);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", cheese.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.CountryOfOrigins, "CountryId", "Country", cheese.CountryId);
            ViewData["PackageTypeId"] = new SelectList(_context.PackageTypes, "PackageTypeId", "PackageTypeId", cheese.PackageTypeId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName", cheese.Status);
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierId", "Supplier", cheese.Supplier);
            return View(cheese);
        }

        // GET: Cheese/Edit/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Cheeses == null)
            {
                return NotFound();
            }

            var cheese = await _context.Cheeses.FindAsync(id);
            if (cheese == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", cheese.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.CountryOfOrigins, "CountryId", "Country", cheese.CountryId);
            ViewData["PackageTypeId"] = new SelectList(_context.PackageTypes, "PackageTypeId", "PackageTypeId", cheese.PackageTypeId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName", cheese.StatusId);
            ViewData["SupplierName"] = new SelectList(_context.Suppliers, "SupplierName", "SupplierName", cheese.Supplier);
            return View(cheese);
        }

        // POST: Cheese/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Edit(int id, [Bind("CheeseId,Name,Price,QtyInStock,QtyOnOrder,Description,CountryId,SupplierName,PackageTypeId,StatusId,CategoryName,OrderId,ProductImage")] Cheese cheese)
        {
            if (id != cheese.CheeseId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                #region EDIT File Upload
                //retain old image file name so we can delete if a new file was uploaded
                string oldImageName = cheese.ProductImage;

                //Check if the user uploaded a file
                if (cheese.Image != null)
                {
                    //get the file's extension
                    string ext = Path.GetExtension(cheese.Image.FileName);

                    //list valid extensions
                    string[] validExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    //check the file's extension against the list of valid extensions
                    if (validExts.Contains(ext.ToLower()) && cheese.Image.Length < 4_194_303)
                    {
                        //generate a unique file name
                        cheese.ProductImage = Guid.NewGuid() + ext;
                        //build our file path to save the image
                        string webRootPath = _webHostEnvironment.WebRootPath;
                        string fullPath = webRootPath + "/images/";

                        //Delete the old image
                        if (oldImageName != "noimage.png")
                        {
                            ImageUtility.Delete(fullPath, oldImageName);
                        }

                        //Save the new image to webroot
                        using (var memoryStream = new MemoryStream())
                        {
                            await cheese.Image.CopyToAsync(memoryStream);
                            using (var img = Image.FromStream(memoryStream))
                            {
                                int maxImageSize = 500;
                                int maxThumbSize = 100;
                                ImageUtility.ResizeImage(fullPath, cheese.ProductImage, img, maxImageSize, maxThumbSize);
                            }
                        }

                    }
                }
                #endregion
                try
                {
                    _context.Update(cheese);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CheeseExists(cheese.CheeseId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryName", cheese.CategoryId);
            ViewData["CountryId"] = new SelectList(_context.CountryOfOrigins, "CountryId", "Country", cheese.CountryId);
            ViewData["PackageTypeId"] = new SelectList(_context.PackageTypes, "PackageTypeId", "PackageTypeId", cheese.PackageType);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName", cheese.StatusId);
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierName", "SupplierName", cheese.Supplier);
            return View(cheese);
        }

        // GET: Cheese/Delete/5
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Cheeses == null)
            {
                return NotFound();
            }

            var cheese = await _context.Cheeses
                .Include(c => c.Category)
                .Include(c => c.Country)
                .Include(c => c.PackageType)
                .Include(c => c.Status)
                .Include(c => c.Supplier)
                .FirstOrDefaultAsync(m => m.CheeseId == id);
            if (cheese == null)
            {
                return NotFound();
            }

            return View(cheese);
        }

        // POST: Cheese/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Cheeses == null)
            {
                return Problem("Entity set 'StoreFrontContext.Cheeses'  is null.");
            }
            var cheese = await _context.Cheeses.FindAsync(id);
            if (cheese != null)
            {
                _context.Cheeses.Remove(cheese);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CheeseExists(int id)
        {
          return (_context.Cheeses?.Any(e => e.CheeseId == id)).GetValueOrDefault();
        }
    }
}
