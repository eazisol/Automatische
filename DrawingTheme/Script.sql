USE [master]
GO
/****** Object:  Database [Automatische]    Script Date: 12/24/2022 7:39:59 PM ******/
CREATE DATABASE [Automatische]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Automatische', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Automatische_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Automatische_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[tblAccessLevel]    Script Date: 12/24/2022 7:40:00 PM ******/
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
/****** Object:  Table [dbo].[tblComponent]    Script Date: 12/24/2022 7:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComponent](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
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
/****** Object:  Table [dbo].[tblLog]    Script Date: 12/24/2022 7:40:00 PM ******/
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
/****** Object:  Table [dbo].[tblMenu]    Script Date: 12/24/2022 7:40:00 PM ******/
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
/****** Object:  Table [dbo].[tblOrder]    Script Date: 12/24/2022 7:40:00 PM ******/
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
	[CratedBy] [int] NULL,
	[EditDate] [datetime] NULL,
	[EditBy] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 12/24/2022 7:40:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[CompumentId] [int] NULL,
	[CompumentName] [nvarchar](max) NULL,
	[CompumentCode] [nvarchar](max) NULL,
	[CompumentPrice] [float] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 12/24/2022 7:40:00 PM ******/
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
/****** Object:  Table [dbo].[tblSetting]    Script Date: 12/24/2022 7:40:00 PM ******/
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
 CONSTRAINT [PK_tblSetting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/24/2022 7:40:00 PM ******/
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

INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (28, NULL, NULL, NULL, 1, 2, 1, CAST(N'2022-12-23T21:06:08.657' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.657' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (29, NULL, NULL, NULL, 2, 2, 1, CAST(N'2022-12-23T21:06:08.663' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.663' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (30, NULL, NULL, NULL, 3, 2, 1, CAST(N'2022-12-23T21:06:08.667' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.667' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (31, NULL, NULL, NULL, 4, 2, 1, CAST(N'2022-12-23T21:06:08.667' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.667' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (32, NULL, NULL, NULL, 5, 2, 1, CAST(N'2022-12-23T21:06:08.670' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.670' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (33, NULL, NULL, NULL, 6, 2, 1, CAST(N'2022-12-23T21:06:08.670' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.670' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (34, NULL, NULL, NULL, 7, 2, 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (35, NULL, NULL, NULL, 8, 2, 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 0)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (36, NULL, NULL, NULL, 9, 2, 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 1, CAST(N'2022-12-23T21:06:08.673' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (47, NULL, NULL, NULL, 1, 1, 1, CAST(N'2022-12-24T18:51:46.337' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.337' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (48, NULL, NULL, NULL, 2, 1, 1, CAST(N'2022-12-24T18:51:46.343' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.343' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (49, NULL, NULL, NULL, 3, 1, 1, CAST(N'2022-12-24T18:51:46.347' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.347' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (50, NULL, NULL, NULL, 4, 1, 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (51, NULL, NULL, NULL, 5, 1, 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (52, NULL, NULL, NULL, 6, 1, 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.350' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (53, NULL, NULL, NULL, 7, 1, 1, CAST(N'2022-12-24T18:51:46.353' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.353' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (54, NULL, NULL, NULL, 8, 1, 1, CAST(N'2022-12-24T18:51:46.353' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.353' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (55, NULL, NULL, NULL, 9, 1, 1, CAST(N'2022-12-24T18:51:46.357' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.357' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (56, NULL, NULL, NULL, 10, 1, 1, CAST(N'2022-12-24T18:51:46.360' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.360' AS DateTime), 1)
INSERT [dbo].[tblAccessLevel] ([AccessId], [EditAccess], [DeleteAccess], [CreateAccess], [MenuId], [RoleId], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (57, NULL, NULL, NULL, 11, 1, 1, CAST(N'2022-12-24T18:51:46.360' AS DateTime), 1, CAST(N'2022-12-24T18:51:46.360' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblAccessLevel] OFF
GO
SET IDENTITY_INSERT [dbo].[tblComponent] ON 

INSERT [dbo].[tblComponent] ([ComponentId], [Name], [Code], [Price], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Test', N'00001', N'500', 1, NULL, 1, NULL, 1)
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
SET IDENTITY_INSERT [dbo].[tblLog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMenu] ON 

INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (1, N'Dashboard', N'Home', N'Index', 0, 0, N'fa fa-dashboard', NULL, NULL, NULL, NULL, 1, N'Dashboard')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (2, N'Draw Shape', N'Admin', N'DrawShape', 0, 0, N'fa fa-paint-brush', NULL, NULL, NULL, NULL, 1, N'DrawShape')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (3, N'User Management', N'User', N'UserList', 0, 0, N'fa fa-user', NULL, NULL, NULL, NULL, 1, N'User')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (4, N'Roles Management', N'User', N'Roles', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Roles')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (5, N'Customer', N'Customer', N'CustomerList', 0, 0, N'fa fa-user-circle', NULL, NULL, NULL, NULL, 1, N'customer')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (6, N'Transactions', N'Admin', N'Transaction', 0, 0, N'fa fa-cc-paypal', NULL, NULL, NULL, NULL, 1, N'Transaction')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (7, N'Settings', N'Admin', N'Setting', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Setting')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (8, N'Packages', N'Admin', N'Packages', 0, 0, N'fa fa-calendar-o', NULL, NULL, NULL, NULL, 1, N'Packages')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (9, N'Profile Settings', N'User', N'Profile', 0, 0, N'fa fa-user-o', NULL, NULL, NULL, NULL, 1, N'Profile')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (10, N'Components', N'Component', N'Components', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Component')
INSERT [dbo].[tblMenu] ([MenuId], [Name], [ControllerName], [ActionName], [isParent], [ParentId], [FontAwesome], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive], [ElementId]) VALUES (11, N'Orders', N'Customer', N'Orders', 0, 0, N'fa fa-cog', NULL, NULL, NULL, NULL, 1, N'Order')
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([OrderId], [OrderNumber], [Name], [TotalPrice], [Status], [CreatedDate], [CratedBy], [EditDate], [EditBy], [isActive]) VALUES (1, N'123', N'Area', 200, 1, NULL, 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblRole] ([RoleId], [Role], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, N'Customer', 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSetting] ON 

INSERT [dbo].[tblSetting] ([SettingId], [SecretKey], [Email], [Password], [ClientID], [Port], [SMTP], [Mode], [Editby], [EditDate], [isActive]) VALUES (1, N'AYctY-wZ1hLf2OG33fuEW2CCsPGqa4hcHxK-aI1Gyv4Rcdi0OdGdbJ_5Hmry', N'demo@technosolx.com', N'=^T1-KFmLA4v', N'EFbTStisJ8DmFy5xYrAeEDcCROw8WLOj0LtiSZ5S1NU2-myO4fZrCLC', 587, N'technosolx.com', N'Sandbox', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (1, N'Admin', N'Admin', N'Admin', N'admin@gmail.com', N'YWRtaW4=', N'321', N'321', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', 1, CAST(N'2022-12-24T19:05:06.717' AS DateTime), 1, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (2, NULL, N'test3', N'test34', N'test@gmail.com', N'YmlsYWw=', N'3213', N'03003', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (3, NULL, N'test', N'test', N'add@lender.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (4, NULL, N'test', N'test', N'test1@gmail.com', N'MTIz', N'321', N'0300000000', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', NULL, NULL, 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (7, NULL, N'Asad', N'Asad', N'bilal@gmail.com', N'YWRtaW4=', N'aaaa', N'03003', N'\Uploading\WhatsApp Image 2022-12-07 at 7.33.43 PM.jpeg', 1, CAST(N'2022-12-24T17:12:54.840' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (8, N'Customer', N'Customer', N'Customer', N'olaptop05@gmail.com', N'Y3VzdG9tZXI=', N'Model', N'03003', N'\Uploading\user.png', 2, CAST(N'2022-12-24T17:19:25.607' AS DateTime), NULL, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 8, CAST(N'2022-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (10, N'Customer1', NULL, N'Customer1', N'customer1@gmail.com', N'Y3VzMQ==', NULL, NULL, N'\Uploading\user.png', 2, CAST(N'2022-12-23T21:06:19.110' AS DateTime), NULL, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 10, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (11, NULL, N'a', N'a', N'a@gmail.com', N'YQ==', N'a', N'a', N'\Uploading\user.png', 2, NULL, 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblUser] ([UserId], [username], [LastName], [FirstName], [Email], [Password], [Address], [Phone], [ImagePath], [RoleId], [LastLogin], [CreatedBy], [CreatedDate], [EditBy], [EditDate], [isActive]) VALUES (12, NULL, N'a', N'a', N'b@gmail.com', N'Yg==', N'b', N'a', N'\Uploading\user.png', 1, NULL, 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1, CAST(N'2022-12-23T00:00:00.000' AS DateTime), 1)
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
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([CratedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser1] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser1]
GO
ALTER TABLE [dbo].[tblSetting]  WITH CHECK ADD  CONSTRAINT [FK_tblSetting_tblUser] FOREIGN KEY([Editby])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblSetting] CHECK CONSTRAINT [FK_tblSetting_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_CreatedByUserUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_CreatedByUserUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_EditByUserUser] FOREIGN KEY([EditBy])
REFERENCES [dbo].[tblUser] ([UserId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_EditByUserUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRole] ([RoleId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [Automatische] SET  READ_WRITE 
GO
