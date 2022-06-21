using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class Cheese
    {
        public Cheese()
        {
            OrderProducts = new HashSet<OrderProduct>();
        }

        public int CheeseId { get; set; }
        public string Name { get; set; } = null!;
        public decimal Price { get; set; }
        public string QtyInStock { get; set; } = null!;
        public string? QtyOnOrder { get; set; }
        public string? Description { get; set; }
        public int CountryId { get; set; }
        public int SupplierId { get; set; }
        public int PackageTypeId { get; set; }
        public int StatusId { get; set; }
        public int? CategoryId { get; set; }
        public int? OrderId { get; set; }
        public string? ProductImage { get; set; }

        public virtual Category? Category { get; set; }
        public virtual CountryOfOrigin? Country { get; set; } 
        public virtual PackageType? PackageType { get; set; }
        public virtual ProductStatus? Status { get; set; } 
        public virtual Supplier? Supplier { get; set; } 
        public virtual ICollection<OrderProduct> OrderProducts { get; set; }
    }
}
