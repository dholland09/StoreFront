using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class Supplier
    {
        public Supplier()
        {
            Cheeses = new HashSet<Cheese>();
        }

        public int SupplierId { get; set; }
        public string SupplierName { get; set; } = null!;
        public string Address { get; set; } = null!;
        public string? City { get; set; }
        public string? State { get; set; }
        public string? Zip { get; set; }
        public string? Phone { get; set; }

        public virtual ICollection<Cheese> Cheeses { get; set; }
    }
}
