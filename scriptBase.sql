USE [master]
GO
/****** Object:  Database [Caso1]    Script Date: 25/03/2022 09:11:10 p.m. ******/
CREATE DATABASE [Caso1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Caso1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Caso1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Caso1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Caso1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Caso1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Caso1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Caso1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Caso1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Caso1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Caso1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Caso1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Caso1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Caso1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Caso1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Caso1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Caso1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Caso1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Caso1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Caso1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Caso1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Caso1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Caso1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Caso1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Caso1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Caso1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Caso1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Caso1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Caso1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Caso1] SET RECOVERY FULL 
GO
ALTER DATABASE [Caso1] SET  MULTI_USER 
GO
ALTER DATABASE [Caso1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Caso1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Caso1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Caso1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Caso1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Caso1', N'ON'
GO
ALTER DATABASE [Caso1] SET QUERY_STORE = OFF
GO
USE [Caso1]
GO
/****** Object:  Table [dbo].[Accion]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accion](
	[id] [int] NOT NULL,
	[planId] [int] NULL,
	[descripcion] [nchar](120) NULL,
 CONSTRAINT [PK_Accion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[id] [int] NOT NULL,
	[nombre] [nchar](15) NULL,
	[provinciaId] [int] NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entregable]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entregable](
	[id] [int] NOT NULL,
	[plansId] [int] NOT NULL,
	[accionId] [int] NOT NULL,
	[cantonId] [int] NOT NULL,
	[fecha] [date] NULL,
	[kpi] [int] NULL,
	[ente] [nchar](15) NULL,
	[checksum] [int] NULL,
	[satisfaccion] [float] NULL,
 CONSTRAINT [PK_Entregable_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partido]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partido](
	[id] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
	[urlFlag] [nchar](30) NULL,
	[creationDate] [date] NULL,
 CONSTRAINT [PK_Partido] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plans]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plans](
	[id] [int] NOT NULL,
	[partidoId] [int] NULL,
	[titulo] [nchar](10) NULL,
	[descripcion] [nchar](120) NULL,
 CONSTRAINT [PK_PlanDeGobierno] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id] [int] NOT NULL,
	[nombre] [nchar](10) NULL,
 CONSTRAINT [PK_Bandera] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[id] [int] NOT NULL,
	[nombreTipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] NOT NULL,
	[cedula] [nvarchar](50) NULL,
	[partidoId] [int] NOT NULL,
	[idCanton] [int] NOT NULL,
	[password] [nchar](10) NULL,
	[urlPicture] [nchar](30) NULL,
	[creationDate] [date] NULL,
	[idTipo] [int] NOT NULL,
 CONSTRAINT [PK_Ciudadano] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accion]  WITH CHECK ADD  CONSTRAINT [FK_Accion_Plans] FOREIGN KEY([planId])
REFERENCES [dbo].[Plans] ([id])
GO
ALTER TABLE [dbo].[Accion] CHECK CONSTRAINT [FK_Accion_Plans]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [FK_Canton_Provincia] FOREIGN KEY([provinciaId])
REFERENCES [dbo].[Provincia] ([id])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [FK_Canton_Provincia]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Accion] FOREIGN KEY([accionId])
REFERENCES [dbo].[Accion] ([id])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Accion]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Canton] FOREIGN KEY([cantonId])
REFERENCES [dbo].[Canton] ([id])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Canton]
GO
ALTER TABLE [dbo].[Entregable]  WITH CHECK ADD  CONSTRAINT [FK_Entregable_Plans] FOREIGN KEY([plansId])
REFERENCES [dbo].[Plans] ([id])
GO
ALTER TABLE [dbo].[Entregable] CHECK CONSTRAINT [FK_Entregable_Plans]
GO
ALTER TABLE [dbo].[Plans]  WITH CHECK ADD  CONSTRAINT [FK_Plans_Partido] FOREIGN KEY([partidoId])
REFERENCES [dbo].[Partido] ([id])
GO
ALTER TABLE [dbo].[Plans] CHECK CONSTRAINT [FK_Plans_Partido]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Ciudadano_Partido] FOREIGN KEY([partidoId])
REFERENCES [dbo].[Partido] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Ciudadano_Partido]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Canton] FOREIGN KEY([idCanton])
REFERENCES [dbo].[Canton] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Canton]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([idTipo])
REFERENCES [dbo].[TipoUsuario] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[CantonesEntregables100]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
/* 
Description: Listar los cantones que recibirán
entregables en los primeros 100 días de gobierno, pero que no
recibirán nada en los últimos 100
*/
-- =============================================
Create     PROCEDURE [dbo].[CantonesEntregables100]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select c.nombre
	From Canton c
	inner join Entregable e on e.cantonId = c.id
	Where e.fecha < DATEADD(DAY, 100, e.fecha)
   intersect
    Select c.nombre
	From Canton c
	inner join Entregable e on e.cantonId = c.id
	Where e.fecha > DATEADD(DAY, 1360, e.fecha)
END

GO
/****** Object:  StoredProcedure [dbo].[ListarEntregables]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[ListarEntregables]
	-- Add the parameters for the stored procedure here
	@canton int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT pl.partidoId, en.id
	FROM ENTREGABLE en
	INNER JOIN Plans pl on pl.id = en.plansId
	WHERE en.cantonId = @canton
	GROUP BY pl.partidoId , en.id
END
GO
/****** Object:  StoredProcedure [dbo].[nivelSatisfaccion]    Script Date: 25/03/2022 09:11:10 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
/* 
Description: Reporte de niveles de satisfacción por partido por
cantón ordenados por mayor calificación a menor y porpartido. Finalmente agregando
un sumarizado por partido de los mismos porcentajes
*/
-- =============================================
CREATE   PROCEDURE [dbo].[nivelSatisfaccion]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT deliverable.cantonid, campaing.nombre,
	COUNT(CASE WHEN satisfaccion < 0.35 THEN 1 ELSE 0 END)/COUNT(1) insatisfecho,
	COUNT(CASE WHEN satisfaccion > 0.35 AND satisfaccion < 0.70 THEN 1 ELSE 0 END)/COUNT(1) medio,
	COUNT(CASE WHEN satisfaccion > 0.70 THEN 1 ELSE 0 END)/COUNT(1) alto
	from dbo.Entregable deliverable
	inner join dbo.Accion actions on actions.id = deliverable.accionId
	inner join dbo.Plans plans on plans.id = actions.planId
	inner join dbo.Partido campaing on campaing.id = plans.partidoId
	group by rollup (deliverable.cantonid, nombre)
    
END


GO
USE [master]
GO
ALTER DATABASE [Caso1] SET  READ_WRITE 
GO
