using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class OrderProduct
    {
        public int OrderProductId { get; set; }
        public int CheeseId { get; set; }
        public int OrderId { get; set; }
        public short? Quantity { get; set; }
        public decimal? Price { get; set; }

        public virtual Cheese Cheese { get; set; } = null!;
        public virtual Order Order { get; set; } = null!;
    }
}
