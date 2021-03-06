USE [master]
GO
/****** Object:  Database [farmacia]    Script Date: 21/10/2017 09:36:33 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'farmacia')
BEGIN
CREATE DATABASE [farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'farmacia', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\farmacia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'farmacia_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\farmacia_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [farmacia] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [farmacia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [farmacia] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [farmacia] SET  DISABLE_BROKER 
GO
ALTER DATABASE [farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [farmacia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [farmacia]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DetalleCompra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DetalleCompra](
	[ID_Detalle] [uniqueidentifier] NOT NULL,
	[ID_Compra] [uniqueidentifier] NOT NULL,
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Total]  AS ([Precio]*[Cantidad]),
 CONSTRAINT [PK_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inventario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inventario](
	[ID_Inventario] [uniqueidentifier] NOT NULL,
	[Cantidad_Almacen] [int] NOT NULL,
	[ID_Sucursal] [uniqueidentifier] NOT NULL,
	[ID_Producto] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[ID_Inventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrdenCompra]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrdenCompra](
	[ID_Compra] [uniqueidentifier] NOT NULL,
	[ID_Proveedor] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_OrdenCompra] PRIMARY KEY CLUSTERED 
(
	[ID_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Producto](
	[ID_Producto] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[ID_Proveedor] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Direccion] [varchar](255) NOT NULL,
	[ID_Sucursal] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 21/10/2017 09:36:33 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[ID_Sucucrsal] [uniqueidentifier] NOT NULL,
	[Nombre_Sucursal] [varchar](50) NOT NULL,
	[Direccion] [varchar](250) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Responsable] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[ID_Sucucrsal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DetalleCompra] ([ID_Detalle], [ID_Compra], [ID_Producto], [Cantidad], [Precio]) VALUES (N'f6e4cef5-61ed-4ea7-95a5-172db82b73c3', N'7c3d090d-30f4-43cc-be4a-5f005423c1fc', N'40ea4134-61ec-42c4-bf7e-be15cf0c9601', 200, 25.0000)
INSERT [dbo].[DetalleCompra] ([ID_Detalle], [ID_Compra], [ID_Producto], [Cantidad], [Precio]) VALUES (N'16c9ec1c-a245-445c-b2bf-4dff3417cbc3', N'7e217251-49aa-46a7-8563-38f703435d32', N'b44b6d31-1bfc-4cf3-a48e-72caecd3d33b', 500, 15.0000)
INSERT [dbo].[DetalleCompra] ([ID_Detalle], [ID_Compra], [ID_Producto], [Cantidad], [Precio]) VALUES (N'435b9038-97a8-41d1-a7a3-698c5af8eecc', N'7636db16-59a5-4dab-a83e-6397a35fe4fb', N'12ad5b3c-eb54-4ea1-9a4d-cbbb2708d255', 150, 70.0000)
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad_Almacen], [ID_Sucursal], [ID_Producto]) VALUES (N'7fc835c9-3b1d-4596-a1f6-446305df2e31', 450, N'40ea4134-61ec-42c4-bf7e-be15cf0c9601', N'3be6e4b9-8737-4913-ae98-aa29db49230f')
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad_Almacen], [ID_Sucursal], [ID_Producto]) VALUES (N'3eb68352-f5c5-4243-9bf2-99e5b6e9bdde', 500, N'12ad5b3c-eb54-4ea1-9a4d-cbbb2708d255', N'8a713c66-5e80-42d1-9e47-8422e5fda0c9')
INSERT [dbo].[Inventario] ([ID_Inventario], [Cantidad_Almacen], [ID_Sucursal], [ID_Producto]) VALUES (N'1f24458c-ce5b-42da-923b-eaab5bf37a6f', 300, N'40ea4134-61ec-42c4-bf7e-be15cf0c9601', N'b44b6d31-1bfc-4cf3-a48e-72caecd3d33b')
INSERT [dbo].[OrdenCompra] ([ID_Compra], [ID_Proveedor], [Fecha]) VALUES (N'7e217251-49aa-46a7-8563-38f703435d32', N'46c2b666-ecb6-4fc6-ba7f-b42e984a9ff3', CAST(0x233D0B00 AS Date))
INSERT [dbo].[OrdenCompra] ([ID_Compra], [ID_Proveedor], [Fecha]) VALUES (N'7c3d090d-30f4-43cc-be4a-5f005423c1fc', N'018d5a0e-fa12-4b32-b6cf-84f00d6a4be6', CAST(0x313D0B00 AS Date))
INSERT [dbo].[OrdenCompra] ([ID_Compra], [ID_Proveedor], [Fecha]) VALUES (N'7636db16-59a5-4dab-a83e-6397a35fe4fb', N'13e3d160-1432-4517-8cb9-4198915884a3', CAST(0x023D0B00 AS Date))
INSERT [dbo].[Producto] ([ID_Producto], [Nombre], [Precio], [Tipo]) VALUES (N'b44b6d31-1bfc-4cf3-a48e-72caecd3d33b', N'Tabcin', 90.0000, N'antigripal')
INSERT [dbo].[Producto] ([ID_Producto], [Nombre], [Precio], [Tipo]) VALUES (N'40ea4134-61ec-42c4-bf7e-be15cf0c9601', N'diclofenaco', 50.0000, N'analgesico')
INSERT [dbo].[Producto] ([ID_Producto], [Nombre], [Precio], [Tipo]) VALUES (N'12ad5b3c-eb54-4ea1-9a4d-cbbb2708d255', N'XL3', 100.0000, N'antigripal')
INSERT [dbo].[Producto] ([ID_Producto], [Nombre], [Precio], [Tipo]) VALUES (N'09e8f59f-a519-4fd5-8f4f-ddef78ce21b0', N'Advil', 70.0000, N'analgesico')
INSERT [dbo].[Producto] ([ID_Producto], [Nombre], [Precio], [Tipo]) VALUES (N'f700bc11-5969-4c70-98e7-efaa9ab1bac0', N'Aspirina', 20.0000, N'analgesico')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Telefono], [Direccion], [ID_Sucursal]) VALUES (N'13e3d160-1432-4517-8cb9-4198915884a3', N'LabFarm', 7154820, N'Benito Juarez #192-5', N'd02b2a3f-fc42-47a1-9447-3dce7a831ceb')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Telefono], [Direccion], [ID_Sucursal]) VALUES (N'018d5a0e-fa12-4b32-b6cf-84f00d6a4be6', N'Laboratorios Monterrey', 4102501, N'Blvd. Acapulco "#45', N'8a713c66-5e80-42d1-9e47-8422e5fda0c9')
INSERT [dbo].[Proveedor] ([ID_Proveedor], [Nombre], [Telefono], [Direccion], [ID_Sucursal]) VALUES (N'46c2b666-ecb6-4fc6-ba7f-b42e984a9ff3', N'ABCLab', 4152944, N'San Francisco #414', N'd02b2a3f-fc42-47a1-9447-3dce7a831ceb')
INSERT [dbo].[Sucursal] ([ID_Sucucrsal], [Nombre_Sucursal], [Direccion], [Telefono], [Responsable]) VALUES (N'd02b2a3f-fc42-47a1-9447-3dce7a831ceb', N'Sucursal Guadalupe', N'Revolución #570', N'81125675', N'Juan Garza')
INSERT [dbo].[Sucursal] ([ID_Sucucrsal], [Nombre_Sucursal], [Direccion], [Telefono], [Responsable]) VALUES (N'8a713c66-5e80-42d1-9e47-8422e5fda0c9', N'Sucursal San Nicolás', N'Nogalar #25', N'81125675', N'Lizbeth Salazar')
INSERT [dbo].[Sucursal] ([ID_Sucucrsal], [Nombre_Sucursal], [Direccion], [Telefono], [Responsable]) VALUES (N'3be6e4b9-8737-4913-ae98-aa29db49230f', N'Sucursal Monterrey', N'Av Miguel Alemán  #803', N'81285236', N'Adriana Ramirez')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleCompra_OrdenCompra]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleCompra]'))
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_OrdenCompra] FOREIGN KEY([ID_Compra])
REFERENCES [dbo].[OrdenCompra] ([ID_Compra])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleCompra_OrdenCompra]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleCompra]'))
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_OrdenCompra]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleCompra_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleCompra]'))
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Producto] FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DetalleCompra_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[DetalleCompra]'))
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([ID_Sucursal])
REFERENCES [dbo].[Producto] ([ID_Producto])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Inventario_Producto]') AND parent_object_id = OBJECT_ID(N'[dbo].[Inventario]'))
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrdenCompra_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrdenCompra]'))
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_Proveedor] FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedor] ([ID_Proveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrdenCompra_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrdenCompra]'))
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Proveedor_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Proveedor]'))
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_Sucursal] FOREIGN KEY([ID_Sucursal])
REFERENCES [dbo].[Sucursal] ([ID_Sucucrsal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Proveedor_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Proveedor]'))
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [farmacia] SET  READ_WRITE 
GO
