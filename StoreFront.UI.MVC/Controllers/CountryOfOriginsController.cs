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
    public class CountryOfOriginsController : Controller
    {
        private readonly StoreFrontContext _context;

        public CountryOfOriginsController(StoreFrontContext context)
        {
            _context = context;
        }

        // GET: CountryOfOrigins
        public async Task<IActionResult> Index()
        {
              return _context.CountryOfOrigins != null ? 
                          View(await _context.CountryOfOrigins.ToListAsync()) :
                          Problem("Entity set 'StoreFrontContext.CountryOfOrigins'  is null.");
        }

        // GET: CountryOfOrigins/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.CountryOfOrigins == null)
            {
                return NotFound();
            }

            var countryOfOrigin = await _context.CountryOfOrigins
                .FirstOrDefaultAsync(m => m.CountryId == id);
            if (countryOfOrigin == null)
            {
                return NotFound();
            }

            return View(countryOfOrigin);
        }

        // GET: CountryOfOrigins/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: CountryOfOrigins/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CountryId,Country")] CountryOfOrigin countryOfOrigin)
        {
            if (ModelState.IsValid)
            {
                _context.Add(countryOfOrigin);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(countryOfOrigin);
        }

        // GET: CountryOfOrigins/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.CountryOfOrigins == null)
            {
                return NotFound();
            }

            var countryOfOrigin = await _context.CountryOfOrigins.FindAsync(id);
            if (countryOfOrigin == null)
            {
                return NotFound();
            }
            return View(countryOfOrigin);
        }

        // POST: CountryOfOrigins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CountryId,Country")] CountryOfOrigin countryOfOrigin)
        {
            if (id != countryOfOrigin.CountryId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(countryOfOrigin);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CountryOfOriginExists(countryOfOrigin.CountryId))
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
            return View(countryOfOrigin);
        }

        // GET: CountryOfOrigins/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.CountryOfOrigins == null)
            {
                return NotFound();
            }

            var countryOfOrigin = await _context.CountryOfOrigins
                .FirstOrDefaultAsync(m => m.CountryId == id);
            if (countryOfOrigin == null)
            {
                return NotFound();
            }

            return View(countryOfOrigin);
        }

        // POST: CountryOfOrigins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.CountryOfOrigins == null)
            {
                return Problem("Entity set 'StoreFrontContext.CountryOfOrigins'  is null.");
            }
            var countryOfOrigin = await _context.CountryOfOrigins.FindAsync(id);
            if (countryOfOrigin != null)
            {
                _context.CountryOfOrigins.Remove(countryOfOrigin);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CountryOfOriginExists(int id)
        {
          return (_context.CountryOfOrigins?.Any(e => e.CountryId == id)).GetValueOrDefault();
        }
    }
}
