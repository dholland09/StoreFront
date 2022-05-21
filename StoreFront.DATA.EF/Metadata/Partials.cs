using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.DATA.EF.Models//Metadata
{
    #region Category
    [ModelMetadataType(typeof(CategoryMetadata))]
    public partial class Category { }
    #endregion

    #region Cheese
    [ModelMetadataType(typeof(CheeseMetadata))]
    public partial class Cheese { }

    #endregion

    #region CountryOfOrigin
    [ModelMetadataType(typeof(CountryOfOriginMetadata))]
    public partial class CountryOfOrigin { }

    #endregion

    #region Order
    [ModelMetadataType(typeof(OrderMetadata))]
    public partial class Order { }

    #endregion

    #region PackageType
    [ModelMetadataType(typeof(PackageTypeMetadata))]
    public partial class PackageType { }

    #endregion

    #region ProductStatus
    [ModelMetadataType(typeof(ProductStatusMetadata))]
    public partial class ProductStatus { }

    #endregion

    #region Supplier
    [ModelMetadataType(typeof(SupplierMetadata))]
    public partial class Supplier { }

    #endregion

    #region UserDetail
    [ModelMetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail { }

    #endregion
}
