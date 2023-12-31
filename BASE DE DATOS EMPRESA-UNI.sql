USE [master]
GO
/****** Object:  Database [EMPRESA_UNI]    Script Date: 4/12/2023 01:20:57 ******/
CREATE DATABASE [EMPRESA_UNI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMPRESA_UNI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EMPRESA_UNI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMPRESA_UNI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EMPRESA_UNI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EMPRESA_UNI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMPRESA_UNI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMPRESA_UNI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EMPRESA_UNI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMPRESA_UNI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMPRESA_UNI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EMPRESA_UNI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMPRESA_UNI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMPRESA_UNI] SET  MULTI_USER 
GO
ALTER DATABASE [EMPRESA_UNI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMPRESA_UNI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMPRESA_UNI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMPRESA_UNI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMPRESA_UNI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMPRESA_UNI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EMPRESA_UNI] SET QUERY_STORE = ON
GO
ALTER DATABASE [EMPRESA_UNI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EMPRESA_UNI]
GO
/****** Object:  Table [dbo].[centros]    Script Date: 4/12/2023 01:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centros](
	[numeroCentro] [varchar](6) NOT NULL,
	[nombreCentro] [varchar](100) NOT NULL,
	[ciudad] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numeroCentro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[directivos]    Script Date: 4/12/2023 01:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[directivos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[combustible] [bit] NOT NULL,
	[numeroEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 4/12/2023 01:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[numeroEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellidoPaterno] [varchar](100) NOT NULL,
	[apellidoMaterno] [varchar](100) NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[rfc] [varchar](10) NOT NULL,
	[numeroCentro] [varchar](6) NOT NULL,
	[numeroPuesto] [varchar](6) NOT NULL,
	[descripcionPuesto] [varchar](100) NOT NULL,
	[directivo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numeroEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestos]    Script Date: 4/12/2023 01:20:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestos](
	[numeroPuesto] [varchar](6) NOT NULL,
	[descripcionPuesto] [varchar](100) NOT NULL,
	[numeroCentro] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[numeroPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'000201', N'Tiendas Ángel FLores Ropa', N'Culiacán')
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'000202', N'Tiendas Ángel FLores Muebles', N'Culiacán')
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'000203', N'Tiendas Ángel FLores Cajas', N'Culiacán')
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'049001', N'La Primavera Ropa', N'Culiacán')
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'049002', N'La Primavera Muebles', N'Culiacán')
INSERT [dbo].[centros] ([numeroCentro], [nombreCentro], [ciudad]) VALUES (N'049003', N'La Primavera Cajas', N'Culiacán')
GO
SET IDENTITY_INSERT [dbo].[directivos] ON 

INSERT [dbo].[directivos] ([id], [combustible], [numeroEmpleado]) VALUES (1, 1, 1)
INSERT [dbo].[directivos] ([id], [combustible], [numeroEmpleado]) VALUES (2, 1, 3)
INSERT [dbo].[directivos] ([id], [combustible], [numeroEmpleado]) VALUES (3, 0, 5)
SET IDENTITY_INSERT [dbo].[directivos] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (1, N'Pedro', N'Perez', N'Pereida', CAST(N'1980-11-01' AS Date), N'PEP801101', N'000201', N'000001', N'Programador', 1)
INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (2, N'Mario', N'Perez', N'Perez', CAST(N'1980-11-02' AS Date), N'PEP801123', N'000202', N'000002', N'Programador2', 0)
INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (3, N'Jose', N'Perez', N'Ramos', CAST(N'1980-11-03' AS Date), N'PEP801321', N'000203', N'000003', N'Programador3', 1)
INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (4, N'Ramiro', N'Perez', N'Ruiz', CAST(N'1980-11-04' AS Date), N'PEP801789', N'049001', N'000004', N'Programador4', 0)
INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (5, N'Juan', N'Perez', N'Ochoa', CAST(N'1980-11-05' AS Date), N'PEP801987', N'049002', N'000005', N'Programador5', 1)
INSERT [dbo].[empleados] ([numeroEmpleado], [nombre], [apellidoPaterno], [apellidoMaterno], [fechaNacimiento], [rfc], [numeroCentro], [numeroPuesto], [descripcionPuesto], [directivo]) VALUES (6, N'Macario', N'Perez', N'Ocampo', CAST(N'1980-11-06' AS Date), N'PEP806813', N'049003', N'000006', N'Programador6', 0)
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000001', N'Programador', N'000201')
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000002', N'Programador2', N'000202')
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000003', N'Programador3', N'000203')
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000004', N'Programador4', N'049001')
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000005', N'Programador5', N'049002')
INSERT [dbo].[puestos] ([numeroPuesto], [descripcionPuesto], [numeroCentro]) VALUES (N'000006', N'Programador6', N'049003')
GO
ALTER TABLE [dbo].[directivos]  WITH CHECK ADD FOREIGN KEY([numeroEmpleado])
REFERENCES [dbo].[empleados] ([numeroEmpleado])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([numeroCentro])
REFERENCES [dbo].[centros] ([numeroCentro])
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD FOREIGN KEY([numeroPuesto])
REFERENCES [dbo].[puestos] ([numeroPuesto])
GO
ALTER TABLE [dbo].[puestos]  WITH CHECK ADD FOREIGN KEY([numeroCentro])
REFERENCES [dbo].[centros] ([numeroCentro])
GO
USE [master]
GO
ALTER DATABASE [EMPRESA_UNI] SET  READ_WRITE 
GO
