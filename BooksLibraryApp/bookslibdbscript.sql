USE [booksLibrary]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_Books_Authors]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/08/2015 12:04:57 p.m. ******/
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 14/08/2015 12:04:57 p.m. ******/
DROP TABLE [dbo].[Books]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 14/08/2015 12:04:57 p.m. ******/
DROP TABLE [dbo].[Authors]
GO
/****** Object:  User [admin]    Script Date: 14/08/2015 12:04:57 p.m. ******/
DROP USER [admin]
GO
USE [master]
GO
/****** Object:  Database [booksLibrary]    Script Date: 14/08/2015 12:04:57 p.m. ******/
DROP DATABASE [booksLibrary]
GO
/****** Object:  Database [booksLibrary]    Script Date: 14/08/2015 12:04:57 p.m. ******/
CREATE DATABASE [booksLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'booksLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\booksLibrary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'booksLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\booksLibrary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [booksLibrary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [booksLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [booksLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [booksLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [booksLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [booksLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [booksLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [booksLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [booksLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [booksLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [booksLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [booksLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [booksLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [booksLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [booksLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [booksLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [booksLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [booksLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [booksLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [booksLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [booksLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [booksLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [booksLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [booksLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [booksLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [booksLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [booksLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [booksLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [booksLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [booksLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [booksLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'booksLibrary', N'ON'
GO
USE [booksLibrary]
GO
/****** Object:  User [admin]    Script Date: 14/08/2015 12:04:57 p.m. ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 14/08/2015 12:04:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[authorID] [int] IDENTITY(1,1) NOT NULL,
	[authorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books]    Script Date: 14/08/2015 12:04:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[categoryID] [int] NULL,
	[authorID] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/08/2015 12:04:57 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([authorID], [authorName]) VALUES (1, N'JK Rowling')
INSERT [dbo].[Authors] ([authorID], [authorName]) VALUES (2, N'George R. R.')
INSERT [dbo].[Authors] ([authorID], [authorName]) VALUES (2003, N'Francisco Juarez')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (1, N'Book 1', 1, 2)
INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (2, N'Book 2: Business', 2, 2)
INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (1002, N'Book Exampleo 3', 3, 2003)
INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (1003, N'Book 4', 4, 1)
INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (1004, N'Book 5', 3, 2003)
INSERT [dbo].[Books] ([bookID], [name], [categoryID], [authorID]) VALUES (1005, N'Book 6', 1, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (1, N'Bussiness ')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (2, N'Science fiction')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (3, N'Technology')
INSERT [dbo].[Categories] ([categoryID], [categoryName]) VALUES (4, N'Engineering')
SET IDENTITY_INSERT [dbo].[Categories] OFF
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([authorID])
REFERENCES [dbo].[Authors] ([authorID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Categories] ([categoryID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
USE [master]
GO
ALTER DATABASE [booksLibrary] SET  READ_WRITE 
GO
