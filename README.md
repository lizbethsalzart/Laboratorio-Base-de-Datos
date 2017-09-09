# Laboratorio-Base-de-Datos
USE [master]
GO
/****** Object:  Database [practica2]    Script Date: 09/09/2017 12:30:08 p.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'practica2')
BEGIN
CREATE DATABASE [practica2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica2', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica2.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'practica2_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\practica2_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [practica2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica2] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [practica2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [practica2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [practica2] SET  MULTI_USER 
GO
ALTER DATABASE [practica2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [practica2]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumno]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Alumno](
	[ID.alumno] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Carrera] [varchar](50) NOT NULL,
	[Fecha de Nacimiento] [date] NULL,
	[Semestre] [tinyint] NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Calificaciones_semestre]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Calificaciones_semestre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Calificaciones_semestre](
	[ID.alumno] [uniqueidentifier] NOT NULL,
	[Semestre] [tinyint] NOT NULL,
	[Promedio] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Horario](
	[ID.materia] [uniqueidentifier] NOT NULL,
	[Fecha] [time](7) NULL,
	[horas.dia] [tinyint] NOT NULL,
	[repeticiones] [tinyint] NOT NULL,
	[horas.semana]  AS ([horas.dia]*[repeticiones]),
	[Maestro] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Libros]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Libros](
	[ID.libro] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Sinopsis] [text] NULL,
	[Materia] [nvarchar](50) NOT NULL,
	[Precio.libro] [float] NULL,
	[Cantidad.libros] [int] NULL,
	[Precio.total]  AS ([Precio.libro]*[Cantidad.libros])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Maestros]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Maestros]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Maestros](
	[ID] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Profesión] [varchar](50) NULL,
	[Clase impartida] [nchar](10) NULL,
	[Horas trabajo por semana] [tinyint] NOT NULL,
	[Sueldo por hora] [int] NOT NULL,
	[Sueldo semana] [nchar](10) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Materia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Materia](
	[ID.materia] [uniqueidentifier] NOT NULL,
	[Materia] [varchar](50) NOT NULL,
	[Semestre] [tinyint] NOT NULL,
	[Maestro] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Oportunidades]    Script Date: 09/09/2017 12:30:08 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Oportunidades]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Oportunidades](
	[ID.alumno] [uniqueidentifier] NOT NULL,
	[Materia] [nchar](10) NOT NULL,
	[Materia.primeras] [bit] NOT NULL,
	[Materia.segundas] [bit] NOT NULL,
	[Materia.terceras] [bit] NOT NULL,
	[Materia.cuartas] [bit] NOT NULL,
	[Materia.quintas] [bit] NOT NULL,
	[Materia.sextas] [bit] NOT NULL
) ON [PRIMARY]
END
GO
USE [master]
GO
ALTER DATABASE [practica2] SET  READ_WRITE 
GO
create index indx_Alumno
on [practica2].Alumno(Nombre)
GO
create index indx_calificaciones
on [practica2].Calificaciones(ID.alumno)
GO
create index indx_horario
on [practica2].Horario(ID.materia)
GO
create index indx_libros
on [practica2].Libros(Nombre)
GO
create index indx_maestros
on [practica2].Maestros(Nombre)
GO
create index indx_materia
on [practica2].Materia(Materia)
GO
create index indx_oportunidades
on [practica2].Oportunidades(ID.alumno)
GO
