using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class CountryOfOrigin
    {
        public CountryOfOrigin()
        {
            Cheeses = new HashSet<Cheese>();
        }

        public int CountryId { get; set; }
        public string Country { get; set; } = null!;

        public virtual ICollection<Cheese> Cheeses { get; set; }
    }
}
