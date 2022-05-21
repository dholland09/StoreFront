using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using StoreFront.DATA.EF.Models;

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
        public async Task<IActionResult> Index()
        {
            var storeFrontContext = _context.Cheeses.Include(c => c.Category).Include(c => c.Country).Include(c => c.PackageType).Include(c => c.Status).Include(c => c.Supplier);
            return View(await storeFrontContext.ToListAsync());
        }

        // GET: Cheese/Details/5
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
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName", cheese.StatusId);
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierId", "Address", cheese.SupplierId);
            return View(cheese);
        }

        // GET: Cheese/Edit/5
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
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierId", "Address", cheese.SupplierId);
            return View(cheese);
        }

        // POST: Cheese/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CheeseId,Name,Price,QtyInStock,QtyOnOrder,Description,CountryId,SupplierId,PackageTypeId,StatusId,CategoryId,OrderId,ProductImage")] Cheese cheese)
        {
            if (id != cheese.CheeseId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
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
            ViewData["PackageTypeId"] = new SelectList(_context.PackageTypes, "PackageTypeId", "PackageTypeId", cheese.PackageTypeId);
            ViewData["StatusId"] = new SelectList(_context.ProductStatuses, "StatusId", "StatusName", cheese.StatusId);
            ViewData["SupplierId"] = new SelectList(_context.Suppliers, "SupplierId", "Address", cheese.SupplierId);
            return View(cheese);
        }

        // GET: Cheese/Delete/5
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
