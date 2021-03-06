USE [master]
GO
/****** Object:  Database [WebUsers]    Script Date: 15/11/2018 11:42:18 p. m. ******/
CREATE DATABASE [WebUsers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebUsers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebUsers.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebUsers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WebUsers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebUsers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebUsers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebUsers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebUsers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebUsers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebUsers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebUsers] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebUsers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebUsers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebUsers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebUsers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebUsers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebUsers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebUsers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebUsers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebUsers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebUsers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebUsers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebUsers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebUsers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebUsers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebUsers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebUsers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebUsers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebUsers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebUsers] SET  MULTI_USER 
GO
ALTER DATABASE [WebUsers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebUsers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebUsers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebUsers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WebUsers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WebUsers]
GO
/****** Object:  User [admin]    Script Date: 15/11/2018 11:42:18 p. m. ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/11/2018 11:42:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Username] [nvarchar](50) NULL,
	[CreatedAt] [datetime] NULL CONSTRAINT [DF_Users_CreatedAt]  DEFAULT (getdate()),
	[Enabled] [bit] NULL CONSTRAINT [DF_Users_Enabled]  DEFAULT ((1)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [CreatedAt], [Enabled]) VALUES (1, N'Luis Pérez', N'luis.perez@gmail.com', N'luis.perez', CAST(N'2018-11-15 22:37:14.547' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [CreatedAt], [Enabled]) VALUES (3, N'Juan Rodríguez', N'juan@gmail.abc', N'juan.rod', CAST(N'2018-11-16 05:35:27.077' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [CreatedAt], [Enabled]) VALUES (4, N'María Martínez', N'maria123@outlook.com', N'maria.martinez', CAST(N'2018-11-16 05:37:17.447' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Username], [CreatedAt], [Enabled]) VALUES (5, N'Sergio Ochoa', N'sezri_56@itunes.com', N'sergio.ochoa', CAST(N'2018-11-16 05:37:48.273' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [WebUsers] SET  READ_WRITE 
GO
