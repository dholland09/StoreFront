using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class Category
    {
        public Category()
        {
            Cheeses = new HashSet<Cheese>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;

        public virtual ICollection<Cheese> Cheeses { get; set; }
    }
}
