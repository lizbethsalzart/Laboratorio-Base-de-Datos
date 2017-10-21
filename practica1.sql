USE [master]
GO
/****** Object:  Database [P1]    Script Date: 21/10/2017 09:41:29 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'P1')
BEGIN
CREATE DATABASE [P1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'P1', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\P1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'P1_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\P1_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [P1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [P1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [P1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [P1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [P1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [P1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [P1] SET ARITHABORT OFF 
GO
ALTER DATABASE [P1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [P1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [P1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [P1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [P1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [P1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [P1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [P1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [P1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [P1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [P1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [P1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [P1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [P1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [P1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [P1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [P1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [P1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [P1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [P1] SET  MULTI_USER 
GO
ALTER DATABASE [P1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [P1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [P1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [P1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [P1] SET  READ_WRITE 
GO
