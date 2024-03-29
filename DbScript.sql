USE [master]
GO
/****** Object:  Database [TaskManagmentSystem]    Script Date: 7/25/2019 12:43:13 AM ******/
CREATE DATABASE [TaskManagmentSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskManagmentSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TaskManagmentSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TaskManagmentSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TaskManagmentSystem_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TaskManagmentSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManagmentSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskManagmentSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskManagmentSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskManagmentSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskManagmentSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskManagmentSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TaskManagmentSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TaskManagmentSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskManagmentSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskManagmentSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskManagmentSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TaskManagmentSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaskManagmentSystem', N'ON'
GO
ALTER DATABASE [TaskManagmentSystem] SET QUERY_STORE = OFF
GO
USE [TaskManagmentSystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TaskManagmentSystem]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/25/2019 12:43:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[ParentID] [bigint] NULL,
	[TaskID] [bigint] NOT NULL,
	[UserID] [bigint] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LKP_TaskStatus]    Script Date: 7/25/2019 12:43:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LKP_TaskStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LKP_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LKP_UserType]    Script Date: 7/25/2019 12:43:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LKP_UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_LKP_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 7/25/2019 12:43:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Attachment] [nvarchar](max) NULL,
	[UserID] [bigint] NULL,
	[TaskStatusID] [int] NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/25/2019 12:43:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[UserTypeID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (1, N'commmmment', NULL, 11, 4)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (2, N'gghh', NULL, 11, 4)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (3, N'hiiiiiiiiiiiiiiiiiiii', NULL, 11, 4)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (4, N'sssss', NULL, 11, 4)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (5, N'ddddd', NULL, 11, 4)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (6, N'ok ', NULL, 11, 7)
GO
INSERT [dbo].[Comment] ([ID], [Body], [ParentID], [TaskID], [UserID]) VALUES (9, N'hiiiiii', NULL, 12, 7)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[LKP_TaskStatus] ON 
GO
INSERT [dbo].[LKP_TaskStatus] ([ID], [Name]) VALUES (1, N'Assigned')
GO
INSERT [dbo].[LKP_TaskStatus] ([ID], [Name]) VALUES (2, N'In Progress')
GO
INSERT [dbo].[LKP_TaskStatus] ([ID], [Name]) VALUES (3, N'Pending')
GO
INSERT [dbo].[LKP_TaskStatus] ([ID], [Name]) VALUES (4, N'Completed')
GO
SET IDENTITY_INSERT [dbo].[LKP_TaskStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[LKP_UserType] ON 
GO
INSERT [dbo].[LKP_UserType] ([ID], [Name]) VALUES (1, N'Employee')
GO
INSERT [dbo].[LKP_UserType] ([ID], [Name]) VALUES (2, N'Manager')
GO
SET IDENTITY_INSERT [dbo].[LKP_UserType] OFF
GO
SET IDENTITY_INSERT [dbo].[Task] ON 
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (6, N'rrr', N'rradads', NULL, 5, 2)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (7, N'fgeeqqwe', N'qweqweqweweqwe', NULL, 5, 2)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (11, N'Emp task', N'emp task no 1', N'Bakinam Ahmed Taher CV.docx', 7, 2)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (12, N'task the task', N'ssssdvvvvvvvvvvvvvvvvvvvvvve', N'AngularRefactoring.docx', 7, 2)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (13, N'tessssst', N'dddddddddddddddddddddd', NULL, 7, 1)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (24, N'sssss', N'ss', NULL, 1, 1)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (25, N'tt', N'tt', NULL, 1, 1)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (26, N'ftyyt', N'rtrtrtr', NULL, 1, 1)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (29, N'ssss', N'sasaasasas', NULL, 1, 1)
GO
INSERT [dbo].[Task] ([ID], [Name], [Description], [Attachment], [UserID], [TaskStatusID]) VALUES (30, N'hhhhhhh', N'hgfggfgfg', NULL, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Task] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (1, N'Salah', N'123', N'sa@ssd.co', N'jsjsjs', 2)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (2, N'Mostafa', N'123', N'dd@ss.co', N'dsd', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (4, N'ghamry', N'$2a$08$uOrw3bXO/RTlA7blvJHMLewqiRFFqU9CYuA4dUxcDi3rHuGvCjWSG', N'gh@g.com', N'Alex', 2)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (5, N'test', N'$2a$08$9Gy.erQiVQC6DSEwsxNZKO5BTbuyKC0unI4qk4.Kep.cN90h4sUt.', N'test', N'test', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (6, N'mohamed', N'$2a$08$lxZkG7XIMqiiATvTrKUouuzZicCLxyAS1FAlhTd9zrdyg6WqYORSq', N'ghamry648@gmail.com', N'alexandriaaaaaaaaaaa', 2)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (7, N'emp', N'$2a$08$UIiA9Dd/jYyrkzoqNg22pOrCQ5tDBZ9QbTihkNmRw.VwRAMLU2i6O', N'ghh@kk.m', N'egyyyyysssssss', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (8, N'Ahmed', N'$2a$08$7TVyxi/KvGK8M/zquzpSheu11wQyhKzWF4LAIecFTe8isvatuqUJa', N'www@ee.co', N'22323d', 2)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (9, N'Ali', N'$2a$08$AarS5zqAnVKICnEQRPFDk.bnXu/a0WHADNcMlj8t2PpqjNeZCxiQy', N'ddd@ewe', N'222222', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (12, N'test2', N'$2a$08$V4NOeB.EoIfq39c1TBpLlunUn.FCEzwAlXfzNnFMHJpNmOvp5jk3G', N'', N'', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (13, N'osama', N'$2a$08$uIbABIyj8v1cZLsnRkPPa.3zWZddgHZ0KviJsZLFpr5XLnrr/CHce', N'eeee@tt.com', N'', 1)
GO
INSERT [dbo].[User] ([ID], [Name], [Password], [Email], [Address], [UserTypeID]) VALUES (14, N'sedky', N'$2a$08$o27c3C3C55V1c88KSw3OtekH3.A63WdchJLNTOfs2TPh7/9p/ibdG', N'osamayaser@ymail.com', N'eneaza', 1)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Comment] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Comment] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Comment]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_CommentedUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_CommentedUser]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_LKP_TaskStatus] FOREIGN KEY([TaskStatusID])
REFERENCES [dbo].[LKP_TaskStatus] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_LKP_TaskStatus]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_LKP_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[LKP_UserType] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_LKP_UserType]
GO
/****** Object:  StoredProcedure [dbo].[proc_TaskManagmentReport]    Script Date: 7/25/2019 12:43:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[proc_TaskManagmentReport]
	
AS
BEGIN
	
	SET NOCOUNT ON;

select Task.ID taskID, Task.Name taskName, u.Name userName,ts.Name taskStatus,c.Body commentBody,c.ID commentID, cu.Name CommentUser
from Task 
left join [dbo].[User] u on u.ID=Task.UserID
left join LKP_TaskStatus ts on ts.ID =Task.TaskStatusID
left join Comment c on c.TaskID=Task.ID
left join [dbo].[User] cu on cu.ID=c.UserID


END
GO
USE [master]
GO
ALTER DATABASE [TaskManagmentSystem] SET  READ_WRITE 
GO
