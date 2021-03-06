USE [ExpoApplDB]
GO
/****** Object:  User [ExpoApplDBUser]    Script Date: 06/04/2016 23:06:13 ******/
CREATE USER [ExpoApplDBUser] FOR LOGIN [ExpoApplDBUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ExpoApplDBUser]
GO
/****** Object:  Table [dbo].[Pricing]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing](
	[PricingID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Pricing] PRIMARY KEY CLUSTERED 
(
	[PricingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Pricing] ON 

INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (1, 1, 1, 5)
INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (2, 1, 2, 8)
INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (3, 1, 3, 12)
INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (4, 2, 1, 6)
INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (5, 2, 2, 9)
INSERT [dbo].[Pricing] ([PricingID], [SupplierID], [ProductID], [Price]) VALUES (6, 2, 3, 4)
SET IDENTITY_INSERT [dbo].[Pricing] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName]) VALUES (1, N'Small wongle')
INSERT [dbo].[Products] ([ProductID], [ProductName]) VALUES (2, N'Large wongle')
INSERT [dbo].[Products] ([ProductID], [ProductName]) VALUES (3, N'Super wongle')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName]) VALUES (1, N'New Co Ltd')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName]) VALUES (2, N'Old Co Ltd')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Products]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Suppliers]
GO
/****** Object:  StoredProcedure [dbo].[proc_DetailsTablewithProdID]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemanth Naresh
-- Create date: 06th April 2016
-- Description:	gets the details table with product Id
-- =============================================
CREATE PROCEDURE [dbo].[proc_DetailsTablewithProdID]
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.SupplierName, pr.ProductName, p.Price from Pricing as p 
	join Suppliers as s on s.SupplierID = p.SupplierID
	join Products as pr on pr.ProductID = p.ProductID
	where pr.ProductID = @id

END

GO
/****** Object:  StoredProcedure [dbo].[proc_DetailsTablewithSupplierAndProdIDs]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemanth Naresh
-- Create date: 06th April 2016
-- Description:	gets the details table with Supplier Id
-- =============================================
CREATE PROCEDURE [dbo].[proc_DetailsTablewithSupplierAndProdIDs]
	-- Add the parameters for the stored procedure here
	@pid as int, @sid as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.SupplierName, pr.ProductName, p.Price from Pricing as p 
	join Suppliers as s on s.SupplierID = p.SupplierID
	join Products as pr on pr.ProductID = p.ProductID
	where s.SupplierID = @sid and pr.ProductID = @pid

END

GO
/****** Object:  StoredProcedure [dbo].[proc_DetailsTablewithSupplierID]    Script Date: 06/04/2016 23:06:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemanth Naresh
-- Create date: 06th April 2016
-- Description:	gets the details table with Supplier Id
-- =============================================
CREATE PROCEDURE [dbo].[proc_DetailsTablewithSupplierID]
	-- Add the parameters for the stored procedure here
	@id as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT s.SupplierName, pr.ProductName, p.Price from Pricing as p 
	join Suppliers as s on s.SupplierID = p.SupplierID
	join Products as pr on pr.ProductID = p.ProductID
	where s.SupplierID = @id

END

GO
