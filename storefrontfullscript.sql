ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK_Orders_UserDeatils]
GO
ALTER TABLE [dbo].[OrderProducts] DROP CONSTRAINT [FK_OrderProducts_Orders]
GO
ALTER TABLE [dbo].[OrderProducts] DROP CONSTRAINT [FK_OrderProducts_Cheeses]
GO
ALTER TABLE [dbo].[Cheeses] DROP CONSTRAINT [FK_Cheeses_Suppliers]
GO
ALTER TABLE [dbo].[Cheeses] DROP CONSTRAINT [FK_Cheeses_ProductStatuses]
GO
ALTER TABLE [dbo].[Cheeses] DROP CONSTRAINT [FK_Cheeses_PackageTypes]
GO
ALTER TABLE [dbo].[Cheeses] DROP CONSTRAINT [FK_Cheeses_CountryOfOrigin]
GO
ALTER TABLE [dbo].[Cheeses] DROP CONSTRAINT [FK_Cheeses_Categories1]
GO
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[ProductStatuses] DROP CONSTRAINT [DF_ProductStatuses_Backordered]
GO
ALTER TABLE [dbo].[ProductStatuses] DROP CONSTRAINT [DF_ProductStatuses_IsDiscontinued]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
DROP TABLE [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatuses]') AND type in (N'U'))
DROP TABLE [dbo].[ProductStatuses]
GO
/****** Object:  Table [dbo].[PackageTypes]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PackageTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PackageTypes]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
DROP TABLE [dbo].[Orders]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderProducts]') AND type in (N'U'))
DROP TABLE [dbo].[OrderProducts]
GO
/****** Object:  Table [dbo].[CountryOfOrigin]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CountryOfOrigin]') AND type in (N'U'))
DROP TABLE [dbo].[CountryOfOrigin]
GO
/****** Object:  Table [dbo].[Cheeses]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cheeses]') AND type in (N'U'))
DROP TABLE [dbo].[Cheeses]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserTokens]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserTokens]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/6/2022 2:59:03 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoleClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoleClaims]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cheeses]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheeses](
	[CheeseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[QtyInStock] [nchar](10) NOT NULL,
	[QtyOnOrder] [nchar](10) NULL,
	[Description] [varchar](500) NULL,
	[CountryId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[PackageTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CategoryId] [int] NULL,
	[OrderId] [int] NULL,
	[ProductImage] [varchar](75) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[CheeseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryOfOrigin]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryOfOrigin](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CountryOfOrigin] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProducts]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProducts](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[CheeseId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [smallint] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_OrderProducts] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](120) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShipToName] [varchar](100) NOT NULL,
	[ShipCity] [varchar](50) NOT NULL,
	[ShipState] [char](2) NULL,
	[ShipZip] [char](5) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageTypes]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageTypes](
	[PackageTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PackageType] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PackageTypes] PRIMARY KEY CLUSTERED 
(
	[PackageTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStatuses]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStatuses](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](20) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_ProductStatuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](100) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[City] [varchar](100) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [varchar](24) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 6/6/2022 2:59:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](120) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](150) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Phone] [varchar](24) NULL,
 CONSTRAINT [PK_UserDeatils] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'c80a8fd1-6b00-42db-b44f-4eb153cb6379', N'Admin', N'ADMIN', N'd1ce9856-9df3-4d6a-b592-bd41eac82e11')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd4c248e9-4e64-4887-81c5-9321b89902c8', N'c80a8fd1-6b00-42db-b44f-4eb153cb6379')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd4c248e9-4e64-4887-81c5-9321b89902c8', N'dholland@live.com', N'DHOLLAND@LIVE.COM', N'dholland@live.com', N'DHOLLAND@LIVE.COM', 1, N'AQAAAAEAACcQAAAAEGggGjFj8442oMixNLdseZcMwlRXQWTYAwLBX2eLz5hQbYt/+UlykCAqyBDFq9TKjw==', N'BYFNMMY2HXFMVG33M6U7YXC3C3GC762L', N'f34ea6c3-e7ac-45ca-87e7-b12762be691a', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Aged')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Non-Aged')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cheeses] ON 

INSERT [dbo].[Cheeses] ([CheeseId], [Name], [Price], [QtyInStock], [QtyOnOrder], [Description], [CountryId], [SupplierId], [PackageTypeId], [StatusId], [CategoryId], [OrderId], [ProductImage]) VALUES (1, N'Smoked Gouda', 5.9900, N'25        ', N'12        ', N'Smoked in anvient brick ovens over flaming hicory chip embers.', 3, 2, 4, 1, NULL, 2, NULL)
INSERT [dbo].[Cheeses] ([CheeseId], [Name], [Price], [QtyInStock], [QtyOnOrder], [Description], [CountryId], [SupplierId], [PackageTypeId], [StatusId], [CategoryId], [OrderId], [ProductImage]) VALUES (2, N'Havarti', 4.7900, N'12        ', N'15        ', N'Semi-soft Danish-Style cheese made from cow''s milk and can be easily sliced, grilled, or melted..', 2, 5, 5, 1, NULL, 2, NULL)
INSERT [dbo].[Cheeses] ([CheeseId], [Name], [Price], [QtyInStock], [QtyOnOrder], [Description], [CountryId], [SupplierId], [PackageTypeId], [StatusId], [CategoryId], [OrderId], [ProductImage]) VALUES (3, N'Mozzarella', 19.8900, N'42        ', N'8         ', N'Smooth, pliable consistency, molded into spheres or ovals and stored in water to keep it moist.', 1, 4, 4, 1, NULL, 2, NULL)
INSERT [dbo].[Cheeses] ([CheeseId], [Name], [Price], [QtyInStock], [QtyOnOrder], [Description], [CountryId], [SupplierId], [PackageTypeId], [StatusId], [CategoryId], [OrderId], [ProductImage]) VALUES (4, N'Muenster', 6.7900, N'4         ', N'18        ', N'Made from cow''s milk with a sweet and nutty seasoning.', 5, 3, 1, 1, NULL, 2, NULL)
INSERT [dbo].[Cheeses] ([CheeseId], [Name], [Price], [QtyInStock], [QtyOnOrder], [Description], [CountryId], [SupplierId], [PackageTypeId], [StatusId], [CategoryId], [OrderId], [ProductImage]) VALUES (5, N'Pepper Jack', 3.9900, N'36        ', N'14        ', N'Semi-sfot cheese with open texture and spicy flavor.', 4, 1, 2, 1, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Cheeses] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryOfOrigin] ON 

INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (1, N'France')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (2, N'Mexico')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (3, N'Greece')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (4, N'Switzerland')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (5, N'England')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (6, N'Netherlands')
INSERT [dbo].[CountryOfOrigin] ([CountryId], [Country]) VALUES (7, N'Italy')
SET IDENTITY_INSERT [dbo].[CountryOfOrigin] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageTypes] ON 

INSERT [dbo].[PackageTypes] ([PackageTypeId], [PackageType], [Description]) VALUES (1, N'Sliced', N'Thick Sliced')
INSERT [dbo].[PackageTypes] ([PackageTypeId], [PackageType], [Description]) VALUES (2, N'Shredded', N'Finely Shredded ')
INSERT [dbo].[PackageTypes] ([PackageTypeId], [PackageType], [Description]) VALUES (3, N'Wheel', NULL)
INSERT [dbo].[PackageTypes] ([PackageTypeId], [PackageType], [Description]) VALUES (4, N'Block', NULL)
INSERT [dbo].[PackageTypes] ([PackageTypeId], [PackageType], [Description]) VALUES (5, N'Wedge', NULL)
SET IDENTITY_INSERT [dbo].[PackageTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStatuses] ON 

INSERT [dbo].[ProductStatuses] ([StatusId], [StatusName], [Description]) VALUES (1, N'In Stock', N'0')
INSERT [dbo].[ProductStatuses] ([StatusId], [StatusName], [Description]) VALUES (2, N'Out Of Stock', N'0')
SET IDENTITY_INSERT [dbo].[ProductStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Address], [City], [State], [Zip], [Phone]) VALUES (1, N'Stracke, Oberbrunner and McLaughlin', N'68684 Miller Terrace', N'Yitulihe', NULL, NULL, N'346-178-6566')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Address], [City], [State], [Zip], [Phone]) VALUES (2, N'Thiel-Lockman', N'20 Rigney Plaza', N'Bungsuan', NULL, N'1105 ', N'890-866-0115')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Address], [City], [State], [Zip], [Phone]) VALUES (3, N'Kohler, Littel and Heller', N'0548 Clove Alley', N'Bosanski Novi', NULL, NULL, N'122-929-0970')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Address], [City], [State], [Zip], [Phone]) VALUES (4, N'Haag, Cruickshank and Botsford', N'22 Russell Junction', N'Little Baguio', NULL, N'4703 ', N'167-852-0842')
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierName], [Address], [City], [State], [Zip], [Phone]) VALUES (5, N'Gutkowski-Corkery', N'3 Fuller Street', N'Maoshan', NULL, NULL, N'950-534-5941')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone]) VALUES (N'd4c248e9-4e64-4887-81c5-9321b89902c8', N'Derek', N'Holland', N'2621 No Where', N'Wentzville', N'MO', N'55555', N'5555555555')
GO
ALTER TABLE [dbo].[ProductStatuses] ADD  CONSTRAINT [DF_ProductStatuses_IsDiscontinued]  DEFAULT ((0)) FOR [StatusName]
GO
ALTER TABLE [dbo].[ProductStatuses] ADD  CONSTRAINT [DF_ProductStatuses_Backordered]  DEFAULT ((0)) FOR [Description]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Cheeses]  WITH CHECK ADD  CONSTRAINT [FK_Cheeses_Categories1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Cheeses] CHECK CONSTRAINT [FK_Cheeses_Categories1]
GO
ALTER TABLE [dbo].[Cheeses]  WITH CHECK ADD  CONSTRAINT [FK_Cheeses_CountryOfOrigin] FOREIGN KEY([CountryId])
REFERENCES [dbo].[CountryOfOrigin] ([CountryId])
GO
ALTER TABLE [dbo].[Cheeses] CHECK CONSTRAINT [FK_Cheeses_CountryOfOrigin]
GO
ALTER TABLE [dbo].[Cheeses]  WITH CHECK ADD  CONSTRAINT [FK_Cheeses_PackageTypes] FOREIGN KEY([PackageTypeId])
REFERENCES [dbo].[PackageTypes] ([PackageTypeId])
GO
ALTER TABLE [dbo].[Cheeses] CHECK CONSTRAINT [FK_Cheeses_PackageTypes]
GO
ALTER TABLE [dbo].[Cheeses]  WITH CHECK ADD  CONSTRAINT [FK_Cheeses_ProductStatuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ProductStatuses] ([StatusId])
GO
ALTER TABLE [dbo].[Cheeses] CHECK CONSTRAINT [FK_Cheeses_ProductStatuses]
GO
ALTER TABLE [dbo].[Cheeses]  WITH CHECK ADD  CONSTRAINT [FK_Cheeses_Suppliers] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([SupplierId])
GO
ALTER TABLE [dbo].[Cheeses] CHECK CONSTRAINT [FK_Cheeses_Suppliers]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Cheeses] FOREIGN KEY([CheeseId])
REFERENCES [dbo].[Cheeses] ([CheeseId])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Cheeses]
GO
ALTER TABLE [dbo].[OrderProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrderProducts_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderProducts] CHECK CONSTRAINT [FK_OrderProducts_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserDeatils] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UserDeatils]
GO
