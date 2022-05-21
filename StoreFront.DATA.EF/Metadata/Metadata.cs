using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.DATA.EF.Models//Metadata
{

    #region Category
    public class CategoryMetadata { 

        
    public int CategoryId { get; set; }

        [Required(ErrorMessage = "Category Name is required")]
        [MaxLength(50)]
        [Display(Name="Category")]
    public string CategoryName { get; set; } = null!;
    }
    #endregion

    #region Cheese
    public class CheeseMetadata
    {
        public int CheeseId { get; set; }

        [Required]
        [StringLength(50)]

        public string Name { get; set; } = null!;

        [Required(ErrorMessage ="Price is required")]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:c}")]
        [Range(0, (double)decimal.MaxValue)]
        public decimal Price { get; set; }

        [Required]
        [StringLength(10)]
        [Display(Name = "Quantity in Stock")]
        public string QtyInStock { get; set; } = null!;

        [StringLength(10)]
        [Display(Name = "Quantity in Stock")]
        public string? QtyOnOrder { get; set; }

        
        [StringLength(150)]
        public string? Description { get; set; }

        [Required]
        [Display(Name="Country Id")]
        public int CountryId { get; set; }

        [Required]
        [Display(Name = "Supplier Id")]
        public int SupplierId { get; set; }

        [Required]
        [Display(Name = "Package Type Id")]
        public int PackageTypeId { get; set; }

        [Required]
        [Display(Name = "Status Id")]
        public int StatusId { get; set; }

      
        [Display(Name = "Category Id")]
        public int? CategoryId { get; set; }
        
        [Display(Name = "Order Id")]
        public int? OrderId { get; set; }

        [StringLength(75)]
        public string? ProductImage { get; set; }
    }
    #endregion

    #region CountryOfOrigin
    public class CountryOfOriginMetadata
    {
        public int CountryId { get; set; }

        [Required]
        [StringLength(50)]
        public string Country { get; set; } = null!;
    }

    #endregion

    #region Order
    public class OrderMetadata
    {
        public int OrderId { get; set; }
        public string UserId { get; set; } = null!;

        [Required]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        [Display(Name = "Order Date")]
        public DateTime OrderDate { get; set; }

        [StringLength(100)]
        [Display(Name = "Ship To")]
        [Required]
        public string ShipToName { get; set; } = null!;

        [StringLength(50)]
        [Display(Name = "City")]
        [Required]
        public string ShipCity { get; set; } = null!;

        [StringLength(2)]
        [Display(Name = "State")]
        public string? ShipState { get; set; }

        [StringLength(5)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        [Required]
        public string ShipZip { get; set; } = null!;
    }
    #endregion

    #region PackageType
    public class PackageTypeMetadata
    {
        public int PackageTypeId { get; set; }

        [StringLength(100)]
        [Display(Name ="Package Type")]
        public string? PackageType1 { get; set; }

        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        public string? Description { get; set; }
    }
    #endregion

    #region ProductStatus
    public class ProductStatusMetadata
    {
        public int StatusId { get; set; }

        [Required]
        [StringLength(20)]
        [Display(Name ="Status")]
        public string StatusName { get; set; } = null!;

        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        public string? Description { get; set; }
    }
    #endregion

    #region Supplier
    public class SupplierMetadata
    {
        public int SupplierId { get; set; }

        [Required]
        [StringLength(100)]
        [Display(Name ="Supplier")]
        public string SupplierName { get; set; } = null!;

        [Required]
        [StringLength(150)]

        public string Address { get; set; } = null!;

        [StringLength(100)]
        public string? City { get; set; }

        [StringLength(2)]
        public string? State { get; set; }

        [StringLength(5)]
        public string? Zip { get; set; }

        [StringLength(24)]
        [DataType(DataType.PhoneNumber)]
        public string? Phone { get; set; }
    }
    #endregion

    #region UserDetail
    public class UserDetailMetadata
    {
        public string UserId { get; set; } = null!;
        
        [Required]
        [StringLength(50)]
        [Display(Name ="First Name")]
        public string FirstName { get; set; } = null!;

        [Required]
        [StringLength(50)]
        [Display(Name = "Last Name")]
        public string LastName { get; set; } = null!;

        [StringLength(150)]
        [Display(Name = "Address")]
        public string? Address { get; set; }

        [StringLength(50)]
        [Display(Name = "City")]
        public string? City { get; set; }

        [StringLength(2)]
        [Display(Name = "State")]
        public string? State { get; set; }

        [StringLength(5)]
        [Display(Name = "Zip")]
        [DataType(DataType.PostalCode)]
        public string? Zip { get; set; }

        [StringLength(24)]
        [DataType(DataType.PhoneNumber)]
        public string? Phone { get; set; }
    }
    #endregion

}
