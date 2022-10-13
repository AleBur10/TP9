USE [master]
GO
/****** Object:  Database [DeltaGames]    Script Date: 13/10/2022 10:37:15 ******/
CREATE DATABASE [DeltaGames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeltaGames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DeltaGames.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeltaGames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DeltaGames_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DeltaGames] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeltaGames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeltaGames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeltaGames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeltaGames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeltaGames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeltaGames] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeltaGames] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeltaGames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeltaGames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeltaGames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeltaGames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeltaGames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeltaGames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeltaGames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeltaGames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeltaGames] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeltaGames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeltaGames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeltaGames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeltaGames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeltaGames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeltaGames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeltaGames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeltaGames] SET RECOVERY FULL 
GO
ALTER DATABASE [DeltaGames] SET  MULTI_USER 
GO
ALTER DATABASE [DeltaGames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeltaGames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeltaGames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeltaGames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeltaGames] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DeltaGames', N'ON'
GO
ALTER DATABASE [DeltaGames] SET QUERY_STORE = OFF
GO
USE [DeltaGames]
GO
/****** Object:  User [alumno]    Script Date: 13/10/2022 10:37:15 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/10/2022 10:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[TipoCategoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 13/10/2022 10:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[IdJuego] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[CantLikes] [int] NOT NULL,
	[fkUsuario] [int] NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[Precio] [int] NOT NULL,
	[fkCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[IdJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/10/2022 10:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[fkJuego] [int] NOT NULL,
	[FechaHora] [date] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (1, N'Acción')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (2, N'Arcade')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (3, N'Aventura')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (4, N'Deportes')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (5, N'Simulación')
INSERT [dbo].[Categorias] ([IdCategoria], [TipoCategoria]) VALUES (6, N'Estrategia')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 

INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (6, N'Call Of Duty: Black Ops 2', 0, NULL, N'Empujando los límites de lo que los fanáticos esperan de la franquicia de entretenimiento que establece récords, Call of Duty®: Black Ops II impulsa a los jugadores a un futuro cercano de la Guerra Fr', CAST(N'2012-11-18' AS Date), N'/BlackOps2.jpg', 20, 5)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (8, N'God Of War 2018', 0, NULL, N'Han pasado años desde que Kratos tomó su venganza contra los Dioses Olímpicos. Habiendo sobrevivido la pelea final contra su padre Zeus, Kratos vive ahora con su joven hijo Atreus en el mundo de los D', CAST(N'2018-04-20' AS Date), N'/GodOfWar.jpg', 50, 1)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (9, N'Fifa 22', 0, NULL, N'Powered by Football™, EA SPORTS™ FIFA 22 acorta las distancias aún más con lo que sucede en la vida real gracias a los avances en la jugabilidad básica y a nuevas características innovadoras en todos ', CAST(N'2021-10-01' AS Date), N'/Fifa.jpg', 20, 5)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (10, N'Mortal Kombat X', 0, NULL, N'La historia se desarrolla 25 años después de los últimos hechos de Mortal Kombat 9, poniendo énfasis en los veteranos de edad, nuevos personajes y los descendientes de última generación de los combati', CAST(N'2015-04-21' AS Date), N'/Mkx.jpg', 15, 1)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (11, N'5D Chess With Multiverse Time Travel', 0, NULL, N'Es la primera variante de ajedrez con dimensiones espaciales, temporales y paralelas. ¡Es ajedrez 5D con viaje en el tiempo multiverso! Mueva las piezas hacia atrás en el tiempo para crear líneas de t', CAST(N'2020-07-22' AS Date), N'/Chess.jpg', 2, 6)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (12, N'ARK: Survival Evolved', 0, NULL, N'Varado en las costas de una isla misteriosa, debes aprender a sobrevivir. Usa tu astucia para matar o domar a las criaturas primigenias que vagan por la tierra y enfréntate a otros jugadores para sobr', CAST(N'2017-08-27' AS Date), N'/Ark.jpg', 3, 3)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (14, N'Counter-Strike: Global Offensive
', 0, NULL, N'Counter-Strike: Global Offensive (CS:GO) amplía el juego de acción por equipos del que fue pionera la franquicia cuando salió hace 19 años. CS:GO trae nuevos mapas, personajes, armas y modos de juego,', CAST(N'2012-08-21' AS Date), N'/Csgo.jpg', 6, 1)
INSERT [dbo].[Juegos] ([IdJuego], [Nombre], [CantLikes], [fkUsuario], [Descripcion], [FechaCreacion], [Imagen], [Precio], [fkCategoria]) VALUES (15, N'Microsoft Flight Simulator Game of the Year Edition
', 0, NULL, N'¡Gracias por vuestro apoyo, fans recientes y de toda la vida! La edición Game of the Year (GOTY) de Microsoft Flight Simulator ofrece 5 nuevas aeronaves, 8 aeropuertos flamantes creados a mano, 6 vuel', CAST(N'2020-04-18' AS Date), N'Avion.jpg', 15, 5)
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Categorias] FOREIGN KEY([fkCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Categorias]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Usuarios] FOREIGN KEY([fkUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Juegos] FOREIGN KEY([fkJuego])
REFERENCES [dbo].[Juegos] ([IdJuego])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Juegos]
GO
USE [master]
GO
ALTER DATABASE [DeltaGames] SET  READ_WRITE 
GO
