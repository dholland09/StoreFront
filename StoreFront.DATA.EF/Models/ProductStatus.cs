using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class ProductStatus
    {
        public ProductStatus()
        {
            Cheeses = new HashSet<Cheese>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; } = null!;
        public string? Description { get; set; }

        public virtual ICollection<Cheese> Cheeses { get; set; }
    }
}
