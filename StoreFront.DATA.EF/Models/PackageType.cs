using System;
using System.Collections.Generic;

namespace StoreFront.DATA.EF.Models
{
    public partial class PackageType
    {
        public PackageType()
        {
            Cheeses = new HashSet<Cheese>();
        }

        public int PackageTypeId { get; set; }
        public string? PackageType1 { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Cheese> Cheeses { get; set; }
    }
}
