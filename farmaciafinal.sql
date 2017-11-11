USE [master]
GO
/****** Object:  Database [FarmacialPos]    Script Date: 11/11/2017 05:27:53 p. m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'FarmacialPos')
BEGIN
CREATE DATABASE [FarmacialPos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmacialPos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmacialPos.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmacialPos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmacialPos_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Modern_Spanish_CI_AS
END

GO
ALTER DATABASE [FarmacialPos] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmacialPos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmacialPos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmacialPos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmacialPos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmacialPos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmacialPos] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmacialPos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmacialPos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmacialPos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmacialPos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmacialPos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmacialPos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmacialPos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmacialPos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmacialPos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmacialPos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmacialPos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmacialPos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmacialPos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmacialPos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmacialPos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmacialPos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmacialPos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmacialPos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmacialPos] SET  MULTI_USER 
GO
ALTER DATABASE [FarmacialPos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmacialPos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmacialPos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmacialPos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FarmacialPos] SET DELAYED_DURABILITY = DISABLED 
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [LAPTOP-NMFKEL6I\lizy_]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'LAPTOP-NMFKEL6I\lizy_')
CREATE LOGIN [LAPTOP-NMFKEL6I\lizy_] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Usuarios')
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'%é|?öÂfH{³À¤;©-¥»OÜÛì', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'­ù¼§$Ø	Y@ãwÊKåèèÃæ¯Ãàd_þÔÄH', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [LAPTOP-NMFKEL6I\lizy_]
GO
USE [FarmacialPos]
GO
/****** Object:  UserDefinedFunction [dbo].[descuento]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[descuento]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[descuento](@descuento [money], @id_venta [varchar](255))
RETURNS [money] WITH EXECUTE AS CALLER
AS 
begin
declare @cantidad int; 
declare @precio money;
select @precio = v.total from VentaTotal v where @id_venta = id
select @cantidad = @precio * @descuento
return @precio - @cantidad
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[iva]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iva]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[iva](@totalpesos [money])
RETURNS [money] WITH EXECUTE AS CALLER
AS 
begin
return @totalpesos * 1.16
end' 
END

GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CLIENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CLIENTE](
	[ID_CLIENTE] [uniqueidentifier] NOT NULL,
	[NOMBRE] [varchar](75) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[APELLIDOS] [varchar](75) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TELEFONO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DIRECCION] [varchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORREO] [varchar](150) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RFC] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DETALLE_COMPRA]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DETALLE_COMPRA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DETALLE_COMPRA](
	[ID_DETALLE_COMPRA] [uniqueidentifier] NOT NULL,
	[ID_ORDEN_COMPRA] [uniqueidentifier] NOT NULL,
	[ID_PRODUCTO] [uniqueidentifier] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[PRECIO] [float] NOT NULL,
	[TOTAL]  AS ([PRECIO]*[CANTIDAD]),
 CONSTRAINT [PK_DETALLE_COMPRA_1] PRIMARY KEY CLUSTERED 
(
	[ID_DETALLE_COMPRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLEADO](
	[ID_EMPLEADO] [uniqueidentifier] NOT NULL,
	[ID_PUESTO] [uniqueidentifier] NOT NULL,
	[NOMBRE] [varchar](75) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[APELLIDOS] [varchar](75) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TELEFONO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORREO] [varchar](150) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[ID_EMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FACTURA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FACTURA](
	[ID_FACTURA] [uniqueidentifier] NOT NULL,
	[FECHA] [date] NOT NULL,
	[ID_CLIENTE] [uniqueidentifier] NOT NULL,
	[ID_VENTA] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FACTURA] PRIMARY KEY CLUSTERED 
(
	[ID_FACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ID_VENTA_EMPLEADO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ID_VENTA_EMPLEADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ID_VENTA_EMPLEADO](
	[ID_VENTA] [uniqueidentifier] NOT NULL,
	[ID_EMPLEADO] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ID_VENTA_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[ID_VENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ID_VENTA_PRODUCTO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ID_VENTA_PRODUCTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ID_VENTA_PRODUCTO](
	[ID_VENTA] [uniqueidentifier] NOT NULL,
	[ID_PRODUCTO] [uniqueidentifier] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[PRECIO] [float] NOT NULL,
	[SUBTOTAL]  AS ([precio]*[cantidad]),
	[FECHA] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[INVENTARIO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INVENTARIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[INVENTARIO](
	[ID_PRODUCTO] [uniqueidentifier] NOT NULL,
	[CANTIDAD_ALMACEN] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTO_ALMACEN] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ORDEN_COMPRA]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ORDEN_COMPRA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ORDEN_COMPRA](
	[ID_ORDEN_COMPRA] [uniqueidentifier] NOT NULL,
	[ID_PROVEEDOR] [uniqueidentifier] NOT NULL,
	[FECHA_ORDEN_COMPRA] [date] NOT NULL,
 CONSTRAINT [PK_ORDEN_COMPRA] PRIMARY KEY CLUSTERED 
(
	[ID_ORDEN_COMPRA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODUCTO](
	[ID_PRODUCTO] [uniqueidentifier] NOT NULL,
	[NOMBRE_PRODUCTO] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CONCENTRACIÓN] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[FORMA_FARMACEUTICA] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PRECIO] [float] NOT NULL,
	[ID_PROVEEDOR] [uniqueidentifier] NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROVEEDOR]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROVEEDOR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROVEEDOR](
	[ID_PROVEEDOR] [uniqueidentifier] NOT NULL,
	[NOMBRE] [varchar](75) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TELEFONO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DIRECCION] [varchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CORREO] [varchar](150) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_PROVEEDOR] PRIMARY KEY CLUSTERED 
(
	[ID_PROVEEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PUESTO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PUESTO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PUESTO](
	[ID_PUESTO] [uniqueidentifier] NOT NULL,
	[TIPO] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[SUELDO] [money] NOT NULL,
 CONSTRAINT [PK_PUESTO] PRIMARY KEY CLUSTERED 
(
	[ID_PUESTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USUARIOS](
	[ID_USUARIO] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PASSWORD] [varchar](25) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ID_EMPLEADO] [uniqueidentifier] NOT NULL,
	[ADMINISTRADOR] [bit] NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VentaTotal]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VentaTotal]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[VentaTotal] as
select ve.id_venta as ID, e.nombre as NombreEmpleado, e.apellidos as ApellidosEmpleado, vp.fecha as Fecha, SUM(vp.Subtotal) as Total
from id_venta_Empleado ve
inner join id_venta_producto vp on ve.ID_venta = vp.ID_venta
inner join empleado e on ve.id_empleado = e.id_empleado
Group by ve.id_venta, vp.fecha, e.nombre, e.apellidos, vp.fecha' 
GO
/****** Object:  View [dbo].[TotalFactura]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TotalFactura]'))
EXEC dbo.sp_executesql @statement = N'
create view [dbo].[TotalFactura] as
select c.nombre as NombreCliente, c.apellidos as ApellidosClientes, f.fecha as FechaFactura, vt.total as Total
from factura f 
inner join cliente c on f.Id_cliente = c.id_cliente
inner join VentaTotal vt on f.id_venta = vt.id
' 
GO
/****** Object:  View [dbo].[Detalle_Producto_porTipo]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Detalle_Producto_porTipo]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[Detalle_Producto_porTipo] as
select p.forma_farmaceutica as Tipo,  SUM(d.precio) as PrecioTotal, SUM(d.cantidad) as CantidadTotal
from Detalle_Compra d
join Producto p on d.ID_producto = p.ID_Producto
Group by p.forma_farmaceutica' 
GO
/****** Object:  View [dbo].[FechaOrdenCompraProveedor]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[FechaOrdenCompraProveedor]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[FechaOrdenCompraProveedor] as 

select PROVEEDOR.NOMBRE, ORDEN_COMPRA.FECHA_ORDEN_COMPRA
FROM PROVEEDOR

left join ORDEN_COMPRA ON PROVEEDOR.ID_PROVEEDOR = ORDEN_COMPRA.ID_PROVEEDOR

' 
GO
/****** Object:  View [dbo].[Nomina]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Nomina]'))
EXEC dbo.sp_executesql @statement = N'
create view [dbo].[Nomina] as

select e.nombre as Nombre, e.apellidos as Apellidos, p.tipo as Puesto, p.sueldo as Sueldo
from Empleado e 
join puesto p on e.id_puesto = p.id_puesto ' 
GO
/****** Object:  View [dbo].[ProveedorProductoCantidad]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ProveedorProductoCantidad]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[ProveedorProductoCantidad] as
select prod.nombre_producto as Producto, i.cantidad_almacen as Cantidad, prov.nombre as Proveedor
from producto prod
join proveedor prov on prod.ID_proveedor = prov.ID_proveedor
join inventario i on prod.ID_producto = i.ID_producto' 
GO
/****** Object:  View [dbo].[USUARIOSADMIN]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOSADMIN]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[USUARIOSADMIN] AS
SELECT usr.ID_EMPLEADO, usr.ID_USUARIO, usr.ADMINISTRADOR, emp.NOMBRE, emp.APELLIDOS, emp.TELEFONO, emp.CORREO
FROM [EMPLEADO] emp
INNER JOIN [USUARIOS] as usr on usr.ID_EMPLEADO = emp.ID_EMPLEADO
' 
GO
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'9703bd7f-7a8a-4365-bcd6-149854387b27', N'Antonio', N'Leal Valdez', N'8114787450', N'Av.Lopez Mateos #1201', N'antoniteach@gmail.com', N'ANT74ASD8QJ5D')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'1e6402dd-18db-40f5-bfcc-1f0e9ce612eb', N'Juana', N'Villanueva Andrare', N'8118784502', N'Av.Acesnsio #848', N'secu34dired@gmail.com', N'JUA78QAS3245D')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'8c87442a-a9d1-495e-93ac-22cbcb9ab908', N'Miguel', N'Martinez Palma', N'8114598760', N'Av.Los Pericos #3991', N'miguel.mtzza@hotmail.com', N'MA1257AQWE74Y')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'dac8f928-5e27-4e21-a820-2d4013b851af', N'Alondra', N'Medellín Nieto', N'8186593021', N'Av.París #405', N'alomtz@gmail.com', N'ASQ45Q5WSADER')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'9ae25805-8323-48d3-9dd8-3ff43a0cef59', N'Guillermina', N'Treviño Rodriguez', N'8112035689', N'Av.Unión #607', N'guilleralca@gmail.com', N'GATRE784FG15Q')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'ab44eeff-4cdd-4761-a828-50f467b71a87', N'Daniel', N'Hernandez Perez', N'8115632018', N'Av.Puerto Rico #807', N'daniel.herdz@gmailcom', N'DAHEPE878AS45')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'0f764280-baf7-460e-b2d5-64fd24359c5a', N'Laura', N'Mendez Lopez', N'8112036945', N'Av.Azteca #102', N'laura.fda223@gmail.com', N'ADQES7845QW45')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'e1acba54-ecbb-4dfc-a8a5-66b87b97144c', N'Howard', N'Jazzo Arce', N'8116532098', N'Av.Solaris #5512', N'howa523@gmail.com', N'HOW45QW5A4S72')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'8999e1ac-e6ea-410b-90b1-6e564e6c50bb', N'Nestor', N'Calderón Hinojosa', N'8114966390', N'Av.Recurso #457', N'nestcal@gmail.com', N'NES78405AQW16')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'3dbd10f5-9610-4506-8383-7d555a684c05', N'Romina', N'Marcial Ramírez', N'8184569874', N'Av.America #402', N'romimaerxc@gmail.com', N'ROM78QW4DFR1Q')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'80c9f126-4c73-444b-93fa-7d855f59d325', N'Angel', N'Monteverde Treviño', N'8180850589', N'Av.Las Flores #503', N'angel.monteverde@gmail.com', N'MOTEAN8754GH2')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'131f7871-e82c-461b-ad6a-7dda720a24a4', N'Hugo', N'Zapata Flores', N'8189974521', N'Av.Zanja #181', N'hugomessi@gmail.com', N'HUG45QAX96FAQ')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'ba2f8bfa-3272-4415-9203-84d59ea901d7', N'Enrique', N'Nuñez Mendez', N'811420123', N'Av.Los Pinos #525', N'peñalord@gmail.com', N'ENR784AQWS45E')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'37ff2a71-e7e5-47c4-98c7-9042b6f8c50f', N'Amelia', N'Aldape Farias', N'8184551269', N'Av.Cerro Alto #800', N'amealdp@outlook.com', N'AME784QWAZ4HG')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'b4e3bc6b-3531-407c-a1ee-958f21d622f9', N'Pedro', N'Lora Jimenez', N'8113651200', N'Av.Lomas #921', N'pedroloa@gmail.com', N'DFGT45TR555A0')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'4c860628-cea9-477a-89bd-9d54dd139d27', N'Lorena', N'Cortez Cruz', N'81178895610', N'Av.Madero #7845', N'lorenaliuz@hotmail.com', N'LORE145A51520')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'3f0d1cad-0a84-4a23-b091-a3597b6c097a', N'Abraham', N'Guerrero Ramírez', N'8184778963', N'Av.Leones #301', N'abrahama.bobq@gmail.com', N'AQWS458FDV78Q')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'89badcb2-88be-46e1-9d28-cf59231c31b4', N'Francisco', N'Torres Davila', N'8186302169', N'Av.Lampazos #112', N'pacoqdo@gmail.com', N'PACQ8D4R5645F')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'd93b7938-e199-48a7-8fde-ea5ee5fa68a2', N'Fatima', N'Torres Sacanelles', N'8116535201', N'Av.Bradford #207', N'fatidark@gmail.com', N'FAT45SC57TR45')
INSERT [dbo].[CLIENTE] ([ID_CLIENTE], [NOMBRE], [APELLIDOS], [TELEFONO], [DIRECCION], [CORREO], [RFC]) VALUES (N'e537968c-cbb7-4806-9607-f749d0694d7d', N'Lizbeth', N'Salazar Tamez', N'8184547100', N'Av.Bakula #6054', N'lizbeax@gmail.com', N'LIZ784SA12TA2')
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'1a94c145-eec6-458d-9294-038939c3c92c', N'ec48922c-3a41-4fc8-b90e-4f862e16066e', N'403bd7eb-faf6-4394-8efc-228df7487654', 150, 380)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'c8fb2d59-6bb2-41ad-bfaf-195da86755fb', N'eb1419af-634b-423b-8340-68cf7506ca11', N'3730d75d-bbac-42cd-8685-89c53a9f325e', 100, 244)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'46101048-f5a2-417f-a6f5-1c57c0036da5', N'5fe8bfb5-7002-4d5e-9d25-c20a00278657', N'24e41a99-744a-454b-83f2-d85152720643', 300, 117)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'24143f07-d59a-46ed-9554-235838031de3', N'f61aa40a-9579-4f9d-b560-ca145a76598c', N'1db71fa7-8a92-4416-afb9-7992f3c1838b', 35, 121)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'930215e2-c96b-464d-93fd-3172a11ed902', N'7814122f-f9bf-4c9a-9fc1-1f16bcefd644', N'9a2e8a7b-8daa-4ff1-98f3-e063eae3f016', 20, 105)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'4ef0b85d-178c-44f9-acc5-4e0ed1f8fdb4', N'd90a3a5a-d43e-4707-923e-58178daa754e', N'bcb08da2-697c-4697-ab46-4a18813dd9dd', 25, 100)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'7621b369-0cc6-4258-b1f6-55e6da01eca6', N'5b87ef1c-091d-4802-93ed-f8f5d3276ce0', N'1fe9d07f-99cb-4954-baf4-ef2758cecff7', 55, 90)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'1028b7d0-f878-4cea-b639-6f589ef8a0c6', N'ec886f5b-3b6e-4b44-8f8c-08601ce37c57', N'9a2e8a7b-8daa-4ff1-98f3-e063eae3f016', 80, 110)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'f5fd5ec5-1696-4ad9-bd90-73117ab63b8d', N'e6963a29-073d-4b20-a3d5-99c3182d768e', N'602a33a8-7ec3-4925-8c23-13864e4c7429', 120, 158)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'596ab935-f347-4e2d-9cc3-99665b0714fd', N'2ba5435f-a4a3-434e-9cf9-f854411651ac', N'27e313c7-da6d-4985-a773-2a027a58d065', 200, 99)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'0607b4af-99af-48b8-8b14-a1d60be7e4f0', N'f221dd52-4cf0-4d6d-9c37-780efece84d5', N'b12be46c-1734-48bf-afdf-73043b5750e1', 35, 105)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'ed6a1059-deba-424f-83ba-a4d4f5351ff6', N'6d26aa67-d20f-4c55-aa6d-64fb905ee11d', N'c67aec2a-cfdb-4772-90c9-65094a6c92bd', 85, 65)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'47737286-b140-4db3-93d2-ac8f209be214', N'1f260860-593c-43a5-b33d-8ccf1ae877d9', N'210a66a9-0e71-45d3-b076-10502a970096', 50, 57)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'547bcc6e-d4f1-42b8-81aa-ade71df6746f', N'61277d23-e7c9-4335-b0e7-eafdcc7e2288', N'f4417cfc-0327-46d1-a020-762efe6e5da2', 20, 141)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'b42887ad-d137-49e8-897b-ae51006726a6', N'9b162a50-323b-4f17-abe1-8a0636ad8665', N'b2dbb3e4-5374-4736-a744-c660576c6016', 200, 55)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'77aa94a9-0699-4a47-9fa1-b4570dee6c0d', N'a39327b7-5db9-4c24-800e-93f876824c2a', N'7f7de1cf-b6c7-43f2-9bfa-cb8ff606a2c5', 257, 29)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'8b970ebc-5fa4-4184-9485-d2fd211153a2', N'6a7c1d6f-ba08-400d-aae7-a283ebfd84db', N'f5199e7e-dce5-4cef-8860-4d7d68d92347', 75, 800)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'62ac0955-b808-4b33-a880-d7fc734fe513', N'8831cb22-cf50-42d9-9eb4-5ecd31f0c0c4', N'202b8d96-77ed-4f7e-b30c-9f8c88084993', 180, 80)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'1bb7ca03-c89b-4627-9035-e0809613dcc1', N'18ccbf94-d95c-4ec3-bec4-e704c9cb7117', N'd9325116-f8fc-4969-a628-6424111bda8a', 65, 361)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'32694d5c-44b5-4b93-9d54-e28d09a1ae82', N'62ae9d68-9265-4eac-8f93-f1bcc3cb88b6', N'c781ead6-7a74-4c50-a62c-e54cb2347549', 65, 208)
INSERT [dbo].[DETALLE_COMPRA] ([ID_DETALLE_COMPRA], [ID_ORDEN_COMPRA], [ID_PRODUCTO], [CANTIDAD], [PRECIO]) VALUES (N'210f1f76-ef7b-412f-b4f1-e5f125429416', N'036de336-ac0b-4c5c-bd5b-0df08c3b8642', N'b26f53e8-620a-44f0-81a3-44121b81e245', 200, 70)
INSERT [dbo].[EMPLEADO] ([ID_EMPLEADO], [ID_PUESTO], [NOMBRE], [APELLIDOS], [TELEFONO], [CORREO]) VALUES (N'aebdb8c8-15af-4d32-86c6-0bd684fe0a0d', N'032faf0f-c76c-4827-992f-4bdeb2de15ac', N'Martha', N'Sanchez Padilla', N'8114899632', N'marthasanchez03@gmail.com')
INSERT [dbo].[EMPLEADO] ([ID_EMPLEADO], [ID_PUESTO], [NOMBRE], [APELLIDOS], [TELEFONO], [CORREO]) VALUES (N'e9375359-b1cc-4d68-b843-39ee13ef5b8b', N'032faf0f-c76c-4827-992f-4bdeb2de15ac', N'Leandro', N'Lopez Beltran', N'8114587801', N'leobeltri@hotmail.com')
INSERT [dbo].[EMPLEADO] ([ID_EMPLEADO], [ID_PUESTO], [NOMBRE], [APELLIDOS], [TELEFONO], [CORREO]) VALUES (N'a6182096-27e4-46b0-9bcd-947a311ce397', N'032faf0f-c76c-4827-992f-4bdeb2de15ac', N'Leslie', N'Alfaro Alfaro', N'8112021487', N'lesliealfaro@gmail.com')
INSERT [dbo].[EMPLEADO] ([ID_EMPLEADO], [ID_PUESTO], [NOMBRE], [APELLIDOS], [TELEFONO], [CORREO]) VALUES (N'6645327a-009d-499a-86ea-9bd82ab762da', N'032faf0f-c76c-4827-992f-4bdeb2de15ac', N'Juan', N'Martinez Perez', N'8114875401', N'juanmarti@gmail.com')
INSERT [dbo].[EMPLEADO] ([ID_EMPLEADO], [ID_PUESTO], [NOMBRE], [APELLIDOS], [TELEFONO], [CORREO]) VALUES (N'fdf33d68-86fb-4fb4-8e23-cfbf05bfe0f0', N'8f02686a-b7e0-4255-9bd2-47f48d834693', N'Mauricio', N'Ernesto Medina', N'8112541029', N'maurimedinaq@gmail.com')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'768ffaaa-8a12-421a-811c-29e04e1856bb', CAST(N'2017-09-25' AS Date), N'37ff2a71-e7e5-47c4-98c7-9042b6f8c50f', N'c0f51728-0943-4c22-b2b5-88194280509e')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'1a756edf-ffc9-46e3-8658-7261d00fbcb3', CAST(N'2017-09-24' AS Date), N'89badcb2-88be-46e1-9d28-cf59231c31b4', N'3ec9eb79-d126-465f-9182-6928e2480d9f')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'f0d59b90-48b8-447d-aa53-87f848891791', CAST(N'2017-09-24' AS Date), N'd93b7938-e199-48a7-8fde-ea5ee5fa68a2', N'3e3fb7b0-aba1-4983-9112-6b7ae047c789')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'3a931881-746a-443a-9a54-89cd970b5cfb', CAST(N'2017-09-21' AS Date), N'8c87442a-a9d1-495e-93ac-22cbcb9ab908', N'd041ca70-bd47-40be-bf56-e91ffde40064')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'b6b796f4-4c2f-4355-8ebd-dbb5af687aea', CAST(N'2017-09-23' AS Date), N'b4e3bc6b-3531-407c-a1ee-958f21d622f9', N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03')
INSERT [dbo].[FACTURA] ([ID_FACTURA], [FECHA], [ID_CLIENTE], [ID_VENTA]) VALUES (N'6869b070-0f7c-421e-a970-eb2a7b4654c1', CAST(N'2017-09-25' AS Date), N'0f764280-baf7-460e-b2d5-64fd24359c5a', N'cdc79dc8-03db-4c2c-9aba-1d21090c97f1')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'd2f58bb1-c86b-462c-afb0-077e0fd678fd', N'a6182096-27e4-46b0-9bcd-947a311ce397')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'cdc79dc8-03db-4c2c-9aba-1d21090c97f1', N'6645327a-009d-499a-86ea-9bd82ab762da')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'78017a46-3d60-4d84-bab3-2bceb8bd3fb6', N'a6182096-27e4-46b0-9bcd-947a311ce397')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'69169ba2-a78e-4a4e-9bf3-3722c81a62b0', N'e9375359-b1cc-4d68-b843-39ee13ef5b8b')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'c3230877-cea1-46c5-b546-564a0e1bd2ee', N'e9375359-b1cc-4d68-b843-39ee13ef5b8b')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'3ec9eb79-d126-465f-9182-6928e2480d9f', N'aebdb8c8-15af-4d32-86c6-0bd684fe0a0d')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'3e3fb7b0-aba1-4983-9112-6b7ae047c789', N'a6182096-27e4-46b0-9bcd-947a311ce397')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'c0f51728-0943-4c22-b2b5-88194280509e', N'e9375359-b1cc-4d68-b843-39ee13ef5b8b')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'7dcad951-750e-4c38-a4f5-8869a7b544a8', N'a6182096-27e4-46b0-9bcd-947a311ce397')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'36455c9e-f080-41f1-a9a1-9098308e65e5', N'6645327a-009d-499a-86ea-9bd82ab762da')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'ca0a987b-5af4-442d-9745-cacb194dfaf2', N'e9375359-b1cc-4d68-b843-39ee13ef5b8b')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'd041ca70-bd47-40be-bf56-e91ffde40064', N'aebdb8c8-15af-4d32-86c6-0bd684fe0a0d')
INSERT [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA], [ID_EMPLEADO]) VALUES (N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03', N'aebdb8c8-15af-4d32-86c6-0bd684fe0a0d')
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd041ca70-bd47-40be-bf56-e91ffde40064', N'd9325116-f8fc-4969-a628-6424111bda8a', 4, 500.2, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd041ca70-bd47-40be-bf56-e91ffde40064', N'b2dbb3e4-5374-4736-a744-c660576c6016', 2, 80.2, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd041ca70-bd47-40be-bf56-e91ffde40064', N'c781ead6-7a74-4c50-a62c-e54cb2347549', 1, 250, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'cdc79dc8-03db-4c2c-9aba-1d21090c97f1', N'f4417cfc-0327-46d1-a020-762efe6e5da2', 1, 169, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'c0f51728-0943-4c22-b2b5-88194280509e', N'210a66a9-0e71-45d3-b076-10502a970096', 1, 86, CAST(N'2017-09-25' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'cdc79dc8-03db-4c2c-9aba-1d21090c97f1', N'b26f53e8-620a-44f0-81a3-44121b81e245', 1, 110, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'c3230877-cea1-46c5-b546-564a0e1bd2ee', N'f5199e7e-dce5-4cef-8860-4d7d68d92347', 2, 1200, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'3e3fb7b0-aba1-4983-9112-6b7ae047c789', N'602a33a8-7ec3-4925-8c23-13864e4c7429', 2, 190, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'3e3fb7b0-aba1-4983-9112-6b7ae047c789', N'403bd7eb-faf6-4394-8efc-228df7487654', 1, 450, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03', N'1db71fa7-8a92-4416-afb9-7992f3c1838b', 1, 149, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03', N'3730d75d-bbac-42cd-8685-89c53a9f325e', 1, 320, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03', N'bcb08da2-697c-4697-ab46-4a18813dd9dd', 1, 163, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'a26625f3-28a0-4e38-8b00-fdcd4abe3a03', N'7f7de1cf-b6c7-43f2-9bfa-cb8ff606a2c5', 2, 50, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'ca0a987b-5af4-442d-9745-cacb194dfaf2', N'403bd7eb-faf6-4394-8efc-228df7487654', 1, 490, CAST(N'2017-09-23' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'3ec9eb79-d126-465f-9182-6928e2480d9f', N'210a66a9-0e71-45d3-b076-10502a970096', 3, 86, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'3ec9eb79-d126-465f-9182-6928e2480d9f', N'24e41a99-744a-454b-83f2-d85152720643', 2, 151, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'78017a46-3d60-4d84-bab3-2bceb8bd3fb6', N'd9325116-f8fc-4969-a628-6424111bda8a', 1, 500.2, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'69169ba2-a78e-4a4e-9bf3-3722c81a62b0', N'7f7de1cf-b6c7-43f2-9bfa-cb8ff606a2c5', 5, 50, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'69169ba2-a78e-4a4e-9bf3-3722c81a62b0', N'1fe9d07f-99cb-4954-baf4-ef2758cecff7', 2, 120, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'36455c9e-f080-41f1-a9a1-9098308e65e5', N'bcb08da2-697c-4697-ab46-4a18813dd9dd', 4, 163, CAST(N'2017-09-24' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd2f58bb1-c86b-462c-afb0-077e0fd678fd', N'b26f53e8-620a-44f0-81a3-44121b81e245', 1, 110, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd2f58bb1-c86b-462c-afb0-077e0fd678fd', N'b12be46c-1734-48bf-afdf-73043b5750e1', 1, 160, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'd2f58bb1-c86b-462c-afb0-077e0fd678fd', N'210a66a9-0e71-45d3-b076-10502a970096', 1, 86, CAST(N'2017-09-22' AS Date))
INSERT [dbo].[ID_VENTA_PRODUCTO] ([ID_VENTA], [ID_PRODUCTO], [CANTIDAD], [PRECIO], [FECHA]) VALUES (N'7dcad951-750e-4c38-a4f5-8869a7b544a8', N'3730d75d-bbac-42cd-8685-89c53a9f325e', 1, 320, CAST(N'2017-09-21' AS Date))
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'210a66a9-0e71-45d3-b076-10502a970096', 45)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'602a33a8-7ec3-4925-8c23-13864e4c7429', 118)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'403bd7eb-faf6-4394-8efc-228df7487654', 148)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'27e313c7-da6d-4985-a773-2a027a58d065', 200)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'b26f53e8-620a-44f0-81a3-44121b81e245', 198)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'bcb08da2-697c-4697-ab46-4a18813dd9dd', 20)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'f5199e7e-dce5-4cef-8860-4d7d68d92347', 73)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'd9325116-f8fc-4969-a628-6424111bda8a', 60)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'c67aec2a-cfdb-4772-90c9-65094a6c92bd', 85)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'b12be46c-1734-48bf-afdf-73043b5750e1', 34)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'f4417cfc-0327-46d1-a020-762efe6e5da2', 19)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'1db71fa7-8a92-4416-afb9-7992f3c1838b', 34)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'3730d75d-bbac-42cd-8685-89c53a9f325e', 98)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'202b8d96-77ed-4f7e-b30c-9f8c88084993', 180)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'b2dbb3e4-5374-4736-a744-c660576c6016', 198)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'7f7de1cf-b6c7-43f2-9bfa-cb8ff606a2c5', 243)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'24e41a99-744a-454b-83f2-d85152720643', 298)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'9a2e8a7b-8daa-4ff1-98f3-e063eae3f016', 100)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'c781ead6-7a74-4c50-a62c-e54cb2347549', 64)
INSERT [dbo].[INVENTARIO] ([ID_PRODUCTO], [CANTIDAD_ALMACEN]) VALUES (N'1fe9d07f-99cb-4954-baf4-ef2758cecff7', 53)
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'ec886f5b-3b6e-4b44-8f8c-08601ce37c57', N'cae2da4d-0b61-43ef-be88-d76b3736d33e', CAST(N'2017-07-21' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'036de336-ac0b-4c5c-bd5b-0df08c3b8642', N'2ad15e2a-8edb-4a79-b917-1b6f69f25499', CAST(N'2017-09-14' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'7814122f-f9bf-4c9a-9fc1-1f16bcefd644', N'cae2da4d-0b61-43ef-be88-d76b3736d33e', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'ec48922c-3a41-4fc8-b90e-4f862e16066e', N'ae5f1788-cdad-4f29-938f-13eb58ffa8f8', CAST(N'2017-09-02' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'd90a3a5a-d43e-4707-923e-58178daa754e', N'a49672fe-4f2f-44c5-9582-21ef4ac9b452', CAST(N'2017-09-25' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'8831cb22-cf50-42d9-9eb4-5ecd31f0c0c4', N'354fd346-6697-44fb-bf35-a7a1b6538496', CAST(N'2017-10-06' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'6d26aa67-d20f-4c55-aa6d-64fb905ee11d', N'10d9fe71-65fc-4006-af0c-597670a9b732', CAST(N'2017-08-09' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'eb1419af-634b-423b-8340-68cf7506ca11', N'db829385-c90d-4988-8694-9ecc93e89c88', CAST(N'2017-10-07' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'f221dd52-4cf0-4d6d-9c37-780efece84d5', N'e50cfe15-0a0c-4e6a-ad91-7eb628053ff6', CAST(N'2017-08-23' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'9b162a50-323b-4f17-abe1-8a0636ad8665', N'b0e65fe5-f30a-4956-97fd-b4a2d35a3f27', CAST(N'2017-09-06' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'1f260860-593c-43a5-b33d-8ccf1ae877d9', N'ee42f401-e3c8-45f8-aae8-05fb224e64a9', CAST(N'2017-08-25' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'a39327b7-5db9-4c24-800e-93f876824c2a', N'531e55e3-b8be-4614-8bf5-c944a525a51e', CAST(N'2017-09-30' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'e6963a29-073d-4b20-a3d5-99c3182d768e', N'bdd1e501-a2d5-491f-9d34-0aa7d52e37a6', CAST(N'2017-08-13' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'6a7c1d6f-ba08-400d-aae7-a283ebfd84db', N'1ee755d7-e205-4d83-845e-233b63c3a056', CAST(N'2017-07-31' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'5fe8bfb5-7002-4d5e-9d25-c20a00278657', N'd6f9a78d-08cc-4aab-a004-cb3a7a887b53', CAST(N'2017-09-27' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'e0b2dc10-f77d-42d4-9e15-c297813928a1', N'cae2da4d-0b61-43ef-be88-d76b3736d33e', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'f61aa40a-9579-4f9d-b560-ca145a76598c', N'a74da8f0-6a3e-4a20-b137-8ec150a2e3c5', CAST(N'2017-10-05' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'18ccbf94-d95c-4ec3-bec4-e704c9cb7117', N'd736ba51-533e-4a84-8985-32129e288a0f', CAST(N'2017-07-19' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'61277d23-e7c9-4335-b0e7-eafdcc7e2288', N'200e0678-9be2-4bb8-a31e-8cc10aa136d8', CAST(N'2017-09-17' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'62ae9d68-9265-4eac-8f93-f1bcc3cb88b6', N'5a92ffe6-c091-4551-8ea9-d9cd63426d32', CAST(N'2017-08-11' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'2ba5435f-a4a3-434e-9cf9-f854411651ac', N'975402c6-07b2-4deb-b2cf-160b2e70ce6b', CAST(N'2017-09-01' AS Date))
INSERT [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA], [ID_PROVEEDOR], [FECHA_ORDEN_COMPRA]) VALUES (N'5b87ef1c-091d-4802-93ed-f8f5d3276ce0', N'997cf6d2-26ca-4217-814f-f24a075b89ce', CAST(N'2017-08-19' AS Date))
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'210a66a9-0e71-45d3-b076-10502a970096', N'Teofilina   ', N'Solución oral   ', N'Jarabe  ', 86, N'ee42f401-e3c8-45f8-aae8-05fb224e64a9')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'602a33a8-7ec3-4925-8c23-13864e4c7429', N'Sulfadiacina', N'Tableta oral', N'Tableta oral', 190, N'bdd1e501-a2d5-491f-9d34-0aa7d52e37a6')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'403bd7eb-faf6-4394-8efc-228df7487654', N'Cloroquina', N'Inyección', N'Solución ', 450, N'ae5f1788-cdad-4f29-938f-13eb58ffa8f8')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'27e313c7-da6d-4985-a773-2a027a58d065', N'Estavudina ', N'Cápsula  ', N'Cápsula  ', 150, N'975402c6-07b2-4deb-b2cf-160b2e70ce6b')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'b26f53e8-620a-44f0-81a3-44121b81e245', N'Griseofulvina', N'Tableta oral micronizada', N'Tableta', 110, N'2ad15e2a-8edb-4a79-b917-1b6f69f25499')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'bcb08da2-697c-4697-ab46-4a18813dd9dd', N'Meropenem', N'Polvo para inyección', N'Polvo estéril', 163, N'a49672fe-4f2f-44c5-9582-21ef4ac9b452')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'f5199e7e-dce5-4cef-8860-4d7d68d92347', N'Ácido Paraaminosalicílico   ', N'Gránulos para suspensión oral    ', N'Gránulos  ', 1200, N'1ee755d7-e205-4d83-845e-233b63c3a056')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'd9325116-f8fc-4969-a628-6424111bda8a', N'Bencilpenicilina', N'Polvo para inyección ', N'Polvo estéril', 500.2, N'd736ba51-533e-4a84-8985-32129e288a0f')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'c67aec2a-cfdb-4772-90c9-65094a6c92bd', N'Nistatina', N'Suspensión oral', N'Suspensión', 110, N'10d9fe71-65fc-4006-af0c-597670a9b732')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'b12be46c-1734-48bf-afdf-73043b5750e1', N'Amikacina', N'Inyección', N'Solución', 160, N'e50cfe15-0a0c-4e6a-ad91-7eb628053ff6')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'f4417cfc-0327-46d1-a020-762efe6e5da2', N'Benznidazol  ', N'Tableta  ', N'Tableta  ', 169, N'200e0678-9be2-4bb8-a31e-8cc10aa136d8')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'1db71fa7-8a92-4416-afb9-7992f3c1838b', N'Omeprazol ', N'Cápsula  ', N'Cápsula  ', 149, N'a74da8f0-6a3e-4a20-b137-8ec150a2e3c5')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'3730d75d-bbac-42cd-8685-89c53a9f325e', N'Levofloxacina ', N'Tableta oral ', N'Tableta  ', 320, N'db829385-c90d-4988-8694-9ecc93e89c88')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'202b8d96-77ed-4f7e-b30c-9f8c88084993', N'Amoxicilina', N'Suspensión oral', N'Suspensión ', 120, N'354fd346-6697-44fb-bf35-a7a1b6538496')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'b2dbb3e4-5374-4736-a744-c660576c6016', N'Dicloxacilina ', N'Suspensión oral', N'Suspensión ', 80.2, N'b0e65fe5-f30a-4956-97fd-b4a2d35a3f27')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'7f7de1cf-b6c7-43f2-9bfa-cb8ff606a2c5', N'Clindamicina', N'Cápsula', N'Cápsula', 50, N'531e55e3-b8be-4614-8bf5-c944a525a51e')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'24e41a99-744a-454b-83f2-d85152720643', N'Trimetoprim', N'Suspensión Oral', N'Suspensión', 151, N'd6f9a78d-08cc-4aab-a004-cb3a7a887b53')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'9a2e8a7b-8daa-4ff1-98f3-e063eae3f016', N'Ampicilina ', N'Polvo para inyección', N'Polvo estéril', 160, N'cae2da4d-0b61-43ef-be88-d76b3736d33e')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'c781ead6-7a74-4c50-a62c-e54cb2347549', N'Cefalexina ', N'Cápsula o Tableta oral', N'Cápsula o Tableta ', 250, N'5a92ffe6-c091-4551-8ea9-d9cd63426d32')
INSERT [dbo].[PRODUCTO] ([ID_PRODUCTO], [NOMBRE_PRODUCTO], [CONCENTRACIÓN], [FORMA_FARMACEUTICA], [PRECIO], [ID_PROVEEDOR]) VALUES (N'1fe9d07f-99cb-4954-baf4-ef2758cecff7', N'Gentamicina', N'Inyección', N'Solución', 120, N'997cf6d2-26ca-4217-814f-f24a075b89ce')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'ee42f401-e3c8-45f8-aae8-05fb224e64a9', N'Farmacos Tapía', N'8114569325', N'Av.Metro #469', N'farmacostapia@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'bdd1e501-a2d5-491f-9d34-0aa7d52e37a6', N'Farmacos Juarez', N'8114796513', N'Av.Carlos Garza #748', N'farmacosjuarez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'ae5f1788-cdad-4f29-938f-13eb58ffa8f8', N'Farmacos Datlab', N'8117658434', N'Av.Pino Suarez #614', N'farmacosdatlab@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'975402c6-07b2-4deb-b2cf-160b2e70ce6b', N'Farmacos Hernandez', N'8117874569', N'Av.Central #258', N'farmacoshernandez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'2ad15e2a-8edb-4a79-b917-1b6f69f25499', N'Farmacos Rosales', N'8194205733', N'Av.Carranza #334', N'farmacosrosales@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'a49672fe-4f2f-44c5-9582-21ef4ac9b452', N'Farmacos Jimenez', N'8114598741', N'Av.Neptuno #3321', N'farmacosjimenez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'1ee755d7-e205-4d83-845e-233b63c3a056', N'Farmacos Marquez', N'8119987402', N'Av.Palermo', N'farmacosmarquez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'd736ba51-533e-4a84-8985-32129e288a0f', N'Farmacos Gonzalez', N'8184520121', N'Av.Bocanegra #659', N'farmacosgonzalez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'10d9fe71-65fc-4006-af0c-597670a9b732', N'Farmacos Catalina', N'8174305411', N'Av.Cafe #769', N'farmacoscatalina@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'e50cfe15-0a0c-4e6a-ad91-7eb628053ff6', N'Farmacos Cárdenas', N'8182471900', N'Av.Nogalar #888', N'farmacoscardenas@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'200e0678-9be2-4bb8-a31e-8cc10aa136d8', N'Farmacos Dell', N'8117154871', N'Av.Santa María #117', N'farmacosdell@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'a74da8f0-6a3e-4a20-b137-8ec150a2e3c5', N'Farmacos Marciales', N'8182834710', N'Av.Valle Dorado #146', N'farmacosmarciales@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'db829385-c90d-4988-8694-9ecc93e89c88', N'Farmacos Pérez', N'8117154871', N'Av.Benito Juarez #147', N'farmacosperez@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'354fd346-6697-44fb-bf35-a7a1b6538496', N'Farmacos Montecarlo', N'8114135775', N'Av. Leandro Rios #104', N'farmacosmontecarlo@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'b0e65fe5-f30a-4956-97fd-b4a2d35a3f27', N'Farmacos Cépeda', N'8118144171', N'Av.Revolución #218', N'farmacoscepeda@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'531e55e3-b8be-4614-8bf5-c944a525a51e', N'Farmacos ABX', N'8119472253', N'Av.1 de mayo #102', N'farmacosabx@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'd6f9a78d-08cc-4aab-a004-cb3a7a887b53', N'Farmacos Petra', N'8126991147', N'Av.Colón #247', N'farmacospetra@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'cae2da4d-0b61-43ef-be88-d76b3736d33e', N'Farmacos WEX', N'8126991147', N'Av.Heroes #510', N'farmacoswex@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'5a92ffe6-c091-4551-8ea9-d9cd63426d32', N'Farmacos Rex', N'8115331984', N'Av. Gasparin #547', N'farmacosrex@gmail.com')
INSERT [dbo].[PROVEEDOR] ([ID_PROVEEDOR], [NOMBRE], [TELEFONO], [DIRECCION], [CORREO]) VALUES (N'997cf6d2-26ca-4217-814f-f24a075b89ce', N'Farmacos Leal', N'8112475077', N'Av.Villa Sol #701', N'farmacosleal@gmail.com')
INSERT [dbo].[PUESTO] ([ID_PUESTO], [TIPO], [SUELDO]) VALUES (N'8f02686a-b7e0-4255-9bd2-47f48d834693', N'Administrador Base de Datos', 2500.0000)
INSERT [dbo].[PUESTO] ([ID_PUESTO], [TIPO], [SUELDO]) VALUES (N'032faf0f-c76c-4827-992f-4bdeb2de15ac', N'Vendedor', 800.0000)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [PASSWORD], [ID_EMPLEADO], [ADMINISTRADOR]) VALUES (N'1', N'123', N'aebdb8c8-15af-4d32-86c6-0bd684fe0a0d', 0)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [PASSWORD], [ID_EMPLEADO], [ADMINISTRADOR]) VALUES (N'2', N'123', N'e9375359-b1cc-4d68-b843-39ee13ef5b8b', 0)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [PASSWORD], [ID_EMPLEADO], [ADMINISTRADOR]) VALUES (N'6', N'123', N'a6182096-27e4-46b0-9bcd-947a311ce397', 0)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [PASSWORD], [ID_EMPLEADO], [ADMINISTRADOR]) VALUES (N'7', N'123', N'6645327a-009d-499a-86ea-9bd82ab762da', 0)
INSERT [dbo].[USUARIOS] ([ID_USUARIO], [PASSWORD], [ID_EMPLEADO], [ADMINISTRADOR]) VALUES (N'8', N'admin', N'fdf33d68-86fb-4fb4-8e23-cfbf05bfe0f0', 1)
/****** Object:  Index [IXFK_EMPLEADO_PUESTO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADO]') AND name = N'IXFK_EMPLEADO_PUESTO')
CREATE NONCLUSTERED INDEX [IXFK_EMPLEADO_PUESTO] ON [dbo].[EMPLEADO]
(
	[ID_PUESTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FACTURA_CLIENTE]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FACTURA]') AND name = N'IXFK_FACTURA_CLIENTE')
CREATE NONCLUSTERED INDEX [IXFK_FACTURA_CLIENTE] ON [dbo].[FACTURA]
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_FACTURA_VENTA]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FACTURA]') AND name = N'IXFK_FACTURA_VENTA')
CREATE NONCLUSTERED INDEX [IXFK_FACTURA_VENTA] ON [dbo].[FACTURA]
(
	[ID_VENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_ORDEN_COMPRA_PROVEEDOR]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ORDEN_COMPRA]') AND name = N'IXFK_ORDEN_COMPRA_PROVEEDOR')
CREATE NONCLUSTERED INDEX [IXFK_ORDEN_COMPRA_PROVEEDOR] ON [dbo].[ORDEN_COMPRA]
(
	[ID_PROVEEDOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IXFK_USUARIOS_EMPLEADO]    Script Date: 11/11/2017 05:27:54 p. m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND name = N'IXFK_USUARIOS_EMPLEADO')
CREATE NONCLUSTERED INDEX [IXFK_USUARIOS_EMPLEADO] ON [dbo].[USUARIOS]
(
	[ID_EMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DETALLE_COMPRA_ORDEN_COMPRA]') AND parent_object_id = OBJECT_ID(N'[dbo].[DETALLE_COMPRA]'))
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_COMPRA_ORDEN_COMPRA] FOREIGN KEY([ID_ORDEN_COMPRA])
REFERENCES [dbo].[ORDEN_COMPRA] ([ID_ORDEN_COMPRA])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DETALLE_COMPRA_ORDEN_COMPRA]') AND parent_object_id = OBJECT_ID(N'[dbo].[DETALLE_COMPRA]'))
ALTER TABLE [dbo].[DETALLE_COMPRA] CHECK CONSTRAINT [FK_DETALLE_COMPRA_ORDEN_COMPRA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DETALLE_COMPRA_PRODUCTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DETALLE_COMPRA]'))
ALTER TABLE [dbo].[DETALLE_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_COMPRA_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([ID_PRODUCTO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DETALLE_COMPRA_PRODUCTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[DETALLE_COMPRA]'))
ALTER TABLE [dbo].[DETALLE_COMPRA] CHECK CONSTRAINT [FK_DETALLE_COMPRA_PRODUCTO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPLEADO_PUESTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[EMPLEADO]'))
ALTER TABLE [dbo].[EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_PUESTO] FOREIGN KEY([ID_PUESTO])
REFERENCES [dbo].[PUESTO] ([ID_PUESTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPLEADO_PUESTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[EMPLEADO]'))
ALTER TABLE [dbo].[EMPLEADO] CHECK CONSTRAINT [FK_EMPLEADO_PUESTO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACTURA_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACTURA]'))
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_CLIENTE] FOREIGN KEY([ID_CLIENTE])
REFERENCES [dbo].[CLIENTE] ([ID_CLIENTE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACTURA_CLIENTE]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACTURA]'))
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [FK_FACTURA_CLIENTE]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACTURA_ID_VENTA_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACTURA]'))
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_ID_VENTA_EMPLEADO] FOREIGN KEY([ID_VENTA])
REFERENCES [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FACTURA_ID_VENTA_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[FACTURA]'))
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [FK_FACTURA_ID_VENTA_EMPLEADO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_EMPLEADO_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_EMPLEADO]'))
ALTER TABLE [dbo].[ID_VENTA_EMPLEADO]  WITH CHECK ADD  CONSTRAINT [FK_ID_VENTA_EMPLEADO_EMPLEADO] FOREIGN KEY([ID_EMPLEADO])
REFERENCES [dbo].[EMPLEADO] ([ID_EMPLEADO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_EMPLEADO_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_EMPLEADO]'))
ALTER TABLE [dbo].[ID_VENTA_EMPLEADO] CHECK CONSTRAINT [FK_ID_VENTA_EMPLEADO_EMPLEADO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_PRODUCTO_ID_VENTA_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_PRODUCTO]'))
ALTER TABLE [dbo].[ID_VENTA_PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_ID_VENTA_PRODUCTO_ID_VENTA_EMPLEADO] FOREIGN KEY([ID_VENTA])
REFERENCES [dbo].[ID_VENTA_EMPLEADO] ([ID_VENTA])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_PRODUCTO_ID_VENTA_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_PRODUCTO]'))
ALTER TABLE [dbo].[ID_VENTA_PRODUCTO] CHECK CONSTRAINT [FK_ID_VENTA_PRODUCTO_ID_VENTA_EMPLEADO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_PRODUCTO_PRODUCTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_PRODUCTO]'))
ALTER TABLE [dbo].[ID_VENTA_PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_ID_VENTA_PRODUCTO_PRODUCTO] FOREIGN KEY([ID_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([ID_PRODUCTO])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ID_VENTA_PRODUCTO_PRODUCTO]') AND parent_object_id = OBJECT_ID(N'[dbo].[ID_VENTA_PRODUCTO]'))
ALTER TABLE [dbo].[ID_VENTA_PRODUCTO] CHECK CONSTRAINT [FK_ID_VENTA_PRODUCTO_PRODUCTO]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ORDEN_COMPRA_PROVEEDOR]') AND parent_object_id = OBJECT_ID(N'[dbo].[ORDEN_COMPRA]'))
ALTER TABLE [dbo].[ORDEN_COMPRA]  WITH CHECK ADD  CONSTRAINT [FK_ORDEN_COMPRA_PROVEEDOR] FOREIGN KEY([ID_PROVEEDOR])
REFERENCES [dbo].[PROVEEDOR] ([ID_PROVEEDOR])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ORDEN_COMPRA_PROVEEDOR]') AND parent_object_id = OBJECT_ID(N'[dbo].[ORDEN_COMPRA]'))
ALTER TABLE [dbo].[ORDEN_COMPRA] CHECK CONSTRAINT [FK_ORDEN_COMPRA_PROVEEDOR]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USUARIOS_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIOS]'))
ALTER TABLE [dbo].[USUARIOS]  WITH CHECK ADD  CONSTRAINT [FK_USUARIOS_EMPLEADO] FOREIGN KEY([ID_EMPLEADO])
REFERENCES [dbo].[EMPLEADO] ([ID_EMPLEADO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_USUARIOS_EMPLEADO]') AND parent_object_id = OBJECT_ID(N'[dbo].[USUARIOS]'))
ALTER TABLE [dbo].[USUARIOS] CHECK CONSTRAINT [FK_USUARIOS_EMPLEADO]
GO
/****** Object:  StoredProcedure [dbo].[facturasdia]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[facturasdia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[facturasdia] AS' 
END
GO
ALTER PROCEDURE [dbo].[facturasdia]
	@dia [date]
WITH EXECUTE AS CALLER
AS
begin
select count (Fecha) as CantidadFacturas
from factura
where Fecha = @dia
end
GO
/****** Object:  StoredProcedure [dbo].[GananciasPorDia]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GananciasPorDia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GananciasPorDia] AS' 
END
GO
ALTER PROCEDURE [dbo].[GananciasPorDia]
	@dia [date]
WITH EXECUTE AS CALLER
AS
begin 
	select Fecha, SUM (total) as Ganancias 
	from VentaTotal
	where fecha = @dia
	group by fecha
end
GO
/****** Object:  StoredProcedure [dbo].[ProductoPorForma]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductoPorForma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProductoPorForma] AS' 
END
GO
ALTER PROCEDURE [dbo].[ProductoPorForma]
	@valor [varchar](25)
WITH EXECUTE AS CALLER
AS
begin
	select * from Detalle_Producto_porTipo
	where tipo like @valor
end
GO
/****** Object:  Trigger [dbo].[CompraAProveedor]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CompraAProveedor]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[CompraAProveedor]
on [dbo].[DETALLE_COMPRA]
after insert
as
declare @id_producto varchar(255)
declare @cantidad int
select @id_producto = id_producto from inserted
select @cantidad = cantidad from inserted

begin 
	update inventario
	set cantidad_almacen= cantidad_almacen + @cantidad
	where id_producto = @id_producto
end' 
GO
/****** Object:  Trigger [dbo].[VentaAgregada]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[VentaAgregada]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[VentaAgregada]
on [dbo].[ID_VENTA_EMPLEADO]
after insert
as
begin
select ID_venta from inserted
end' 
GO
/****** Object:  Trigger [dbo].[CambiosEnInventario]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[CambiosEnInventario]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[CambiosEnInventario]
on [dbo].[ID_VENTA_PRODUCTO]
after insert 
as
declare @id_producto varchar(255) 
declare @cantidad int
select @id_producto = id_producto from inserted
select @cantidad = cantidad from inserted

begin
	update inventario 
	set cantidad_almacen = cantidad_almacen -  @cantidad
	where id_producto = @id_producto
end
' 
GO
/****** Object:  Trigger [dbo].[TotalDespuesDeAgregarProducto]    Script Date: 11/11/2017 05:27:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[TotalDespuesDeAgregarProducto]'))
EXEC dbo.sp_executesql @statement = N'create trigger [dbo].[TotalDespuesDeAgregarProducto]
on [dbo].[ID_VENTA_PRODUCTO]
after insert 
as
declare @id_venta varchar(255)
select @id_venta = id_venta from inserted
begin
	select * from VentaTotal
	where id = @id_venta
end' 
GO
USE [master]
GO
ALTER DATABASE [FarmacialPos] SET  READ_WRITE 
GO
