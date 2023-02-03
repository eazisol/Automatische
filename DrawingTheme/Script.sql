USE [master]
GO
/****** Object:  Database [Automatische]    Script Date: 02/03/2023 10:58:27 PM ******/
CREATE DATABASE [Automatische]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Automatische', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Automatische_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Automatische] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Automatische].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Automatische] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Automatische] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Automatische] SET ARITHABORT OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Automatische] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Automatische] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Automatische] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Automatische] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Automatische] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Automatische] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Automatische] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Automatische] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Automatische] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Automatische] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Automatische] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Automatische] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Automatische] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Automatische] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Automatische] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Automatische] SET RECOVERY FULL 
GO
ALTER DATABASE [Automatische] SET  MULTI_USER 
GO
ALTER DATABASE [Automatische] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Automatische] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Automatische] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Automatische] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Automatische] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Automatische] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Automatische', N'ON'
GO
ALTER DATABASE [Automatische] SET QUERY_STORE = OFF
GO
USE [Automatische]
GO
/****** Object:  Table [dbo].[tblAccessLevel]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccessLevel](
	[AccessId] [int] IDENTITY(1,1) NOT NULL,
	[EditAccess] [bit] NULL,
	[DeleteAccess] [bit] NULL,
	[CreateAccess] [bit] NULL,
	[MenuId] [int] NULL,
	[RoleId] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](500) NULL,
	[Code] [nvarchar](500) NULL,
	[Component] [varchar](500) NULL,
	[IsPlanner] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComponent]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComponent](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblComponent] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Action] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_tblLog] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[isParent] [bit] NULL,
	[ParentId] [int] NULL,
	[FontAwesome] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[ElementId] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[TotalPrice] [float] NULL,
	[Status] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[SubCategoryID] [int] NULL,
	[SubcategoryName] [varchar](500) NULL,
	[Price] [float] NULL,
	[MinAngle] [float] NULL,
	[MaxAngle] [float] NULL,
	[ThrowDistanceMax] [float] NULL,
	[ThrowDistanceMin] [float] NULL,
	[UniqueId] [nvarchar](500) NULL,
	[IWLength] [float] NULL,
	[PELength] [float] NULL,
	[PEHPipe] [int] NULL,
	[PEFPipe] [int] NULL,
	[PETPipe] [int] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSetting]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSetting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[SecretKey] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[ClientID] [nvarchar](max) NULL,
	[Port] [int] NULL,
	[SMTP] [nvarchar](max) NULL,
	[Mode] [nvarchar](max) NULL,
	[Editby] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[IsAdminReceived] [bit] NULL,
 CONSTRAINT [PK_tblSetting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubCategory]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubCategory](
	[SubcategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[SubcategoryName] [varchar](500) NULL,
	[ComponentPiktogramm] [varchar](500) NULL,
	[Unit] [varchar](50) NULL,
	[Price] [float] NULL,
	[SprinklerType] [varchar](50) NULL,
	[MinAngle] [float] NULL,
	[MaxAngle] [float] NULL,
	[ThrowDistanceMax] [float] NULL,
	[ThrowDistanceMin] [float] NULL,
	[ThrowWidth] [float] NULL,
	[ThrowHeight] [float] NULL,
	[mhgeneral] [float] NULL,
	[PipelineMaxLength] [float] NULL,
	[IrrigationWiringMaxStation] [float] NULL,
	[IrrigationComputermaxstation] [int] NULL,
	[IrrigationComputerindoor] [bit] NULL,
	[IrrigationComputeroutdoor] [bit] NULL,
	[IrrigationComputersmarphone] [bit] NULL,
	[valveboxcircle] [int] NULL,
	[valveboxFilter] [bit] NULL,
	[drinkingwatersource] [bit] NULL,
	[wellwatersource] [bit] NULL,
	[rainwatersource] [bit] NULL,
	[mh45] [float] NULL,
	[mh90] [float] NULL,
	[mh105] [float] NULL,
	[mh180] [float] NULL,
	[mh210] [float] NULL,
	[mh270] [float] NULL,
	[mh360] [float] NULL,
	[Plannercomponent] [bit] NULL,
	[BOMRelevant] [bit] NULL,
 CONSTRAINT [PK_tblSubCategory] PRIMARY KEY CLUSTERED 
(
	[SubcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDateTime] [datetime] NULL,
	[PaypalPaymentId] [nvarchar](50) NULL,
	[PayerEmail] [nvarchar](50) NULL,
	[PayerFirstName] [nvarchar](50) NULL,
	[PayerLastName] [nvarchar](50) NULL,
	[PayerId] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Amount] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[UserId] [int] NULL,
	[OrderId] [int] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 02/03/2023 10:58:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__tblUser__1788CC4CF61B627F] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccessLevel] ON 

INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (117, NULL, NULL, NULL, 1, 2, 1, CAST(N'2022-12-29T17:00:56.843' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.843' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (118, NULL, NULL, NULL, 2, 2, 1, CAST(N'2022-12-29T17:00:56.873' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.873' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (119, NULL, NULL, NULL, 3, 2, 1, CAST(N'2022-12-29T17:00:56.880' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.880' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (120, NULL, NULL, NULL, 4, 2, 1, CAST(N'2022-12-29T17:00:56.883' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.883' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (121, NULL, NULL, NULL, 5, 2, 1, CAST(N'2022-12-29T17:00:56.890' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.890' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (122, NULL, NULL, NULL, 6, 2, 1, CAST(N'2022-12-29T17:00:56.893' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.893' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (123, NULL, NULL, NULL, 7, 2, 1, CAST(N'2022-12-29T17:00:56.897' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.897' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (124, NULL, NULL, NULL, 8, 2, 1, CAST(N'2022-12-29T17:00:56.900' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.900' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (125, NULL, NULL, NULL, 9, 2, 1, CAST(N'2022-12-29T17:00:56.907' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.907' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (126, NULL, NULL, NULL, 10, 2, 1, CAST(N'2022-12-29T17:00:56.910' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.910' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (127, NULL, NULL, NULL, 11, 2, 1, CAST(N'2022-12-29T17:00:56.913' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.913' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (128, NULL, NULL, NULL, 12, 2, 1, CAST(N'2022-12-29T17:00:56.920' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.920' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (129, NULL, NULL, NULL, 14, 2, 1, CAST(N'2022-12-29T17:00:56.923' AS DateTime), 1, CAST(N'2022-12-29T17:00:56.923' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (174, NULL, NULL, NULL, 1, 1, 1, CAST(N'2023-02-01T11:13:05.230' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.230' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (175, NULL, NULL, NULL, 2, 1, 1, CAST(N'2023-02-01T11:13:05.247' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.247' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (176, NULL, NULL, NULL, 3, 1, 1, CAST(N'2023-02-01T11:13:05.250' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.250' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (177, NULL, NULL, NULL, 4, 1, 1, CAST(N'2023-02-01T11:13:05.253' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.253' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (178, NULL, NULL, NULL, 5, 1, 1, CAST(N'2023-02-01T11:13:05.257' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.257' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (179, NULL, NULL, NULL, 6, 1, 1, CAST(N'2023-02-01T11:13:05.260' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.260' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (180, NULL, NULL, NULL, 7, 1, 1, CAST(N'2023-02-01T11:13:05.263' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.263' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (181, NULL, NULL, NULL, 8, 1, 1, CAST(N'2023-02-01T11:13:05.267' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.267' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (182, NULL, NULL, NULL, 9, 1, 1, CAST(N'2023-02-01T11:13:05.273' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.273' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (183, NULL, NULL, NULL, 10, 1, 1, CAST(N'2023-02-01T11:13:05.277' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.277' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (184, NULL, NULL, NULL, 11, 1, 1, CAST(N'2023-02-01T11:13:05.280' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.280' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (185, NULL, NULL, NULL, 12, 1, 1, CAST(N'2023-02-01T11:13:05.283' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.283' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (186, NULL, NULL, NULL, 14, 1, 1, CAST(N'2023-02-01T11:13:05.287' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.287' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (187, NULL, NULL, NULL, 15, 1, 1, CAST(N'2023-02-01T11:13:05.290' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.290' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (188, NULL, NULL, NULL, 16, 1, 1, CAST(N'2023-02-01T11:13:05.297' AS DateTime), 1, CAST(N'2023-02-01T11:13:05.297' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAccessLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (1, N'Radial Sprinkler', N'RSP', N'\assets\images\ecommerce\RadialSprinkler.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (2, N'Square
Sprinkler', N'SSP', N'\assets\images\ecommerce\SquareSprinkler.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (3, N'Valve box', N'VB', N'\assets\images\ecommerce\ValveBox1.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (4, N'Irrigation Computer', N'IC', N'\assets\images\ecommerce\System1.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (5, N'Irrigation Wiring
', N'IW', N'\assets\images\ecommerce\wiring.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (6, N'PE Pipeline
', N'PE', N'\assets\images\ecommerce\Pipeline.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (7, N'TAP', N'TAP', N'\assets\images\ecommerce\Tap1.png', 1)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (8, N'Pipeline Connector
Pipeline Connector
Pipeline Connector
', N'PC', NULL, NULL)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (9, N'Cable Connector
', N'CC', NULL, NULL)
INSERT [dbo].[tblCategory] ([CategoryID], [CategoryName], [Code], [Component], [IsPlanner]) VALUES (10, N'Accesoires
', N'AC', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblComponent] ON 

INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, N'Lawn', N'Area', 10, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (5, N'Dry Area', N'DryArea', 20, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (6, N'Hedge', N'Hedge', 30, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (7, N'Sprinkler', N'Sprinkler', 30, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (8, N'Rectangular', N'RectangularSprinkler', 30, 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (9, N'Get Wet ', N'GetWet', 20, 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblComponent] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLog] ON 

INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (1, 1, N'Add User', CAST(N'2022-12-22T18:32:27.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (2, 1, N'Add User', CAST(N'2022-12-22T18:35:16.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (3, 1, N'Add User', CAST(N'2022-12-22T18:36:40.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (4, 1, N'Add User', CAST(N'2022-12-22T18:37:16.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (5, 1, N'Add User', CAST(N'2022-12-22T18:38:19.400' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (6, 1, N'Update User', CAST(N'2022-12-22T19:23:27.250' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (7, 1, N'Update User', CAST(N'2022-12-22T19:24:05.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (8, 1, N'Update User', CAST(N'2022-12-22T19:25:14.510' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (9, 1, N'Delete User', CAST(N'2022-12-22T19:49:39.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (10, 1, N'Update User', CAST(N'2022-12-22T19:51:06.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (11, 1, N'Create Role', CAST(N'2022-12-22T20:48:25.667' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (12, 1, N'Update Role', CAST(N'2022-12-22T20:53:58.507' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (13, 1, N'Update User', CAST(N'2022-12-22T21:06:38.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (14, 1, N'Update User', CAST(N'2022-12-22T21:38:23.540' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (15, 1, N'Update User', CAST(N'2022-12-22T21:38:43.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (16, 1, N'Login', CAST(N'2022-12-22T21:39:14.893' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (17, 1, N'Login', CAST(N'2022-12-23T12:45:32.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (18, 1, N'Login', CAST(N'2022-12-23T14:58:03.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (19, 1, N'Login', CAST(N'2022-12-23T15:49:06.133' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (20, 1, N'Login', CAST(N'2022-12-23T15:50:36.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (21, 1, N'Update User', CAST(N'2022-12-23T15:53:26.773' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (22, 1, N'Login', CAST(N'2022-12-23T15:56:15.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (23, 1, N'Add User', CAST(N'2022-12-23T15:56:55.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (24, 1, N'Login', CAST(N'2022-12-23T16:18:23.630' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (25, 1, N'Create Role', CAST(N'2022-12-23T16:18:39.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (26, 8, N'Login', CAST(N'2022-12-23T16:52:53.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (27, 8, N'Login', CAST(N'2022-12-23T17:23:43.020' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (28, 1, N'Login', CAST(N'2022-12-23T17:23:47.633' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (29, 1, N'Login', CAST(N'2022-12-23T17:36:30.170' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (30, 1, N'Login', CAST(N'2022-12-23T18:17:37.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (31, 1, N'Login', CAST(N'2022-12-23T18:20:07.153' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (32, 1, N'Login', CAST(N'2022-12-23T18:45:26.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (33, 1, N'Login', CAST(N'2022-12-23T18:47:02.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (34, 1, N'Delete User', CAST(N'2022-12-23T18:48:26.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (35, 1, N'Delete User', CAST(N'2022-12-23T18:49:52.670' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (36, 1, N'Login', CAST(N'2022-12-23T19:28:51.197' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (37, 1, N'Login', CAST(N'2022-12-23T19:42:01.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (38, 1, N'Login', CAST(N'2022-12-23T19:55:30.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (39, 1, N'Update User', CAST(N'2022-12-23T19:56:17.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (40, 1, N'Update User', CAST(N'2022-12-23T19:57:06.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (41, 1, N'Update User', CAST(N'2022-12-23T19:59:36.593' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (42, 1, N'Update User', CAST(N'2022-12-23T20:00:14.907' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (43, 1, N'Update User', CAST(N'2022-12-23T20:00:55.063' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (44, 1, N'Update User', CAST(N'2022-12-23T20:01:49.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (45, 1, N'Login', CAST(N'2022-12-23T20:25:17.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (46, 1, N'Login', CAST(N'2022-12-23T20:33:41.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (47, 1, N'Login', CAST(N'2022-12-23T20:37:55.183' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (48, 1, N'Login', CAST(N'2022-12-23T20:40:01.477' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (49, 1, N'Login', CAST(N'2022-12-23T20:44:23.740' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (50, 1, N'Login', CAST(N'2022-12-23T20:46:10.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (51, 1, N'Login', CAST(N'2022-12-23T20:47:42.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (52, 1, N'Change Password', CAST(N'2022-12-23T20:49:34.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (53, 1, N'Login', CAST(N'2022-12-23T21:02:24.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (54, 1, N'Change Password', CAST(N'2022-12-23T21:05:42.360' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (55, 1, N'Login', CAST(N'2022-12-23T21:05:59.050' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (56, 1, N'Update Role', CAST(N'2022-12-23T21:06:08.677' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (57, 1, N'Login', CAST(N'2022-12-23T21:06:11.663' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (58, 10, N'Login', CAST(N'2022-12-23T21:06:19.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (59, 10, N'Change Password', CAST(N'2022-12-23T21:06:37.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (60, 10, N'Update User', CAST(N'2022-12-23T21:07:06.057' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (61, 1, N'Login', CAST(N'2022-12-23T21:08:02.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (62, 1, N'Add User', CAST(N'2022-12-23T21:08:50.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (63, 1, N'Add User', CAST(N'2022-12-23T21:09:30.780' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (64, 1, N'Login', CAST(N'2022-12-23T21:48:57.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (65, 1, N'Login', CAST(N'2022-12-23T21:49:00.623' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (66, 1, N'Update Role', CAST(N'2022-12-23T21:49:21.173' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (67, 1, N'Login', CAST(N'2022-12-23T21:49:26.450' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (68, 1, N'Login', CAST(N'2022-12-23T21:49:42.393' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (69, 1, N'Login', CAST(N'2022-12-23T22:07:07.020' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (70, 1, N'Login', CAST(N'2022-12-24T12:23:32.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (71, 1, N'Login', CAST(N'2022-12-24T12:53:56.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (72, 1, N'Add Component', CAST(N'2022-12-24T12:54:20.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (73, 1, N'Update Component', CAST(N'2022-12-24T12:54:37.200' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (74, 1, N'Delete Component', CAST(N'2022-12-24T12:55:49.133' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (75, 1, N'Add Component', CAST(N'2022-12-24T12:56:18.287' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (76, 1, N'Update Component', CAST(N'2022-12-24T12:56:28.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (77, 1, N'Delete Component', CAST(N'2022-12-24T12:56:31.637' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (78, 1, N'Login', CAST(N'2022-12-24T14:56:14.017' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (79, 1, N'Login', CAST(N'2022-12-24T15:04:06.640' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (80, 1, N'Login', CAST(N'2022-12-24T15:04:18.270' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (81, 1, N'Update User', CAST(N'2022-12-24T15:04:41.530' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (82, 1, N'Login', CAST(N'2022-12-24T15:06:59.373' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (83, 1, N'Login', CAST(N'2022-12-24T15:09:13.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (84, 1, N'Login', CAST(N'2022-12-24T16:16:41.430' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (85, 1, N'Login', CAST(N'2022-12-24T16:22:50.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (86, 7, N'Login', CAST(N'2022-12-24T16:27:41.910' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (87, 1, N'Login', CAST(N'2022-12-24T17:07:12.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (88, 7, N'Login', CAST(N'2022-12-24T17:07:44.733' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (89, 7, N'Change Password', CAST(N'2022-12-24T17:08:04.520' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (90, 7, N'Login', CAST(N'2022-12-24T17:09:05.160' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (91, 7, N'Change Password', CAST(N'2022-12-24T17:09:16.463' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (92, 7, N'Change Password', CAST(N'2022-12-24T17:09:20.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (93, 7, N'Login', CAST(N'2022-12-24T17:12:54.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (94, 7, N'Change Password', CAST(N'2022-12-24T17:13:13.640' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (95, 1, N'Login', CAST(N'2022-12-24T17:13:57.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (96, 1, N'Update User', CAST(N'2022-12-24T17:14:56.657' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (97, 1, N'Update User', CAST(N'2022-12-24T17:15:20.007' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (98, 1, N'Login', CAST(N'2022-12-24T17:16:05.753' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (99, 1, N'Change Password', CAST(N'2022-12-24T17:16:16.107' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (100, 8, N'Login', CAST(N'2022-12-24T17:17:21.993' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (101, 8, N'Change Password', CAST(N'2022-12-24T17:17:49.660' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (102, 8, N'Login', CAST(N'2022-12-24T17:19:17.193' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (103, 8, N'Login', CAST(N'2022-12-24T17:19:25.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (104, 1, N'Login', CAST(N'2022-12-24T17:19:30.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (105, 1, N'Login', CAST(N'2022-12-24T17:42:25.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (106, 1, N'Login', CAST(N'2022-12-24T18:51:38.033' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (107, 1, N'Update Role', CAST(N'2022-12-24T18:51:46.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (108, 1, N'Login', CAST(N'2022-12-24T18:51:50.473' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (109, 1, N'Login', CAST(N'2022-12-24T19:05:06.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (110, 1, N'Login', CAST(N'2022-12-26T10:58:32.233' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (111, 1, N'Login', CAST(N'2022-12-26T11:24:45.370' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (112, 1, N'Add Order', CAST(N'2022-12-26T11:30:03.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (113, 1, N'Update Order', CAST(N'2022-12-26T11:30:19.920' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (114, 1, N'Update Order', CAST(N'2022-12-26T11:32:44.947' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (115, 1, N'Update Order', CAST(N'2022-12-26T11:33:13.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (116, 1, N'Login', CAST(N'2022-12-26T11:34:24.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (117, 1, N'Update Order', CAST(N'2022-12-26T11:34:33.540' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (118, 1, N'Update Order', CAST(N'2022-12-26T11:38:12.120' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (119, 1, N'Login', CAST(N'2022-12-26T12:01:59.100' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (120, 1, N'Update Order', CAST(N'2022-12-26T12:03:13.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (121, 1, N'Login', CAST(N'2022-12-26T12:04:30.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (122, 1, N'Add Order', CAST(N'2022-12-26T12:07:41.013' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (123, 1, N'Delete Order', CAST(N'2022-12-26T12:14:28.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (124, 1, N'Add Order', CAST(N'2022-12-26T12:14:48.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (125, 1, N'Update Order', CAST(N'2022-12-26T12:14:55.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (126, 1, N'Update Order', CAST(N'2022-12-26T12:15:04.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (127, 1, N'Update Order', CAST(N'2022-12-26T12:15:10.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (128, 1, N'Login', CAST(N'2022-12-26T12:47:42.923' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (129, 1, N'Add Order', CAST(N'2022-12-26T12:49:50.137' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (130, 1, N'Delete Order', CAST(N'2022-12-26T12:50:35.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (131, 1, N'Delete Order', CAST(N'2022-12-26T12:50:38.103' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (132, 1, N'Add Order', CAST(N'2022-12-26T12:50:43.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (133, 1, N'Add Order', CAST(N'2022-12-26T12:50:51.497' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (134, 1, N'Add Component', CAST(N'2022-12-26T12:52:47.147' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (135, 1, N'Add Component', CAST(N'2022-12-26T12:53:17.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (136, 1, N'Delete Component', CAST(N'2022-12-26T12:53:34.917' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (137, 1, N'Login', CAST(N'2022-12-26T13:08:12.310' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (138, 1, N'Login', CAST(N'2022-12-26T14:18:24.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (139, 1, N'Login', CAST(N'2022-12-26T14:34:03.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (140, 1, N'Add Order', CAST(N'2022-12-26T14:34:17.327' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (141, 1, N'Login', CAST(N'2022-12-26T14:35:06.860' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (142, 1, N'Add Order', CAST(N'2022-12-26T14:35:15.470' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (143, 1, N'Add Order', CAST(N'2022-12-26T14:35:38.897' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (144, 1, N'Add Order', CAST(N'2022-12-26T14:36:29.983' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (145, 1, N'Add Order', CAST(N'2022-12-26T14:37:18.957' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (146, 1, N'Add Order Details', CAST(N'2022-12-26T14:37:24.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (147, 1, N'Add Order Details', CAST(N'2022-12-26T14:37:26.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (148, 1, N'Login', CAST(N'2022-12-26T15:12:26.010' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (149, 1, N'Add Order', CAST(N'2022-12-26T15:13:27.970' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (150, 1, N'Add Order Details', CAST(N'2022-12-26T15:13:34.017' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (151, 1, N'Add Order Details', CAST(N'2022-12-26T15:14:19.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (152, 1, N'Login', CAST(N'2022-12-26T15:44:46.233' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (153, 1, N'Login', CAST(N'2022-12-26T15:57:25.613' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (154, 1, N'Update Order', CAST(N'2022-12-26T15:57:52.537' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (155, 1, N'Login', CAST(N'2022-12-26T16:15:17.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (156, 1, N'Login', CAST(N'2022-12-26T16:17:43.483' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (157, 1, N'Update Role', CAST(N'2022-12-26T16:18:05.533' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (158, 8, N'Login', CAST(N'2022-12-26T16:18:29.337' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (159, 8, N'Login', CAST(N'2022-12-26T16:23:03.207' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (160, 8, N'Add Order', CAST(N'2022-12-26T16:23:51.463' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (161, 8, N'Add Order', CAST(N'2022-12-26T16:24:31.487' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (162, 8, N'Login', CAST(N'2022-12-26T16:29:09.247' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (163, 8, N'Update Order', CAST(N'2022-12-26T16:29:39.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (164, 8, N'Login', CAST(N'2022-12-26T16:37:57.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (165, 1, N'Login', CAST(N'2022-12-26T16:39:21.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (166, 1, N'Login', CAST(N'2022-12-26T17:34:53.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (167, 1, N'Delete User', CAST(N'2022-12-26T17:35:03.487' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (168, 1, N'Update User', CAST(N'2022-12-26T17:35:51.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (169, 1, N'Delete User', CAST(N'2022-12-26T17:37:06.610' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (170, 1, N'Login', CAST(N'2022-12-26T18:52:26.737' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (171, 1, N'Add Order', CAST(N'2022-12-26T18:52:44.177' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (172, 1, N'Add Order Details', CAST(N'2022-12-26T18:52:45.897' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (173, 1, N'Add Order Details', CAST(N'2022-12-26T18:52:48.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (174, 1, N'Add Order Details', CAST(N'2022-12-26T18:53:31.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (175, 1, N'Add Order Details', CAST(N'2022-12-26T18:53:33.217' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (176, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:52.837' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (177, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:53.770' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (178, 1, N'Add Order Details', CAST(N'2022-12-26T18:54:57.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (179, 1, N'Login', CAST(N'2022-12-26T19:29:35.590' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (180, 1, N'Update Role', CAST(N'2022-12-26T19:30:44.223' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (181, 1, N'Update Role', CAST(N'2022-12-26T19:30:50.747' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (182, 1, N'Login', CAST(N'2022-12-26T19:30:55.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (183, 1, N'Add Order Details', CAST(N'2022-12-26T19:39:24.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (184, 1, N'Add Order Details', CAST(N'2022-12-26T19:39:26.150' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (185, 1, N'Add Order', CAST(N'2022-12-26T19:42:28.147' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (186, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:30.637' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (187, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:31.047' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (188, 1, N'Add Order Details', CAST(N'2022-12-26T19:42:33.443' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (189, 1, N'Login', CAST(N'2022-12-26T19:43:34.130' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (190, 1, N'Add Order', CAST(N'2022-12-26T19:43:42.830' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (191, 1, N'Add Order Details', CAST(N'2022-12-26T19:43:45.927' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (192, 1, N'Add Order Details', CAST(N'2022-12-26T19:43:47.707' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (193, 1, N'Add Order', CAST(N'2022-12-26T19:45:53.397' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (194, 1, N'Add Order Details', CAST(N'2022-12-26T19:50:03.407' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (195, 1, N'Add Order Details', CAST(N'2022-12-26T19:50:04.743' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (196, 1, N'Add Order', CAST(N'2022-12-26T19:51:27.217' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (197, 1, N'Add Order Details', CAST(N'2022-12-26T19:51:50.240' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (198, 1, N'Add Order Details', CAST(N'2022-12-26T19:51:50.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (199, 1, N'Login', CAST(N'2022-12-27T15:11:52.430' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (200, 1, N'Delete User', CAST(N'2022-12-27T15:15:08.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (201, 1, N'Delete User', CAST(N'2022-12-27T15:15:12.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (202, 1, N'Delete User', CAST(N'2022-12-27T15:15:14.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (203, 1, N'Delete User', CAST(N'2022-12-27T15:15:16.367' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (204, 1, N'Update User', CAST(N'2022-12-27T15:15:43.803' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (205, 1, N'Delete User', CAST(N'2022-12-27T15:15:56.730' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (206, 1, N'Add Order', CAST(N'2022-12-27T15:16:22.670' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (207, 1, N'Add Order Details', CAST(N'2022-12-27T15:16:24.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (208, 1, N'Add Order Details', CAST(N'2022-12-27T15:16:32.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (209, 1, N'Update User', CAST(N'2022-12-27T15:17:26.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (210, 1, N'Login', CAST(N'2022-12-27T15:21:24.627' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (211, 1, N'Login', CAST(N'2022-12-27T15:51:38.883' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (212, 1, N'Login', CAST(N'2022-12-27T15:52:17.220' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (213, 1, N'Login', CAST(N'2022-12-27T16:25:22.713' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (214, 1, N'Update Role', CAST(N'2022-12-27T16:26:12.590' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (215, 1, N'Login', CAST(N'2022-12-27T16:29:39.143' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (216, 1, N'Login', CAST(N'2022-12-27T16:39:06.827' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (217, 1, N'Login', CAST(N'2022-12-27T16:48:58.547' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (218, 1, N'Login', CAST(N'2022-12-27T16:49:54.730' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (219, 1, N'Login', CAST(N'2022-12-27T16:52:25.713' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (220, 1, N'Login', CAST(N'2022-12-27T16:53:06.007' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (221, 1, N'Login', CAST(N'2022-12-27T17:07:13.053' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (222, 1, N'Login', CAST(N'2022-12-27T17:33:58.350' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (223, 1, N'Update Role', CAST(N'2022-12-27T17:34:16.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (224, 1, N'Login', CAST(N'2022-12-27T17:43:50.623' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (225, 1, N'Add Order Details', CAST(N'2022-12-27T17:45:36.660' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (226, 1, N'Add Order Details', CAST(N'2022-12-27T17:45:57.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (227, 1, N'Add Order Details', CAST(N'2022-12-27T17:46:02.410' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (228, 1, N'Add Order', CAST(N'2022-12-27T17:46:13.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (229, 1, N'Add Order Details', CAST(N'2022-12-27T17:46:15.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (230, 1, N'Add Order', CAST(N'2022-12-27T17:47:13.517' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (231, 1, N'Add Order Details', CAST(N'2022-12-27T17:47:14.737' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (232, 1, N'Add Order Details', CAST(N'2022-12-27T17:47:21.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (233, 1, N'Add Order', CAST(N'2022-12-27T17:48:02.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (234, 1, N'Add Order Details', CAST(N'2022-12-27T17:48:09.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (235, 1, N'Add Order Details', CAST(N'2022-12-27T17:48:25.887' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (236, 1, N'Add Order', CAST(N'2022-12-27T17:49:43.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (237, 1, N'Add Order Details', CAST(N'2022-12-27T17:49:45.517' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (238, 1, N'Add Order Details', CAST(N'2022-12-27T17:49:47.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (239, 1, N'Add Order', CAST(N'2022-12-27T17:56:08.757' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (240, 1, N'Add Order Details', CAST(N'2022-12-27T17:56:09.757' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (241, 1, N'Login', CAST(N'2022-12-27T18:39:21.990' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (242, 1, N'Add Order', CAST(N'2022-12-27T18:39:32.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (243, 1, N'Add Order Details', CAST(N'2022-12-27T18:39:33.677' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (244, 1, N'Add Order Details', CAST(N'2022-12-27T18:39:34.437' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (245, 1, N'Login', CAST(N'2022-12-27T18:42:30.373' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (246, 1, N'Add Order', CAST(N'2022-12-27T18:42:38.467' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (247, 1, N'Add Order Details', CAST(N'2022-12-27T18:42:39.210' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (248, 1, N'Login', CAST(N'2022-12-27T19:15:05.527' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (249, 1, N'Add Order', CAST(N'2022-12-27T19:15:13.143' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (250, 1, N'Add Order Details', CAST(N'2022-12-27T19:15:14.140' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (251, 1, N'Login', CAST(N'2022-12-27T19:18:50.880' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (252, 1, N'Add Order', CAST(N'2022-12-27T19:18:57.220' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (253, 1, N'Add Order Details', CAST(N'2022-12-27T19:19:00.040' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (254, 1, N'Login', CAST(N'2022-12-27T19:20:41.673' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (255, 1, N'Add Order', CAST(N'2022-12-27T19:20:46.240' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (256, 1, N'Add Order Details', CAST(N'2022-12-27T19:20:47.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (257, 1, N'Login', CAST(N'2022-12-27T19:21:54.570' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (258, 1, N'Add Order', CAST(N'2022-12-27T19:22:08.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (259, 1, N'Add Order Details', CAST(N'2022-12-27T19:22:09.270' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (260, 1, N'Login', CAST(N'2022-12-27T19:56:34.983' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (261, 1, N'Add Order', CAST(N'2022-12-27T20:12:14.607' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (262, 1, N'Add Order Details', CAST(N'2022-12-27T20:12:17.047' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (263, 1, N'Login', CAST(N'2022-12-27T20:16:14.120' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (264, 1, N'Add Order', CAST(N'2022-12-27T20:16:27.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (265, 1, N'Add Order Details', CAST(N'2022-12-27T20:16:32.377' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (266, 1, N'Add Order', CAST(N'2022-12-27T20:17:52.200' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (267, 1, N'Add Order Details', CAST(N'2022-12-27T20:17:53.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (268, 1, N'Login', CAST(N'2022-12-27T20:22:56.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (269, 1, N'Add Order', CAST(N'2022-12-27T20:24:18.360' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (270, 1, N'Add Order Details', CAST(N'2022-12-27T20:24:19.507' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (271, 1, N'Add Order Details', CAST(N'2022-12-27T20:25:57.973' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (272, 1, N'Login', CAST(N'2022-12-27T20:36:32.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (273, 1, N'Add Order', CAST(N'2022-12-27T20:42:17.900' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (274, 1, N'Add Order Details', CAST(N'2022-12-27T20:42:20.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (275, 1, N'Login', CAST(N'2022-12-27T20:50:58.230' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (276, 1, N'Add Order', CAST(N'2022-12-27T20:51:09.493' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (277, 1, N'Add Order Details', CAST(N'2022-12-27T20:51:12.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (278, 1, N'Login', CAST(N'2022-12-27T21:22:27.547' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (279, 1, N'Login', CAST(N'2022-12-27T21:59:02.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (280, 1, N'Update User', CAST(N'2022-12-27T22:06:57.977' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (281, 1, N'Login', CAST(N'2022-12-27T22:13:12.923' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (282, 1, N'Add Order', CAST(N'2022-12-27T22:13:31.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (283, 1, N'Add Order', CAST(N'2022-12-27T22:15:59.057' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (284, 1, N'Add Order Details', CAST(N'2022-12-27T22:16:01.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (285, 1, N'Add Order Details', CAST(N'2022-12-27T22:16:12.750' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (286, 1, N'Add Order Details', CAST(N'2022-12-27T22:16:57.497' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (287, 1, N'Add Order Details', CAST(N'2022-12-27T22:17:01.260' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (288, 1, N'Add Order Details', CAST(N'2022-12-27T22:17:03.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (289, 1, N'Add Order Details', CAST(N'2022-12-27T22:17:09.210' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (290, 1, N'Add Order Details', CAST(N'2022-12-27T22:17:13.533' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (291, 1, N'Login', CAST(N'2022-12-28T12:05:12.880' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (292, 1, N'Login', CAST(N'2022-12-28T12:53:04.493' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (293, 1, N'Login', CAST(N'2022-12-28T14:47:42.553' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (294, 1, N'Login', CAST(N'2022-12-28T15:06:55.180' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (295, 1, N'Login', CAST(N'2022-12-28T15:35:20.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (296, 1, N'Login', CAST(N'2022-12-28T16:04:23.697' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (297, 1, N'Login', CAST(N'2022-12-28T16:07:28.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (298, 1, N'Login', CAST(N'2022-12-28T16:34:46.787' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (299, 1, N'Login', CAST(N'2022-12-28T19:47:38.013' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (300, 1, N'Login', CAST(N'2022-12-28T19:54:05.250' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (301, 1, N'Login', CAST(N'2022-12-28T20:02:18.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (302, 1, N'Login', CAST(N'2022-12-28T20:13:34.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (303, 1, N'Login', CAST(N'2022-12-29T11:40:02.703' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (304, 1, N'Login', CAST(N'2022-12-29T12:11:50.720' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (305, 1, N'Login', CAST(N'2022-12-29T12:19:27.173' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (306, 1, N'Login', CAST(N'2022-12-29T16:39:09.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (307, 1, N'Login', CAST(N'2022-12-29T16:41:16.230' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (308, 1, N'Login', CAST(N'2022-12-29T16:55:58.877' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (309, 1, N'Change Password', CAST(N'2022-12-29T16:56:15.657' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (310, 8, N'Login', CAST(N'2022-12-29T16:56:56.133' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (311, 1, N'Login', CAST(N'2022-12-29T16:59:39.450' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (312, 1, N'Update Role', CAST(N'2022-12-29T17:00:56.930' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (313, 8, N'Login', CAST(N'2022-12-29T17:01:02.947' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (314, 1, N'Login', CAST(N'2022-12-30T14:50:50.900' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (315, 1, N'Login', CAST(N'2022-12-30T15:39:43.693' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (316, 1, N'Login', CAST(N'2022-12-30T16:34:35.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (317, 1, N'Update Role', CAST(N'2022-12-30T16:35:21.553' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (318, 1, N'Login', CAST(N'2022-12-30T16:35:27.670' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (319, 1, N'Login', CAST(N'2022-12-30T16:37:37.253' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (320, 1, N'Login', CAST(N'2022-12-30T16:38:20.940' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (321, 1, N'Login', CAST(N'2023-01-02T12:31:15.513' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (322, 1, N'Add Order Details', CAST(N'2023-01-02T12:31:52.070' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (323, 1, N'Add Order Details', CAST(N'2023-01-02T12:31:53.427' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (324, 1, N'Add Order Details', CAST(N'2023-01-02T12:31:58.123' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (325, 1, N'Add Order', CAST(N'2023-01-02T12:37:29.550' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (326, 1, N'Add Order Details', CAST(N'2023-01-02T12:37:38.260' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (327, 1, N'Add Order Details', CAST(N'2023-01-02T12:37:39.457' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (328, 1, N'Add Order', CAST(N'2023-01-02T12:38:41.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (329, 1, N'Add Order Details', CAST(N'2023-01-02T12:39:10.857' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (330, 1, N'Add Order Details', CAST(N'2023-01-02T12:39:54.677' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (331, 1, N'Login', CAST(N'2023-01-02T12:42:27.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (332, 1, N'Add Order Details', CAST(N'2023-01-02T12:42:39.070' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (333, 1, N'Add Order Details', CAST(N'2023-01-02T12:42:41.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (334, 1, N'Add Order Details', CAST(N'2023-01-02T12:43:23.107' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (335, 1, N'Add Order Details', CAST(N'2023-01-02T12:44:06.973' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (336, 1, N'Add Order', CAST(N'2023-01-02T12:44:14.987' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (337, 1, N'Add Order Details', CAST(N'2023-01-02T12:44:16.273' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (338, 1, N'Login', CAST(N'2023-01-02T12:46:55.527' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (339, 1, N'Add Order Details', CAST(N'2023-01-02T12:47:01.687' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (340, 1, N'Add Order Details', CAST(N'2023-01-02T12:47:15.263' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (341, 1, N'Add Order Details', CAST(N'2023-01-02T12:47:17.340' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (342, 1, N'Add Order Details', CAST(N'2023-01-02T12:47:20.373' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (343, 1, N'Add Order Details', CAST(N'2023-01-02T12:47:36.800' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (344, 1, N'Add Order Details', CAST(N'2023-01-02T12:48:16.437' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (345, 1, N'Add Order Details', CAST(N'2023-01-02T12:48:20.853' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (346, 1, N'Login', CAST(N'2023-01-02T12:53:23.960' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (347, 1, N'Add Order Details', CAST(N'2023-01-02T12:55:05.940' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (348, 1, N'Add Order Details', CAST(N'2023-01-02T12:55:13.477' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (349, 1, N'Add Order Details', CAST(N'2023-01-02T12:55:24.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (350, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:05.700' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (351, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:13.080' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (352, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:22.080' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (353, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:34.650' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (354, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:42.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (355, 1, N'Add Order Details', CAST(N'2023-01-02T13:01:48.757' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (356, 1, N'Add Order Details', CAST(N'2023-01-02T13:02:08.603' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (357, 1, N'Add Order Details', CAST(N'2023-01-02T13:02:27.060' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (358, 1, N'Add Order Details', CAST(N'2023-01-02T13:02:35.330' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (359, 1, N'Add Order Details', CAST(N'2023-01-02T13:02:47.243' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (360, 1, N'Add Order Details', CAST(N'2023-01-02T13:03:10.033' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (361, 1, N'Add Order Details', CAST(N'2023-01-02T13:03:25.683' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (362, 1, N'Update Role', CAST(N'2023-01-02T13:09:47.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (363, 1, N'Login', CAST(N'2023-01-02T13:10:21.417' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (364, 1, N'Login', CAST(N'2023-01-02T13:58:25.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (365, 1, N'Login', CAST(N'2023-01-02T15:24:07.790' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (366, 1, N'Add Order Details', CAST(N'2023-01-02T15:40:08.697' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (367, 1, N'Add Order Details', CAST(N'2023-01-02T15:40:17.960' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (368, 1, N'Add Order Details', CAST(N'2023-01-02T15:40:23.610' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (369, 1, N'Add Order Details', CAST(N'2023-01-02T15:41:56.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (370, 1, N'Add Order Details', CAST(N'2023-01-02T15:42:09.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (371, 1, N'Add Order Details', CAST(N'2023-01-02T15:45:01.703' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (372, 1, N'Add Order Details', CAST(N'2023-01-02T15:45:10.193' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (373, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:06.560' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (374, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:11.037' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (375, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:29.460' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (376, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:33.160' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (377, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:39.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (378, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:42.213' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (379, 1, N'Add Order Details', CAST(N'2023-01-02T15:46:47.063' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (380, 1, N'Login', CAST(N'2023-01-02T15:53:45.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (381, 1, N'Login', CAST(N'2023-01-02T16:45:18.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (382, 1, N'Login', CAST(N'2023-01-02T17:05:39.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (383, 1, N'Login', CAST(N'2023-01-02T17:09:16.660' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (384, 1, N'Login', CAST(N'2023-01-02T17:21:43.937' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (385, 1, N'Login', CAST(N'2023-01-02T17:38:02.737' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (386, 1, N'Login', CAST(N'2023-01-02T18:29:07.120' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (387, 1, N'Login', CAST(N'2023-01-02T18:29:49.053' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (388, 1, N'Login', CAST(N'2023-01-02T19:05:20.460' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (389, 1, N'Login', CAST(N'2023-01-02T20:16:25.993' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (390, 1, N'Add Order Details', CAST(N'2023-01-02T20:19:40.087' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (391, 1, N'Login', CAST(N'2023-01-02T20:25:16.757' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (392, 1, N'Add Order Details', CAST(N'2023-01-02T20:27:54.183' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (393, 1, N'Login', CAST(N'2023-01-02T20:47:06.733' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (394, 1, N'Login', CAST(N'2023-01-03T12:33:16.520' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (395, 1, N'Login', CAST(N'2023-01-03T13:08:11.667' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (396, 1, N'Login', CAST(N'2023-01-03T14:03:19.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (397, 1, N'Add Order Details', CAST(N'2023-01-03T14:04:15.663' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (398, 1, N'Login', CAST(N'2023-01-03T14:18:46.927' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (399, 1, N'Login', CAST(N'2023-01-03T14:56:52.133' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (400, 1, N'Login', CAST(N'2023-01-03T15:50:12.333' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (401, 1, N'Login', CAST(N'2023-01-03T16:10:51.470' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (402, 1, N'Login', CAST(N'2023-01-03T17:09:20.803' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (403, 1, N'Login', CAST(N'2023-01-03T17:27:05.280' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (404, 1, N'Login', CAST(N'2023-01-03T18:29:09.703' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (405, 1, N'Login', CAST(N'2023-01-03T19:27:47.797' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (406, 1, N'Login', CAST(N'2023-01-03T20:17:45.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (407, 1, N'Add Order Details', CAST(N'2023-01-03T20:33:25.840' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (408, 1, N'Login', CAST(N'2023-01-03T21:10:32.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (409, 1, N'Add Order Details', CAST(N'2023-01-03T21:20:10.407' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (410, 1, N'Add Order', CAST(N'2023-01-03T21:27:42.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (411, 1, N'Add Order', CAST(N'2023-01-03T21:29:22.080' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (412, 1, N'Login', CAST(N'2023-01-03T21:32:34.150' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (413, 1, N'Add Order', CAST(N'2023-01-03T21:32:40.250' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (414, 1, N'Add Order', CAST(N'2023-01-03T21:34:22.960' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (415, 1, N'Add Order', CAST(N'2023-01-03T21:35:50.270' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (416, 1, N'Add Order', CAST(N'2023-01-03T21:37:58.537' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (417, 1, N'Add Order', CAST(N'2023-01-03T21:38:34.773' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (418, 1, N'Add Order Details', CAST(N'2023-01-03T21:39:32.617' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (419, 1, N'Add Order', CAST(N'2023-01-03T21:46:02.693' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (420, 1, N'Add Order', CAST(N'2023-01-03T21:47:41.480' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (421, 1, N'Add Order Details', CAST(N'2023-01-03T21:48:00.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (422, 1, N'Add Order', CAST(N'2023-01-03T21:48:36.800' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (423, 1, N'Add Order Details', CAST(N'2023-01-03T21:48:41.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (424, 1, N'Add Order Details', CAST(N'2023-01-03T21:48:48.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (425, 1, N'Add Order', CAST(N'2023-01-03T21:52:27.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (426, 1, N'Add Order', CAST(N'2023-01-03T21:53:02.460' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (427, 1, N'Add Order', CAST(N'2023-01-03T21:54:46.970' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (428, 1, N'Add Order Details', CAST(N'2023-01-03T21:54:51.343' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (429, 1, N'Add Order', CAST(N'2023-01-03T21:56:37.013' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (430, 1, N'Add Order', CAST(N'2023-01-03T21:57:04.787' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (431, 1, N'Add Order Details', CAST(N'2023-01-03T21:57:07.617' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (432, 1, N'Login', CAST(N'2023-01-03T21:58:53.800' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (433, 1, N'Add Order', CAST(N'2023-01-03T21:58:59.853' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (434, 1, N'Add Order Details', CAST(N'2023-01-03T21:59:02.800' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (435, 1, N'Add Order', CAST(N'2023-01-03T21:59:53.543' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (436, 1, N'Add Order Details', CAST(N'2023-01-03T21:59:56.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (437, 1, N'Add Order', CAST(N'2023-01-03T22:01:26.190' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (438, 1, N'Add Order Details', CAST(N'2023-01-03T22:01:33.937' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (439, 1, N'Add Order Details', CAST(N'2023-01-03T22:02:22.583' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (440, 1, N'Add Order', CAST(N'2023-01-03T22:08:22.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (441, 1, N'Add Order', CAST(N'2023-01-03T22:09:22.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (442, 1, N'Add Order Details', CAST(N'2023-01-03T22:09:36.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (443, 1, N'Add Order', CAST(N'2023-01-03T22:14:04.807' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (444, 1, N'Add Order Details', CAST(N'2023-01-03T22:15:27.553' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (445, 1, N'Add Order', CAST(N'2023-01-03T22:15:58.600' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (446, 1, N'Add Order Details', CAST(N'2023-01-03T22:18:05.920' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (447, 1, N'Add Order Details', CAST(N'2023-01-03T22:18:23.390' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (448, 1, N'Add Order Details', CAST(N'2023-01-03T22:20:46.877' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (449, 1, N'Login', CAST(N'2023-01-03T22:22:56.203' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (450, 1, N'Add Order', CAST(N'2023-01-03T22:23:01.917' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (451, 1, N'Login', CAST(N'2023-01-04T11:55:47.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (452, 1, N'Add Order', CAST(N'2023-01-04T11:55:55.390' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (453, 1, N'Add Order Details', CAST(N'2023-01-04T11:56:31.033' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (454, 1, N'Add Order Details', CAST(N'2023-01-04T12:03:40.533' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (455, 1, N'Login', CAST(N'2023-01-04T13:03:06.037' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (456, 1, N'Login', CAST(N'2023-01-04T13:06:13.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (457, 1, N'Add Order', CAST(N'2023-01-04T13:07:27.937' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (458, 1, N'Add Order Details', CAST(N'2023-01-04T13:07:39.067' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (459, 1, N'Add Order', CAST(N'2023-01-04T13:09:50.153' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (460, 1, N'Add Order Details', CAST(N'2023-01-04T13:09:58.537' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (461, 1, N'Add Order', CAST(N'2023-01-04T13:13:52.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (462, 1, N'Add Order Details', CAST(N'2023-01-04T13:14:00.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (463, 1, N'Delete Order Details', CAST(N'2023-01-04T13:14:16.023' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (464, 1, N'Add Order', CAST(N'2023-01-04T13:18:56.447' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (465, 1, N'Add Order', CAST(N'2023-01-04T13:20:04.183' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (466, 1, N'Add Order Details', CAST(N'2023-01-04T13:20:21.400' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (467, 1, N'Delete Order Details', CAST(N'2023-01-04T13:20:24.053' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (468, 1, N'Add Order Details', CAST(N'2023-01-04T13:20:36.077' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (469, 1, N'Delete Order Details', CAST(N'2023-01-04T13:20:48.340' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (470, 1, N'Add Order Details', CAST(N'2023-01-04T13:22:55.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (471, 1, N'Delete Order Details', CAST(N'2023-01-04T13:22:57.980' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (472, 1, N'Add Order', CAST(N'2023-01-04T13:30:03.490' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (473, 1, N'Add Order Details', CAST(N'2023-01-04T13:30:34.753' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (474, 1, N'Delete Order Details', CAST(N'2023-01-04T13:30:39.247' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (475, 1, N'Add Order Details', CAST(N'2023-01-04T13:30:50.740' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (476, 1, N'Delete Order Details', CAST(N'2023-01-04T13:30:52.447' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (477, 1, N'Add Order', CAST(N'2023-01-04T13:34:47.247' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (478, 1, N'Add Order Details', CAST(N'2023-01-04T13:34:58.880' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (479, 1, N'Delete Order Details', CAST(N'2023-01-04T13:35:06.697' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (480, 1, N'Add Order Details', CAST(N'2023-01-04T13:35:21.040' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (481, 1, N'Delete Order Details', CAST(N'2023-01-04T13:35:31.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (482, 1, N'Login', CAST(N'2023-01-04T14:01:15.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (483, 1, N'Add Order', CAST(N'2023-01-04T14:01:21.117' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (484, 1, N'Login', CAST(N'2023-01-04T16:15:48.123' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (485, 1, N'Add Order', CAST(N'2023-01-04T16:15:53.517' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (486, 1, N'Add Order', CAST(N'2023-01-04T16:20:45.560' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (487, 1, N'Add Order', CAST(N'2023-01-04T16:27:44.690' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (488, 1, N'Add Order Details', CAST(N'2023-01-04T16:28:14.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (489, 1, N'Delete Order Details', CAST(N'2023-01-04T16:28:18.043' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (490, 1, N'Add Order', CAST(N'2023-01-04T16:30:20.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (491, 1, N'Add Order', CAST(N'2023-01-04T16:33:02.987' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (492, 1, N'Add Order', CAST(N'2023-01-04T16:33:35.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (493, 1, N'Add Order', CAST(N'2023-01-04T17:02:24.753' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (494, 1, N'Add Order', CAST(N'2023-01-04T17:02:34.003' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (495, 1, N'Add Order', CAST(N'2023-01-04T17:07:31.940' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (496, 1, N'Add Order', CAST(N'2023-01-04T17:09:03.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (497, 1, N'Add Order', CAST(N'2023-01-04T17:29:17.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (498, 1, N'Login', CAST(N'2023-01-04T17:41:17.787' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (499, 1, N'Add Order', CAST(N'2023-01-04T17:41:24.040' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (500, 1, N'Add Order Details', CAST(N'2023-01-04T17:42:11.810' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (501, 1, N'Delete Order Details', CAST(N'2023-01-04T17:48:21.387' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (502, 1, N'Login', CAST(N'2023-01-04T17:48:58.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (503, 1, N'Add Order', CAST(N'2023-01-04T17:49:02.537' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (504, 1, N'Add Order', CAST(N'2023-01-04T17:50:22.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (505, 1, N'Add Order', CAST(N'2023-01-04T17:51:06.840' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (506, 1, N'Add Order Details', CAST(N'2023-01-04T17:52:12.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (507, 1, N'Delete Order Details', CAST(N'2023-01-04T17:52:13.050' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (508, 1, N'Add Order Details', CAST(N'2023-01-04T17:52:30.420' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (509, 1, N'Add Order', CAST(N'2023-01-04T18:05:32.173' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (510, 1, N'Add Order Details', CAST(N'2023-01-04T18:06:05.673' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (511, 1, N'Add Order', CAST(N'2023-01-04T18:07:02.190' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (512, 1, N'Add Order', CAST(N'2023-01-04T18:10:35.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (513, 1, N'Add Order Details', CAST(N'2023-01-04T18:10:48.163' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (514, 1, N'Delete Order Details', CAST(N'2023-01-04T18:11:05.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (515, 1, N'Login', CAST(N'2023-01-04T18:29:20.680' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (516, 1, N'Add Order', CAST(N'2023-01-04T18:29:31.333' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (517, 1, N'Add Order Details', CAST(N'2023-01-04T18:29:52.857' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (518, 1, N'Delete Order Details', CAST(N'2023-01-04T18:30:04.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (519, 1, N'Add Order Details', CAST(N'2023-01-04T18:30:11.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (520, 1, N'Login', CAST(N'2023-01-04T18:34:27.943' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (521, 1, N'Add Order', CAST(N'2023-01-04T18:34:34.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (522, 1, N'Add Order Details', CAST(N'2023-01-04T18:34:40.533' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (523, 1, N'Add Order', CAST(N'2023-01-04T18:36:08.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (524, 1, N'Add Order Details', CAST(N'2023-01-04T18:36:13.070' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (525, 1, N'Add Order', CAST(N'2023-01-04T18:37:11.103' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (526, 1, N'Add Order Details', CAST(N'2023-01-04T18:37:19.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (527, 1, N'Add Order Details', CAST(N'2023-01-04T18:37:40.813' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (528, 1, N'Add Order Details', CAST(N'2023-01-04T18:37:44.930' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (529, 1, N'Delete Order Details', CAST(N'2023-01-04T18:37:57.693' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (530, 1, N'Login', CAST(N'2023-01-04T18:51:31.310' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (531, 1, N'Add Order', CAST(N'2023-01-04T18:51:37.627' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (532, 1, N'Update Order Details', CAST(N'2023-01-04T18:51:42.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (533, 1, N'Login', CAST(N'2023-01-04T18:52:37.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (534, 1, N'Add Order', CAST(N'2023-01-04T18:52:44.660' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (535, 1, N'Add Order Details', CAST(N'2023-01-04T18:54:29.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (536, 1, N'Update Order Details', CAST(N'2023-01-04T18:55:01.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (537, 1, N'Add Order Details', CAST(N'2023-01-04T18:56:11.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (538, 1, N'Add Order Details', CAST(N'2023-01-04T18:56:40.163' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (539, 1, N'Add Order', CAST(N'2023-01-04T19:02:09.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (540, 1, N'Add Order Details', CAST(N'2023-01-04T19:02:21.757' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (541, 1, N'Delete Order Details', CAST(N'2023-01-04T19:02:28.980' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (542, 1, N'Add Order', CAST(N'2023-01-04T19:03:35.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (543, 1, N'Add Order Details', CAST(N'2023-01-04T19:03:40.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (544, 1, N'Delete Order Details', CAST(N'2023-01-04T19:03:52.900' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (545, 1, N'Add Order Details', CAST(N'2023-01-04T19:03:57.600' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (546, 1, N'Add Order', CAST(N'2023-01-04T19:05:41.990' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (547, 1, N'Add Order Details', CAST(N'2023-01-04T19:06:29.263' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (548, 1, N'Delete Order Details', CAST(N'2023-01-04T19:06:36.323' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (549, 1, N'Add Order Details', CAST(N'2023-01-04T19:06:41.267' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (550, 1, N'Delete Order Details', CAST(N'2023-01-04T19:06:50.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (551, 1, N'Login', CAST(N'2023-01-04T19:36:43.237' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (552, 1, N'Add Order', CAST(N'2023-01-04T19:36:47.520' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (553, 1, N'Add Order Details', CAST(N'2023-01-04T19:37:03.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (554, 1, N'Add Order', CAST(N'2023-01-04T19:38:20.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (555, 1, N'Add Order Details', CAST(N'2023-01-04T19:38:30.393' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (556, 1, N'Add Order', CAST(N'2023-01-04T19:40:28.123' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (557, 1, N'Add Order Details', CAST(N'2023-01-04T19:40:32.593' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (558, 1, N'Delete Order Details', CAST(N'2023-01-04T19:40:53.407' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (559, 1, N'Add Order Details', CAST(N'2023-01-04T19:41:01.010' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (560, 1, N'Add Order', CAST(N'2023-01-04T19:44:38.033' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (561, 1, N'Add Order Details', CAST(N'2023-01-04T19:44:41.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (562, 1, N'Update Order Details', CAST(N'2023-01-04T19:44:48.700' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (563, 1, N'Delete Order Details', CAST(N'2023-01-04T19:45:22.673' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (564, 1, N'Add Order Details', CAST(N'2023-01-04T19:45:40.570' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (565, 1, N'Delete Order Details', CAST(N'2023-01-04T19:45:45.107' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (566, 1, N'Add Order', CAST(N'2023-01-04T19:54:19.197' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (567, 1, N'Add Order', CAST(N'2023-01-04T19:55:45.280' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (568, 1, N'Add Order', CAST(N'2023-01-04T19:58:15.730' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (569, 1, N'Add Order', CAST(N'2023-01-04T19:59:22.100' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (570, 1, N'Add Order', CAST(N'2023-01-04T20:12:04.197' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (571, 1, N'Add Order Details', CAST(N'2023-01-04T20:12:23.393' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (572, 1, N'Update Order Details', CAST(N'2023-01-04T20:12:41.840' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (573, 1, N'Add Order Details', CAST(N'2023-01-04T20:13:09.090' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (574, 1, N'Add Order Details', CAST(N'2023-01-04T20:13:17.377' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (575, 1, N'Delete Order Details', CAST(N'2023-01-04T20:14:36.170' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (576, 1, N'Add Order Details', CAST(N'2023-01-04T20:16:00.370' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (577, 1, N'Delete Order Details', CAST(N'2023-01-04T20:16:15.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (578, 1, N'Update Order Details', CAST(N'2023-01-04T20:16:56.853' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (579, 1, N'Add Order Details', CAST(N'2023-01-04T20:17:00.753' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (580, 1, N'Delete Order Details', CAST(N'2023-01-04T20:17:16.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (581, 1, N'Add Order Details', CAST(N'2023-01-04T20:18:11.240' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (582, 1, N'Delete Order Details', CAST(N'2023-01-04T20:18:31.683' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (583, 1, N'Add Order', CAST(N'2023-01-04T20:21:05.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (584, 1, N'Login', CAST(N'2023-01-04T20:24:09.990' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (585, 1, N'Add Order', CAST(N'2023-01-04T20:24:15.807' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (586, 1, N'Add Order Details', CAST(N'2023-01-04T20:24:23.277' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (587, 1, N'Add Order', CAST(N'2023-01-04T20:25:45.923' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (588, 1, N'Add Order Details', CAST(N'2023-01-04T20:25:55.617' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (589, 1, N'Add Order', CAST(N'2023-01-04T20:28:28.490' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (590, 1, N'Add Order Details', CAST(N'2023-01-04T20:28:40.930' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (591, 1, N'Add Order', CAST(N'2023-01-04T20:30:59.210' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (592, 1, N'Add Order', CAST(N'2023-01-04T20:43:02.980' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (593, 1, N'Add Order', CAST(N'2023-01-04T20:44:20.287' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (594, 1, N'Add Order', CAST(N'2023-01-04T20:47:47.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (595, 1, N'Add Order', CAST(N'2023-01-04T20:50:16.433' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (596, 1, N'Add Order', CAST(N'2023-01-04T20:52:32.057' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (597, 1, N'Add Order', CAST(N'2023-01-04T20:54:27.527' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (598, 1, N'Add Order', CAST(N'2023-01-04T20:55:13.243' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (599, 1, N'Add Order', CAST(N'2023-01-04T20:59:05.243' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (600, 1, N'Add Order', CAST(N'2023-01-04T21:00:46.237' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (601, 1, N'Login', CAST(N'2023-01-05T12:00:30.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (602, 1, N'Add Order', CAST(N'2023-01-05T12:00:42.483' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (603, 1, N'Add Order Details', CAST(N'2023-01-05T12:00:50.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (604, 1, N'Update Order Details', CAST(N'2023-01-05T12:01:16.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (605, 1, N'Add Order', CAST(N'2023-01-05T12:01:29.947' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (606, 1, N'Add Order', CAST(N'2023-01-05T12:02:04.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (607, 1, N'Add Order', CAST(N'2023-01-05T12:02:16.507' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (608, 1, N'Add Order Details', CAST(N'2023-01-05T12:02:30.373' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (609, 1, N'Delete Order Details', CAST(N'2023-01-05T12:02:47.437' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (610, 1, N'Add Order', CAST(N'2023-01-05T12:06:55.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (611, 1, N'Add Order Details', CAST(N'2023-01-05T12:07:04.370' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (612, 1, N'Update Order Details', CAST(N'2023-01-05T12:07:07.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (613, 1, N'Login', CAST(N'2023-01-05T14:22:39.733' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (614, 1, N'Login', CAST(N'2023-01-05T15:21:25.120' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (615, 1, N'Login', CAST(N'2023-01-05T15:43:42.267' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (616, 1, N'Update Order Details', CAST(N'2023-01-05T15:53:50.023' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (617, 1, N'Update Order Details', CAST(N'2023-01-05T15:56:46.993' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (618, 1, N'Update Order Details', CAST(N'2023-01-05T15:59:20.593' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (619, 1, N'Update Order Details', CAST(N'2023-01-05T16:01:32.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (620, 1, N'Update Order Details', CAST(N'2023-01-05T16:16:24.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (621, 1, N'Add Order Details', CAST(N'2023-01-05T16:17:51.990' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (622, 1, N'Update Order Details', CAST(N'2023-01-05T16:28:50.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (623, 1, N'Login', CAST(N'2023-01-05T16:29:46.620' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (624, 1, N'Update Order Details', CAST(N'2023-01-05T16:30:01.820' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (625, 1, N'Update Order Details', CAST(N'2023-01-05T16:30:54.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (626, 1, N'Update Order Details', CAST(N'2023-01-05T16:31:34.723' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (627, 1, N'Update Order Details', CAST(N'2023-01-05T16:32:20.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (628, 1, N'Update Order Details', CAST(N'2023-01-05T16:32:52.630' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (629, 1, N'Update Order Details', CAST(N'2023-01-05T16:36:00.283' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (630, 1, N'Update Order Details', CAST(N'2023-01-05T16:36:55.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (631, 1, N'Login', CAST(N'2023-01-05T16:37:38.287' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (632, 1, N'Update Order Details', CAST(N'2023-01-05T16:37:48.657' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (633, 1, N'Update Order Details', CAST(N'2023-01-05T16:40:02.703' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (634, 1, N'Update Order Details', CAST(N'2023-01-05T16:40:57.183' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (635, 1, N'Update Order Details', CAST(N'2023-01-05T16:48:26.357' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (636, 1, N'Login', CAST(N'2023-01-05T16:49:13.700' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (637, 1, N'Update Order Details', CAST(N'2023-01-05T16:50:41.107' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (638, 1, N'Add Order', CAST(N'2023-01-05T16:51:12.077' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (639, 1, N'Add Order Details', CAST(N'2023-01-05T16:51:17.190' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (640, 1, N'Update Order Details', CAST(N'2023-01-05T17:00:27.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (641, 1, N'Delete Order Details', CAST(N'2023-01-05T17:00:29.150' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (642, 1, N'Add Order Details', CAST(N'2023-01-05T17:02:57.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (643, 1, N'Delete Order Details', CAST(N'2023-01-05T17:02:59.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (644, 1, N'Add Order Details', CAST(N'2023-01-05T17:03:48.790' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (645, 1, N'Delete Order Details', CAST(N'2023-01-05T17:04:02.293' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (646, 1, N'Add Order Details', CAST(N'2023-01-05T17:05:16.253' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (647, 1, N'Delete Order Details', CAST(N'2023-01-05T17:05:19.957' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (648, 1, N'Add Order Details', CAST(N'2023-01-05T17:05:59.693' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (649, 1, N'Add Order Details', CAST(N'2023-01-05T17:06:16.130' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (650, 1, N'Delete Order Details', CAST(N'2023-01-05T17:06:19.260' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (651, 1, N'Update Order Details', CAST(N'2023-01-05T17:06:46.843' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (652, 1, N'Add Order', CAST(N'2023-01-05T17:07:20.563' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (653, 1, N'Add Order Details', CAST(N'2023-01-05T17:07:40.443' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (654, 1, N'Delete Order Details', CAST(N'2023-01-05T17:07:45.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (655, 1, N'Add Order Details', CAST(N'2023-01-05T17:07:54.883' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (656, 1, N'Delete Order Details', CAST(N'2023-01-05T17:08:23.327' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (657, 1, N'Add Order', CAST(N'2023-01-05T17:16:13.083' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (658, 1, N'Add Order Details', CAST(N'2023-01-05T17:16:21.353' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (659, 1, N'Add Order', CAST(N'2023-01-05T17:20:20.457' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (660, 1, N'Add Order Details', CAST(N'2023-01-05T17:20:26.337' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (661, 1, N'Login', CAST(N'2023-01-05T17:22:30.280' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (662, 1, N'Add Order', CAST(N'2023-01-05T17:22:36.727' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (663, 1, N'Add Order Details', CAST(N'2023-01-05T17:22:42.700' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (664, 1, N'Add Order', CAST(N'2023-01-05T17:24:38.690' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (665, 1, N'Add Order Details', CAST(N'2023-01-05T17:24:46.060' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (666, 1, N'Delete Order Details', CAST(N'2023-01-05T17:25:36.343' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (667, 1, N'Add Order', CAST(N'2023-01-05T17:27:17.207' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (668, 1, N'Login', CAST(N'2023-01-05T18:04:30.090' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (669, 1, N'Login', CAST(N'2023-01-05T18:31:42.380' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (670, 1, N'Add Order Details', CAST(N'2023-01-05T18:52:54.143' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (671, 1, N'Add Order Details', CAST(N'2023-01-05T19:08:21.613' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (672, 1, N'Update Order Details', CAST(N'2023-01-05T19:08:32.073' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (673, 1, N'Add Order', CAST(N'2023-01-05T19:09:16.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (674, 1, N'Add Order Details', CAST(N'2023-01-05T19:09:44.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (675, 1, N'Delete Order Details', CAST(N'2023-01-05T19:10:32.893' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (676, 1, N'Login', CAST(N'2023-01-05T19:51:22.633' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (677, 1, N'Add Order Details', CAST(N'2023-01-05T19:52:13.137' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (678, 1, N'Delete Order Details', CAST(N'2023-01-05T19:52:24.270' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (679, 1, N'Delete Order Details', CAST(N'2023-01-05T19:54:24.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (680, 1, N'Login', CAST(N'2023-01-05T20:40:45.773' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (681, 1, N'Login', CAST(N'2023-01-06T12:57:16.503' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (682, 1, N'Login', CAST(N'2023-01-06T14:37:42.107' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (683, 1, N'Login', CAST(N'2023-01-06T15:04:10.853' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (684, 1, N'Login', CAST(N'2023-01-06T15:41:56.483' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (685, 1, N'Update Order Details', CAST(N'2023-01-06T15:46:36.577' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (686, 1, N'Delete Order Details', CAST(N'2023-01-06T15:46:40.093' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (687, 1, N'Add Order Details', CAST(N'2023-01-06T15:56:40.123' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (688, 1, N'Delete Order Details', CAST(N'2023-01-06T15:56:42.443' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (689, 1, N'Login', CAST(N'2023-01-20T16:32:37.777' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (690, 1, N'Add Order', CAST(N'2023-01-20T16:34:01.263' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (691, 1, N'Login', CAST(N'2023-01-30T18:53:47.930' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (692, 1, N'Login', CAST(N'2023-01-31T11:42:00.013' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (693, 1, N'Login', CAST(N'2023-01-31T12:14:25.503' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (694, 1, N'Login', CAST(N'2023-01-31T12:43:55.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (695, 1, N'Login', CAST(N'2023-01-31T13:17:23.163' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (696, 1, N'Login', CAST(N'2023-01-31T14:57:04.397' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (697, 1, N'Login', CAST(N'2023-01-31T15:44:14.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (698, 1, N'Login', CAST(N'2023-01-31T16:03:25.600' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (699, 1, N'Login', CAST(N'2023-01-31T16:53:19.280' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (700, 1, N'Login', CAST(N'2023-01-31T17:02:14.873' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (701, 1, N'Login', CAST(N'2023-01-31T17:36:51.457' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (702, 1, N'Login', CAST(N'2023-01-31T18:05:13.740' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (703, 1, N'Login', CAST(N'2023-01-31T18:33:15.767' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (704, 1, N'Login', CAST(N'2023-01-31T19:55:46.443' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (705, 1, N'Login', CAST(N'2023-01-31T19:56:51.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (706, 1, N'Login', CAST(N'2023-01-31T19:56:51.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (707, 1, N'Add Order Details', CAST(N'2023-01-31T20:07:49.967' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (708, 1, N'Update Order Details', CAST(N'2023-01-31T20:08:13.240' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (709, 1, N'Update Order Details', CAST(N'2023-01-31T20:08:49.333' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (710, 1, N'Login', CAST(N'2023-02-01T10:40:36.140' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (711, 1, N'Login', CAST(N'2023-02-01T11:12:07.217' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (712, 1, N'Update Role', CAST(N'2023-02-01T11:12:48.857' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (713, 1, N'Login', CAST(N'2023-02-01T11:12:52.887' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (714, 1, N'Update Role', CAST(N'2023-02-01T11:13:05.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (715, 1, N'Login', CAST(N'2023-02-01T11:13:14.773' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (716, 1, N'Login', CAST(N'2023-02-01T12:36:33.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (717, 1, N'Login', CAST(N'2023-02-01T13:18:23.837' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (718, 1, N'Login', CAST(N'2023-02-01T13:53:24.830' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (719, 1, N'Login', CAST(N'2023-02-01T14:14:05.437' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (720, 1, N'Login', CAST(N'2023-02-01T14:24:17.807' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (721, 1, N'Login', CAST(N'2023-02-01T14:54:10.820' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (722, 1, N'Login', CAST(N'2023-02-01T16:03:32.983' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (723, 1, N'Login', CAST(N'2023-02-01T16:16:50.893' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (724, 1, N'Login', CAST(N'2023-02-01T16:17:41.677' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (725, 1, N'Login', CAST(N'2023-02-01T16:52:00.453' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (726, 1, N'Add Order Details', CAST(N'2023-02-01T16:55:08.740' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (727, 1, N'Add Order Details', CAST(N'2023-02-01T17:08:21.247' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (728, 1, N'Delete Order Details', CAST(N'2023-02-01T17:08:25.563' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (729, 1, N'Login', CAST(N'2023-02-01T18:18:29.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (730, 1, N'Login', CAST(N'2023-02-01T18:21:33.327' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (731, 1, N'Login', CAST(N'2023-02-01T18:38:59.020' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (732, 1, N'Login', CAST(N'2023-02-01T18:57:31.943' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (733, 1, N'Login', CAST(N'2023-02-01T19:10:59.883' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (734, 1, N'Login', CAST(N'2023-02-01T19:11:00.747' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (735, 1, N'Login', CAST(N'2023-02-01T19:25:50.257' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (736, 1, N'Login', CAST(N'2023-02-01T19:40:36.713' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (737, 1, N'Login', CAST(N'2023-02-01T20:17:48.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (738, 1, N'Login', CAST(N'2023-02-02T12:39:51.300' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (739, 1, N'Add Order Details', CAST(N'2023-02-02T13:12:03.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (740, 1, N'Delete Order Details', CAST(N'2023-02-02T13:12:21.123' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (741, 1, N'Add Order Details', CAST(N'2023-02-02T13:12:33.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (742, 1, N'Update Order Details', CAST(N'2023-02-02T13:12:49.500' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (743, 1, N'Login', CAST(N'2023-02-02T14:51:54.227' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (744, 1, N'Update Order Details', CAST(N'2023-02-02T14:52:15.147' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (745, 1, N'Update Order Details', CAST(N'2023-02-02T14:52:33.220' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (746, 1, N'Update Order Details', CAST(N'2023-02-02T14:54:06.830' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (747, 1, N'Update Order Details', CAST(N'2023-02-02T15:00:33.350' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (748, 1, N'Delete Order Details', CAST(N'2023-02-02T15:01:35.970' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (749, 1, N'Login', CAST(N'2023-02-02T17:21:36.693' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (750, 1, N'Delete Order Details', CAST(N'2023-02-02T17:23:53.623' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (751, 1, N'Add Order Details', CAST(N'2023-02-02T17:25:17.517' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (752, 1, N'Delete Order Details', CAST(N'2023-02-02T17:25:25.070' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (753, 1, N'Login', CAST(N'2023-02-02T18:08:32.620' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (754, 1, N'Add Order Details', CAST(N'2023-02-02T18:33:24.810' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (755, 1, N'Delete Order Details', CAST(N'2023-02-02T18:33:29.523' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (756, 1, N'Delete Order Details', CAST(N'2023-02-02T18:33:40.473' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (757, 1, N'Add Order Details', CAST(N'2023-02-02T18:33:43.067' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (758, 1, N'Add Order Details', CAST(N'2023-02-02T18:34:59.070' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (759, 1, N'Login', CAST(N'2023-02-02T19:01:31.400' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (760, 1, N'Login', CAST(N'2023-02-03T15:01:28.273' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (761, 1, N'Update Order Details', CAST(N'2023-02-03T15:02:28.280' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (762, 1, N'Add Order', CAST(N'2023-02-03T15:03:13.703' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (763, 1, N'Add Order Details', CAST(N'2023-02-03T15:03:17.647' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (764, 1, N'Delete Order Details', CAST(N'2023-02-03T15:03:19.697' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (765, 1, N'Add Order Details', CAST(N'2023-02-03T15:03:28.400' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (766, 1, N'Delete Order Details', CAST(N'2023-02-03T15:03:34.127' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (767, 1, N'Add Order Details', CAST(N'2023-02-03T15:04:31.590' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (768, 1, N'Delete Order Details', CAST(N'2023-02-03T15:07:42.690' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (769, 1, N'Add Order Details', CAST(N'2023-02-03T15:09:10.863' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (770, 1, N'Delete Order Details', CAST(N'2023-02-03T15:10:09.713' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (771, 1, N'Delete Order Details', CAST(N'2023-02-03T15:14:07.283' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (772, 1, N'Delete Order Details', CAST(N'2023-02-03T15:14:07.890' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (773, 1, N'Login', CAST(N'2023-02-03T15:55:44.473' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (774, 1, N'Login', CAST(N'2023-02-03T16:17:17.330' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (775, 1, N'Add Order', CAST(N'2023-02-03T16:18:51.250' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (776, 1, N'Login', CAST(N'2023-02-03T17:16:43.857' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (777, 1, N'Add Order', CAST(N'2023-02-03T17:17:25.483' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (778, 1, N'Add Order', CAST(N'2023-02-03T17:27:14.437' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (779, 1, N'Login', CAST(N'2023-02-03T17:27:42.837' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (780, 1, N'Add Order', CAST(N'2023-02-03T17:27:49.923' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (781, 1, N'Login', CAST(N'2023-02-03T17:30:40.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (782, 1, N'Add Order', CAST(N'2023-02-03T17:30:47.970' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (783, 1, N'Login', CAST(N'2023-02-03T18:08:03.920' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (784, 1, N'Add Order', CAST(N'2023-02-03T18:08:16.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (785, 1, N'Login', CAST(N'2023-02-03T18:20:34.833' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (786, 1, N'Add Order', CAST(N'2023-02-03T18:22:37.170' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (787, 1, N'Login', CAST(N'2023-02-03T18:29:21.903' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (788, 1, N'Add Order', CAST(N'2023-02-03T18:29:29.553' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (789, 1, N'Login', CAST(N'2023-02-03T18:35:45.707' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (790, 1, N'Login', CAST(N'2023-02-03T18:37:24.320' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (791, 1, N'Add Order', CAST(N'2023-02-03T18:37:31.763' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (792, 1, N'Login', CAST(N'2023-02-03T18:56:42.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (793, 1, N'Add Order', CAST(N'2023-02-03T18:56:50.653' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (794, 1, N'Login', CAST(N'2023-02-03T19:03:48.530' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (795, 1, N'Add Order', CAST(N'2023-02-03T19:03:56.307' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (796, 1, N'Login', CAST(N'2023-02-03T19:06:02.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (797, 1, N'Add Order', CAST(N'2023-02-03T19:06:09.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (798, 1, N'Login', CAST(N'2023-02-03T19:07:54.913' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (799, 1, N'Add Order', CAST(N'2023-02-03T19:08:03.913' AS DateTime))
GO
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (800, 1, N'Login', CAST(N'2023-02-03T20:22:36.667' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (801, 1, N'Add Order', CAST(N'2023-02-03T20:22:43.027' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (802, 1, N'Add Order Details', CAST(N'2023-02-03T20:22:49.113' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (803, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:24:28.947' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (804, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:27:50.367' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (805, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:28:43.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (806, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:29:34.667' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (807, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:30:28.230' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (808, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:31:38.180' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (809, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T20:33:09.907' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (810, 1, N'Login', CAST(N'2023-02-03T20:34:44.130' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (811, 1, N'Add Order', CAST(N'2023-02-03T20:34:49.697' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (812, 1, N'Login', CAST(N'2023-02-03T20:57:14.097' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (813, 1, N'Add Order', CAST(N'2023-02-03T20:57:17.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (814, 1, N'Login', CAST(N'2023-02-03T21:19:40.337' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (815, 1, N'Add Order', CAST(N'2023-02-03T21:19:44.640' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (816, 1, N'Login', CAST(N'2023-02-03T21:31:02.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (817, 1, N'Add Order', CAST(N'2023-02-03T21:31:08.957' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (818, 1, N'Login', CAST(N'2023-02-03T22:05:12.067' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (819, 1, N'Add Order', CAST(N'2023-02-03T22:05:26.423' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (820, 1, N'Add Order Details', CAST(N'2023-02-03T22:05:34.493' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (821, 1, N'Add Order Details', CAST(N'2023-02-03T22:05:41.663' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (822, 1, N'Add Order Details', CAST(N'2023-02-03T22:05:48.413' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (823, 1, N'Add Order Details', CAST(N'2023-02-03T22:05:58.880' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (824, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:13:41.347' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (825, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:06.263' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (826, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:10.187' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (827, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:36.297' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (828, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:38.520' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (829, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:40.180' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (830, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:42.000' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (831, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:44.337' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (832, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:46.867' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (833, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:48.643' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (834, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:15:50.130' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (835, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:19:44.040' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (836, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:19:45.810' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (837, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:20:13.303' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (838, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:20:44.110' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (839, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:21:03.473' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (840, 1, N'Login', CAST(N'2023-02-03T22:22:09.950' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (841, 1, N'Add Order', CAST(N'2023-02-03T22:22:17.423' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (842, 1, N'Add Order Details', CAST(N'2023-02-03T22:22:20.363' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (843, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:24.590' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (844, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:27.823' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (845, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:33.010' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (846, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:35.073' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (847, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:36.673' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (848, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:37.617' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (849, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:23:37.793' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (850, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:24:54.710' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (851, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:46.423' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (852, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:47.813' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (853, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:48.870' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (854, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:49.557' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (855, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:52.627' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (856, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:54.687' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (857, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:25:56.457' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (858, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:28:49.383' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (859, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:29:00.630' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (860, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:30:46.933' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (861, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:30:53.963' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (862, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:31:36.997' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (863, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:32:08.477' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (864, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:33:01.820' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (865, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:33:47.503' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (866, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:34:49.360' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (867, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:35:34.220' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (868, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:37:41.190' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (869, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:32.877' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (870, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:34.053' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (871, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:35.197' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (872, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:43.157' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (873, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:58.783' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (874, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:43:59.610' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (875, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:02.067' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (876, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:03.850' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (877, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:34.710' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (878, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:37.797' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (879, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:44.410' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (880, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:44:45.937' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (881, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:46:55.807' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (882, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:46:56.617' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (883, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:46:59.313' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (884, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:47:00.760' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (885, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:51:19.993' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (886, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:51:23.230' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (887, 1, N'Add Accesoires Order Details', CAST(N'2023-02-03T22:51:24.477' AS DateTime))
INSERT [dbo].[tblLog] ([LogId], [UserId], [Action], [CreatedDate]) VALUES (888, 1, N'Login', CAST(N'2023-02-03T22:51:49.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenu] ON 

INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (1, N'Dashboard', N'Home', N'Index', 0, 0, N'fa fa-dashboard', NULL, NULL, 1, NULL, 1, N'Dashboard')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (2, N'Draw Shape', N'Admin', N'DrawShape', 0, 0, N'fa fa-paint-brush', NULL, NULL, 2, NULL, 1, N'DrawShape')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (3, N'User Management', N'', N'', 1, 0, N'fa fa-user', NULL, NULL, 5, NULL, 1, N'UserManagement')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (4, N'Users', N'User', N'UserList', 0, 3, N'fa fa-cog', NULL, NULL, 6, NULL, 1, N'User')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (5, N'Roles Management
', N'User', N'Roles', 0, 3, N'fa fa-user-circle', NULL, NULL, 7, NULL, 1, N'Roles')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (6, N'Customer
', N'Customer', N'CustomerList', 0, 3, N'fa fa-cc-paypal', NULL, NULL, 8, NULL, 1, N'Customer')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (7, N'Settings', N'', N'', 1, 0, N'fa fa-cog', NULL, NULL, 9, NULL, 1, N'Settings')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (8, N'General Settings', N'Admin', N'Setting', 0, 7, N'fa fa-calendar-o', NULL, NULL, 10, NULL, 1, N'Setting')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (9, N'Profile Settings', N'User', N'Profile', 0, 7, N'fa fa-user-o', NULL, NULL, 11, NULL, 1, N'Profile')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (10, N'Components', N'Component', N'Components', 1, 0, N'fa fa-file', NULL, NULL, 12, NULL, 1, N'Component')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (11, N'Orders', N'Customer', N'Orders', 0, 0, N'fa fa-cog', NULL, NULL, 3, NULL, 1, N'Order')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (12, N'Transactions', N'Customer', N'Transactions', 0, 0, N'fa fa-cc-paypal', NULL, NULL, 4, NULL, 1, N'Transaction')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (14, N'Saved Plans', N'Plans', N'Index', 0, 0, N'fa fa-save', NULL, NULL, 15, NULL, 1, N'Plans')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (15, N'Category', N'Category', N'Index', 0, 10, N'fa fa-cate', NULL, NULL, 13, NULL, 1, N'Category')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (16, N'Sub Category', N'SubCategory', N'Index', 0, 10, N'fa fa-cate', NULL, NULL, 14, NULL, 1, N'SubCategory')
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (37, N'O-001', N'Plan-1', 10, 1, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 8, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (38, N'O-0038', N'Plan-2', 20, NULL, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 8, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (39, N'O-0039', N'Sprinkle', NULL, NULL, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (40, N'O-0040', N'Sprinkle', NULL, NULL, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (41, N'O-0041', N'Sprinkle', NULL, NULL, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (42, N'O-0042', N'test1', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (43, N'O-0043', N'test2', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (44, N'O-0044', N'tttt', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (45, N'O-0045', N'qqq', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (46, N'O-0046', N'eeee', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (47, N'O-0047', N'qqq', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (48, N'O-0048', N'qqqq', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (49, N'O-0049', N'qqq', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (50, N'O-0050', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (51, N'O-0051', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (52, N'O-0052', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (53, N'O-0053', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (54, N'O-0054', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (55, N'O-0055', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (56, N'O-0056', N'aaaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (57, N'O-0057', N'sdsd', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (58, N'O-0058', N'sdf', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (59, N'O-0059', N'dfdsfsf', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (60, N'O-0060', N'rrr', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (61, N'O-0061', N'fff', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (62, N'O-0062', N'yyy', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (63, N'O-0063', N'aaa', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (64, N'O-0064', N'sss', NULL, NULL, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (65, N'O-0065', N'aaaa', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (66, N'O-0066', N'test1', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (67, N'O-0067', N'test2', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (68, N'O-0068', N'test3', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (69, N'O-0069', N'Test4', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (70, N'O-0070', N'test5', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (71, N'O-0071', N'test6', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (72, N'O-0072', N'test8', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (73, N'O-0073', N'ssdfdsf', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (74, N'O-0074', N'sss', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (75, N'O-0075', N'aaaaa', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (76, N'O-0076', N'dddd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (77, N'O-0077', N'aaaa', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (78, N'O-0078', N'dddd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (79, N'O-0079', N'ssss', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (80, N'O-0080', N'dadsas', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (81, N'O-0081', N'dsfdsf', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (82, N'O-0082', N'vvvvv', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (83, N'O-0083', N'fsdfsfsfsd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (84, N'O-0084', N'dfsdfds', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (85, N'O-0085', N'dgdg', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (86, N'O-0086', N'dsfdsf', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (87, N'O-0087', N'fdsfsdf', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (88, N'O-0088', N'fgdfgfd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (89, N'O-0089', N'ssss', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (90, N'O-0090', N'fffff', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (91, N'O-0091', N'cccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (92, N'O-0092', N'aaaa', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (93, N'O-0093', N'ssss', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (94, N'O-0094', N'ddddd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (95, N'O-0095', N'ssss', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (96, N'O-0096', N'eeee', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (97, N'O-0097', N'uuuu', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (98, N'O-0098', N'eeee', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (99, N'O-0099', N'rrrr', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (100, N'O-00100', N'rrr', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (101, N'O-00101', N'ttt', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (102, N'O-00102', N'vvvvv', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (103, N'O-00103', N'aaa', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (104, N'O-00104', N'xxx', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (105, N'O-00105', N'qqq', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (106, N'O-00106', N'ccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (107, N'O-00107', N'rrr', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (108, N'O-00108', N'ccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (109, N'O-00109', N'rrr', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (110, N'O-00110', N'ccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (111, N'O-00111', N'bbb', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (112, N'O-00112', N'uuu', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (113, N'O-00113', N'fff', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (114, N'O-00114', N'ggg', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (115, N'O-00115', N'ccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (116, N'O-00116', N'ccc', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (117, N'O-00117', N'ddd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (118, N'O-00118', N'ddd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (119, N'O-00119', N'ggg', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (120, N'O-00120', N'hh', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (121, N'O-00121', N'dd', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (122, N'O-00122', N'jjj', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (123, N'O-00123', N'kkk', NULL, NULL, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-04T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (124, N'O-00124', N'tttt', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (125, N'O-00125', N'rrr', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (126, N'O-00126', N'ccc', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (127, N'O-00127', N'ddd', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (128, N'O-00128', N'cccc', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (129, N'O-00129', N'qqqq', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (130, N'O-00130', N'aaa', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (131, N'O-00131', N'aaaa', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (132, N'O-00132', N'sss', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (133, N'O-00133', N'qqq', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (134, N'O-00134', N'rrr', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (135, N'O-00135', N'aaaa', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (136, N'O-00136', N'sss', NULL, NULL, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-05T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (137, N'O-00137', N'sss', NULL, NULL, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-20T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (138, N'O-00138', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (139, N'O-00139', N'asad', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (140, N'O-00140', N'aaaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (141, N'O-00141', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (142, N'O-00142', N'aaaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (143, N'O-00143', N'bbb', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (144, N'O-00144', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (145, N'O-00145', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (146, N'O-00146', N'aaaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (147, N'O-00147', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (148, N'O-00148', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (149, N'O-00149', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (150, N'O-00150', N'zzz', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (151, N'O-00151', N'ccc', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (152, N'O-00152', N'ccc', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (153, N'O-00153', N'www', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (154, N'O-00154', N'ccc', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (155, N'O-00155', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (156, N'O-00156', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (157, N'O-00157', N'aaa', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CreatedBy], [EditDate], [EditBy], [isActive]) VALUES (158, N'O-00158', N'www', NULL, NULL, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (1, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (11, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (12, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (13, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (19, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (61, 48, 20, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 4 Stationen', 259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (62, 50, 53, N'Hunter X2-Core 1401E  + WAND Modul', 309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (63, 51, 51, N'Hunter X2-Core 601E  + WAND Modul', 229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (64, 51, 48, N'Hunter Hydrawise HC-601iE', 229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (65, 54, 44, N'Hunter X2-Core 401E', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (66, 56, 44, N'Hunter X2-Core 401E', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (67, 57, 45, N'Hunter X2-Core 601E', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (68, 58, 44, N'Hunter X2-Core 401E', 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (69, 59, 45, N'Hunter X2-Core 601E', 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (70, 59, 71, N'Well Water Source', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (71, 61, 72, N'Rain Water Source', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (72, 62, 33, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 7 Stationen  mit Siebfilter', 419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (73, 63, 16, N'MPSS 530', 24.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (74, 63, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (75, 63, 12, N'MP 3500 90-210', 24.99, 90, 210, 10.699999999999998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (76, 65, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (77, 65, 3, N'MP 1000 90-210', 24.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (78, 66, 2, N'MP 800 360', 24.99, 360, 360, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (79, 67, 6, N'MP 2000 90-210', 24.99, 90, 210, 5.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (91, 88, 41, N'Hunter X-Core 401E', 99, NULL, NULL, NULL, NULL, N'System1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (92, 89, 3, N'MP 1000 90-210', 24.99, 0, 180, 60.2, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (95, 92, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (96, 93, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (97, 94, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (99, 95, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (100, 95, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (101, 97, 14, N'MPLCS 515', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (102, 97, 2, N'MP 800 360', 24.99, 360, 360, 3, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (103, 97, 7, N'MP 2000 210-270', 24.99, 210, 270, 5.8, NULL, N'Sprinkler2', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (106, 99, 6, N'MP 2000 90-210', 24.99, 90, 210, 5.8, NULL, N'Sprinkler2', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (109, 101, 17, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 1 Station', 129, NULL, NULL, NULL, NULL, N'ValveBox1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (110, 102, 18, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 2 Stationen', 159, NULL, NULL, NULL, NULL, N'ValveBox1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (112, 103, 19, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 3 Stationen', 209, NULL, NULL, NULL, NULL, N'ValveBox1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (116, 109, 70, N'Drinking Water Source', NULL, NULL, NULL, NULL, NULL, N'Tap1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (120, 109, 16, N'MPSS 530', 24.99, NULL, NULL, NULL, NULL, N'RectangularSprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (121, 111, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (122, 112, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (123, 113, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (124, 124, 2, N'MP 800 360', 24.99, 0, 183.58, 5.3433333333333337, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (126, 128, 6, N'MP 2000 90-210', 24.99, 90, 210, 5.8, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (128, 129, 55, N'Steuerkabel Irricable Rain-Bird 5-adrig', 2.7, NULL, NULL, NULL, NULL, N'Line1', 56.22, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (136, 131, 57, N'Steuerkabel Irricable Rain-Bird 9-adrig', 5.5, NULL, NULL, NULL, NULL, N'Line1', 60.91, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (137, 132, 56, N'Steuerkabel Irricable Rain-Bird 7-adrig', 3.5, NULL, NULL, NULL, NULL, N'Line1', 21.66, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (138, 133, 57, N'Steuerkabel Irricable Rain-Bird 9-adrig', 5.5, NULL, NULL, NULL, NULL, N'Line1', 38.7, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (156, 138, 73, N'MP 800 90-210', 24.99, 90, 210, 3, NULL, N'Sprinkler9', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (183, 152, 66, N'PE Pipeline Cutter', 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (184, 152, 67, N'PE Pipeline sharpener', 83.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (185, 152, 68, N'Hunter Rain Click Sensor', 245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (186, 152, 69, N'Trinkwasser Trennstation', 5992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (187, 51, 51, N'Hunter X2-Core 601E  + WAND Modul', 229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (188, 157, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (189, 157, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler2', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (190, 157, 45, N'Hunter X2-Core 601E', 119, NULL, NULL, NULL, NULL, N'System1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (191, 157, 56, N'Steuerkabel Irricable Rain-Bird 7-adrig', 251.89499999999998, NULL, NULL, NULL, NULL, N'Line1', 68.97, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (252, 157, 66, N'PE Pipeline Cutter', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (253, 157, 67, N'PE Pipeline sharpener', 55.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (254, 157, 68, N'Hunter Rain Click Sensor', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (255, 157, 69, N'Trinkwasser Trennstation', 2996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (256, 158, 3, N'MP 1000 90-210', 24.99, 90, 210, 4.1, NULL, N'Sprinkler1', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (433, 158, 66, N'PE Pipeline Cutter', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (434, 158, 67, N'PE Pipeline sharpener', 13.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (435, 158, 68, N'Hunter Rain Click Sensor', 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[tblOrderDetail] ([OrderDetailId], [OrderId], [SubCategoryID], [SubcategoryName], [Price], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [UniqueId], [IWLength], [PELength], [PEHPipe], [PEFPipe], [PETPipe], [Qty]) VALUES (436, 158, 69, N'Trinkwasser Trennstation', 749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, N'Customer', 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSetting] ON 

INSERT [dbo].[tblSetting] ([SettingId], [SecretKey], [Email], [Password], [ClientID], [Port], [SMTP], [Mode], [Editby], [EditDate], [isActive], [IsAdminReceived]) VALUES (1, N'AYctY-wZ1hLf2OG33fuEW2CCsPGqa4hcHxK-aI1Gyv4Rcdi0OdGdbJ_5Hmry', N'demo@technosolx.com', N'=^T1-KFmLA4v', N'EFbTStisJ8DmFy5xYrAeEDcCROw8WLOj0LtiSZ5S1NU2-myO4fZrCLC', 587, N'technosolx.com', N'Sandbox', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSubCategory] ON 

INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (2, 1, N'MP 800 360', NULL, N'Piece', 24.99, N'Round', 0, 360, 3, 2.3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0.13, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (3, 1, N'MP 1000 90-210', NULL, N'Piece', 24.99, N'Round', 90, 210, 4.1, 3.1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0.05, NULL, 0.1, 0.11, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (4, 1, N'MP 1000 210-270', NULL, N'Piece', 24.99, N'Round', 210, 270, 4.1, 3.1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.11, 0.14, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (5, 1, N'MP 1000 360', N'', N'Piece', 24.99, N'Round', 0, 360, 4.1, 3.1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0.19, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (6, 1, N'MP 2000 90-210', N'', N'Piece', 24.99, N'Round', 90, 210, 5.8, 4.4, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0.1, NULL, 0.18, 0.2, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (7, 1, N'MP 2000 210-270', N'', N'Piece', 24.99, N'Round', 210, 270, 5.8, 4.4, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.2, 0.25, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (8, 1, N'MP 2000 360', N'', N'Piece', 24.99, N'Round', 0, 360, 5.8, 4.4, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0.34, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (9, 1, N'MP 3000 90-210', N'', N'Piece', 24.99, N'Round', 90, 210, 9.1, 6.8, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0.2, NULL, 0.42, 0.49, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (10, 1, N'MP 3000 210-270', N'', N'Piece', 24.99, N'Round', 210, 270, 9.1, 6.8, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.49, 0.63, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (11, 1, N'MP 3000 360', N'', N'Piece', 24.99, N'Round', 0, 360, 9.1, 6.8, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0.84, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (12, 1, N'MP 3500 90-210', N'', N'Piece', 24.99, N'Round', 90, 210, 10.7, 8, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0.29, NULL, 0.65, 0.75, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (13, 1, N'MP Corner', N'', N'Piece', 24.99, N'Round', 45, 110, 4.1, 3.1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0.04, 0.09, 0.1, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (14, 2, N'MPLCS 515', N'', N'Piece', 24.99, N'Rectangle', 0, 0, 0, 0, 4.6, 1.5, 0.05, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (15, 2, N'MPRCS 515', N'', N'Piece', 24.99, N'Rectangle', 0, 0, 0, 0, 4.6, 1.5, 0.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (16, 2, N'MPSS 530', N'', N'Piece', 24.99, N'Rectangle', 0, 0, 0, 0, 9.1, 1.5, 0.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (17, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 1 Station', N'', N'Piece', 129, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (18, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 2 Stationen', N'', N'Piece', 159, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (19, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 3 Stationen', N'', N'Piece', 209, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (20, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 4 Stationen', N'', N'Piece', 259, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (21, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 5 Stationen', N'', N'Piece', 289, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (22, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 6 Stationen', N'', N'Piece', 319, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (23, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 7 Stationen', N'', N'Piece', 389, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (24, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 8 Stationen', N'', N'Piece', 419, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (25, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 9 Stationen', N'', N'Piece', 459, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (26, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 10 Stationen', N'', N'Piece', 489, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (27, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 1 Station mit Siebfilter', N'', N'Piece', 159, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (28, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 2 Stationen  mit Siebfilter', N'', N'Piece', 189, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (29, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 3 Stationen  mit Siebfilter', N'', N'Piece', 239, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (30, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 4 Stationen  mit Siebfilter', N'', N'Piece', 289, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (31, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 5 Stationen  mit Siebfilter', N'', N'Piece', 339, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (32, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 6 Stationen  mit Siebfilter', N'', N'Piece', 379, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (33, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 7 Stationen  mit Siebfilter', N'', N'Piece', 419, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (34, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 8 Stationen  mit Siebfilter', N'', N'Piece', 449, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (35, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 9 Stationen  mit Siebfilter', N'', N'Piece', 489, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (36, 3, N'Vormontierter Ventilkasten inklusive Hunter Magnetventilen 10 Stationen  mit Siebfilter', N'', N'Piece', 519, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (37, 4, N'Hunter X-Core 201iE', N'', N'Piece', 69, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (38, 4, N'Hunter X-Core 401iE', N'', N'Piece', 72, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (39, 4, N'Hunter X-Core 601iE', N'', N'Piece', 79, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (40, 4, N'Hunter X-Core 801iE', N'', N'Piece', 89, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (41, 4, N'Hunter X-Core 401E', N'', N'Piece', 99, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (42, 4, N'Hunter X-Core 601E', N'', N'Piece', 119, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (43, 4, N'Hunter X-Core 801E', N'', N'Piece', 129, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (44, 4, N'Hunter X2-Core 401E', N'', N'Piece', 99, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (45, 4, N'Hunter X2-Core 601E', N'', N'Piece', 119, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (46, 4, N'Hunter X2-Core 801E', N'', N'Piece', 129, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (47, 4, N'Hunter X2-Core 1401E', N'', N'Piece', 199, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (48, 4, N'Hunter Hydrawise HC-601iE', N'', N'Piece', 229, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (49, 4, N'Hunter Hydrawise HC-1201iE', N'', N'Piece', 249, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (50, 4, N'Hunter X2-Core 401E + WAND Modul', N'', N'Piece', 209, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (51, 4, N'Hunter X2-Core 601E  + WAND Modul', N'', N'Piece', 229, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (52, 4, N'Hunter X2-Core 801E  + WAND Modul', N'', N'Piece', 239, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (53, 4, N'Hunter X2-Core 1401E  + WAND Modul', N'', N'Piece', 309, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (54, 5, N'Steuerkabel Irricable Rain-Bird 3-adrig', N'', N'meter', 2.5, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (55, 5, N'Steuerkabel Irricable Rain-Bird 5-adrig', N'', N'meter', 2.7, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (56, 5, N'Steuerkabel Irricable Rain-Bird 7-adrig', N'', N'meter', 3.5, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (57, 5, N'Steuerkabel Irricable Rain-Bird 9-adrig', N'', N'meter', 5.5, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (58, 5, N'Steuerkabel Irricable Rain-Bird 13-adrig', N'', N'meter', 5.9, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (59, 6, N'PE Rohr 25mm - 25m - in planner with 10 different colours', N'', N'piece', 39, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (60, 6, N'PE Rohr 25mm - 50m - in planner with 10 different colours', N'', N'piece', 59, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (61, 6, N'PE Rohr 25mm - 100m - in planner with 10 different colours', N'', N'piece', 99, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (62, 8, N'PE Verbinder Winkel 25mm', N'', N'piece', 2.7, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (63, 8, N'PE Verbinder T-Stück 25mm x 25mm x 25mm', N'', N'piece', 5.4, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (64, 8, N'PE Verbinder Gerade 25mm x 25mm', N'', N'piece', 2.7, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (65, 9, N'Wasserfester Verbinder ', N'', N'piece', 1.5, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (66, 10, N'PE Pipeline Cutter', N'', N'piece', 19, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (67, 10, N'PE Pipeline sharpener', N'', N'piece', 13.9, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (68, 10, N'Hunter Rain Click Sensor', N'', N'piece', 35, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (69, 10, N'Trinkwasser Trennstation', N'', N'piece', 749, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (70, 7, N'Drinking Water Source', N'', N'', NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (71, 7, N'Well Water Source', N'', N'', NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (72, 7, N'Rain Water Source', N'', N'', NULL, N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tblSubCategory] ([SubcategoryID], [CategoryID], [SubcategoryName], [ComponentPiktogramm], [Unit], [Price], [SprinklerType], [MinAngle], [MaxAngle], [ThrowDistanceMax], [ThrowDistanceMin], [ThrowWidth], [ThrowHeight], [mhgeneral], [PipelineMaxLength], [IrrigationWiringMaxStation], [IrrigationComputermaxstation], [IrrigationComputerindoor], [IrrigationComputeroutdoor], [IrrigationComputersmarphone], [valveboxcircle], [valveboxFilter], [drinkingwatersource], [wellwatersource], [rainwatersource], [mh45], [mh90], [mh105], [mh180], [mh210], [mh270], [mh360], [Plannercomponent], [BOMRelevant]) VALUES (73, 1, N'MP 800 90-210', NULL, N'Piece', 24.99, N'Round', 90, 210, 3, 2.3, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 0.04, NULL, 0.07, 0.08, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[tblSubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTransaction] ON 

INSERT [dbo].[tblTransaction] ([Id], [PaymentDateTime], [PaypalPaymentId], [PayerEmail], [PayerFirstName], [PayerLastName], [PayerId], [State], [Amount], [Currency], [PaymentDescription], [UserId], [OrderId], [Status]) VALUES (1, CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'0PN16161FG871354R', NULL, NULL, NULL, NULL, NULL, N'10', NULL, NULL, 8, 37, N'Successfull')
SET IDENTITY_INSERT [dbo].[tblTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', N'Admin', N'Admin', N'admin@gmail.com', N'YWRtaW4=', N'711 R Block Model town', N'03212121066', N'\Uploading\94222149_2773510956090552_553504860775907328_o.jpg', 1, CAST(N'2023-02-03T22:51:49.710' AS DateTime), 1, NULL, 1, CAST(N'2022-12-27T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (8, N'Customer', N'Company', N'Eazisols', N'eazisols@gmail.com', N'YWRtaW4=', N'711 R Block Model town', N'03234774241', N'\Uploading\user.png', 2, CAST(N'2022-12-29T17:01:02.937' AS DateTime), NULL, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-29T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_AccessManu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[tblMenu] ([MenuId])
GO
ALTER TABLE [dbo].[tblAccessLevel] CHECK CONSTRAINT [FK_AccessManu]
GO
ALTER TABLE [dbo].[tblAccessLevel]  WITH CHECK ADD  CONSTRAINT [FK_AccessRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblAccessLevel] CHECK CONSTRAINT [FK_AccessRole]
GO
ALTER TABLE [dbo].[tblComponent]  WITH CHECK ADD  CONSTRAINT [FK_tblComponent_tblUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblComponent] CHECK CONSTRAINT [FK_tblComponent_tblUser]
GO
ALTER TABLE [dbo].[tblComponent]  WITH CHECK ADD  CONSTRAINT [FK_tblComponent_tblUser1] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblComponent] CHECK CONSTRAINT [FK_tblComponent_tblUser1]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser1] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser1]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblSubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[tblSubCategory] ([SubcategoryID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblSubCategory]
GO
ALTER TABLE [dbo].[tblSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblSetting_tblUser] FOREIGN KEY([Editby])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblSetting] CHECK CONSTRAINT [FK_tblSetting_tblUser]
GO
ALTER TABLE [dbo].[tblSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblSubCategory_tblCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[tblSubCategory] CHECK CONSTRAINT [FK_tblSubCategory_tblCategory]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderId])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblOrder]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [FK_tblTransaction_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [FK_tblTransaction_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAccesoires]    Script Date: 02/03/2023 10:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_GetAccesoires]
@ID int
As
begin


select sc.Price as SCPrice,sc.SubcategoryName as SCName,sc.SubcategoryID as SCId, od.* from tblSubCategory as sc
left join tblOrderDetail as od on sc.SubcategoryID=od.SubCategoryID and (od.OrderId=@ID or od.OrderId is NULL)
where  sc.CategoryID=10

end



GO
/****** Object:  StoredProcedure [dbo].[Sp_GetBOMData]    Script Date: 02/03/2023 10:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_GetBOMData]
@ID int
As
begin


Select SubCategoryID, subCategoryName, sum(Qty) as Qty ,Price,  Price*Count(OrderDetailId) as TotalPrice  from  tblOrderDetail where OrderId=@ID and Qty>0
group by SubCategoryID, subCategoryName,Price


end



GO
/****** Object:  StoredProcedure [dbo].[SpOrderNumber]    Script Date: 02/03/2023 10:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SpOrderNumber]
AS
BEGIN

declare @ID as int
declare @res as nvarchar(12)
set @ID=0
SELECT @ID=OrderId FROM tblOrder where OrderId=(SELECT max(OrderId) FROM tblOrder);
IF  @ID IS NOT NULL
		begin
			set @ID=@ID+1
			set @res=('O-00'+CAST(@ID as nvarchar(12)))
		end
		ELSE
		begin
			set @ID=1
			set @res=('O-00'+CAST(@ID as nvarchar(12)))
		end
	    select @res as Invoicenumber
END;
GO
USE [master]
GO
ALTER DATABASE [Automatische] SET  READ_WRITE 
GO
