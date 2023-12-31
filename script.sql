USE [master]
GO
/****** Object:  Database [AutoCheckPRF]    Script Date: 7/20/2023 12:31:21 PM ******/
CREATE DATABASE [AutoCheckPRF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'programReadFileC', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\programReadFileC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'programReadFileC_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\programReadFileC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AutoCheckPRF] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoCheckPRF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoCheckPRF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoCheckPRF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoCheckPRF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoCheckPRF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoCheckPRF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET RECOVERY FULL 
GO
ALTER DATABASE [AutoCheckPRF] SET  MULTI_USER 
GO
ALTER DATABASE [AutoCheckPRF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoCheckPRF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoCheckPRF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoCheckPRF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AutoCheckPRF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AutoCheckPRF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutoCheckPRF', N'ON'
GO
ALTER DATABASE [AutoCheckPRF] SET QUERY_STORE = OFF
GO
USE [AutoCheckPRF]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 7/20/2023 12:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade] [float] NULL,
	[MSSV] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/20/2023 12:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[MSSV] [varchar](8) NULL,
	[question] [varchar](3) NULL,
	[passCases] [tinyint] NULL,
	[Result_id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/20/2023 12:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/20/2023 12:31:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[MSSV] [varchar](8) NOT NULL,
	[password] [varchar](100) NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (2, 9.5, N'HE176586')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (3, 9.5, N'HE167586')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (4, 3.5, N'new')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (5, 2, N'new')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (6, 3, N'new')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (7, 3.5, N'new')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (8, 3.5, N'new')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (10, 1, N'admin')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (11, 0.5, N'test1')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (12, 2, N'test3')
INSERT [dbo].[Grade] ([grade_id], [grade], [MSSV]) VALUES (13, 0, N'test2')
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q1', 2, 1)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q2', 2, 2)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q3', 2, 3)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q4', 2, 4)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q5', 2, 5)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE176586', N'Q6', 0, 6)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 7)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 0, 8)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 0, 9)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 10)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 11)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 12)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 13)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 14)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 0, 15)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 16)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 17)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 18)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 19)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 20)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 21)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 22)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 23)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 24)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 25)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 26)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 27)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 28)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 29)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 30)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 31)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 32)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 33)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 34)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 2, 35)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 36)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 37)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 38)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 39)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 40)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 2, 41)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 42)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 43)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 0, 44)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 0, 45)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 46)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 47)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 48)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 49)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 50)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 0, 51)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 52)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 53)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 54)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 55)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 56)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 57)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 0, 58)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 59)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 60)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 61)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 62)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 63)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 64)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 0, 65)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 66)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 67)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 68)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 69)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 70)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 2, 71)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 72)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q1', 2, 73)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q2', 2, 74)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q3', 2, 75)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q4', 2, 76)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q5', 2, 77)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE167586', N'Q6', 0, 78)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 86)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 87)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 88)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 89)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 90)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 91)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 92)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 93)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 94)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 95)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 96)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 97)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 98)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 99)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 100)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 101)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 102)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 103)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 104)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 105)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 106)
GO
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 107)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 108)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 109)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 110)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 111)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 112)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 113)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 114)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 115)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 116)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 117)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 118)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 119)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 120)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', NULL, NULL, 121)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q1', 0, 122)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q2', 0, 123)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q3', 0, 124)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q4', 2, 125)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q5', 0, 126)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'admin', N'Q6', 0, 127)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q1', 0, 128)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q2', 2, 129)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q3', 2, 130)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q4', 2, 131)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q5', 2, 132)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'HE155271', N'Q6', 0, 133)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q1', 2, 134)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q2', 2, 135)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q3', 2, 136)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q4', 2, 137)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q5', 2, 138)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test1', N'Q6', 0, 139)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q1', 0, 140)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q2', 0, 141)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q3', 2, 142)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q4', 2, 143)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q5', 2, 144)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test3', N'Q6', 0, 145)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q1', 2, 146)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q2', 2, 147)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q3', 2, 148)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q4', 2, 149)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q5', 2, 150)
INSERT [dbo].[Result] ([MSSV], [question], [passCases], [Result_id]) VALUES (N'test2', N'Q6', 0, 151)
SET IDENTITY_INSERT [dbo].[Result] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'admin', N'123456', 1)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'HE155271', N'123456', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'HE167586', N'123456', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'HE176586', N'123456', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'new', N'123', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'test1', N'123', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'test2', N'123', 2)
INSERT [dbo].[User] ([MSSV], [password], [RoleID]) VALUES (N'test3', N'123', 2)
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD FOREIGN KEY([MSSV])
REFERENCES [dbo].[User] ([MSSV])
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([MSSV])
REFERENCES [dbo].[User] ([MSSV])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [AutoCheckPRF] SET  READ_WRITE 
GO
