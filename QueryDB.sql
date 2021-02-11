USE [master]
GO
/****** Object:  Database [Mantenimiento]    Script Date: 10/2/2021 8:54:12 p. m. ******/
CREATE DATABASE [Mantenimiento]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Mantenimiento', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Mantenimiento.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Mantenimiento_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Mantenimiento_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Mantenimiento] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Mantenimiento].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Mantenimiento] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Mantenimiento] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Mantenimiento] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Mantenimiento] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Mantenimiento] SET ARITHABORT OFF 
GO
ALTER DATABASE [Mantenimiento] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Mantenimiento] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Mantenimiento] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Mantenimiento] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Mantenimiento] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Mantenimiento] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Mantenimiento] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Mantenimiento] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Mantenimiento] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Mantenimiento] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Mantenimiento] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Mantenimiento] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Mantenimiento] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Mantenimiento] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Mantenimiento] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Mantenimiento] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Mantenimiento] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Mantenimiento] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Mantenimiento] SET  MULTI_USER 
GO
ALTER DATABASE [Mantenimiento] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Mantenimiento] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Mantenimiento] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Mantenimiento] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Mantenimiento] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Mantenimiento]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/2/2021 8:54:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NULL,
	[PrimerNombre] [varchar](100) NULL,
	[PrimerApellido] [varchar](100) NULL,
	[Edad] [int] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClientes]    Script Date: 10/2/2021 8:54:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kenia Ortez>
-- Create date: <09-Febrero-2021>
-- Description:	<Actualizar Clientes>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarClientes]
@IdCliente int, @Identificacion varchar(20), @PrimerNombre varchar(100),
@PrimerApellido varchar(100), @Edad int 
	
AS
BEGIN
	update Clientes 
	set PrimerNombre = @PrimerNombre,
	Identificacion=@Identificacion,
	PrimerApellido = @PrimerApellido,
	Edad = @Edad,
	FechaModificacion = GETDATE()
	where IdCliente = @IdCliente
	select @IdCliente 

END

GO
/****** Object:  StoredProcedure [dbo].[BuscarClientes]    Script Date: 10/2/2021 8:54:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
-- =============================================
-- Author:		<Kenia Ortez>
-- Create date: <09-Febrero-2021>
-- Description:	<Buscar clientes>
-- =============================================
CREATE PROCEDURE [dbo].[BuscarClientes]
@Id int

AS
BEGIN
	if @id = -1
	select * from Clientes
	else
	select * from Clientes where IdCliente = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarClientes]    Script Date: 10/2/2021 8:54:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
-- =============================================
-- Author:		<Kenia Ortez>
-- Create date: <09-Febrero-2021>
-- Description:	<Eliminar cliente>
-- =============================================
CREATE PROCEDURE [dbo].[EliminarClientes]
@Id int

AS
BEGIN
	delete from Clientes where IdCliente = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[InsertarClientes]    Script Date: 10/2/2021 8:54:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kenia Ortez>
-- Create date: <09-Febrero-2021>
-- Description:	<Insertar Clientes>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarClientes]
@Identificacion varchar(20),  @PrimerNombre varchar(100),
@PrimerApellido varchar(100), @Edad int 
	
AS
BEGIN
	Insert into Clientes (Identificacion, PrimerNombre, PrimerApellido, Edad, FechaCreacion)
	Values (@Identificacion,@PrimerNombre, @PrimerApellido, @Edad, getdate())
	select @@IDENTITY
END

GO
USE [master]
GO
ALTER DATABASE [Mantenimiento] SET  READ_WRITE 
GO
