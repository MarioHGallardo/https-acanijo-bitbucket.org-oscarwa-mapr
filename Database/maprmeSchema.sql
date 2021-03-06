USE [master]
GO

/****** Object:  Database [maprme]    Script Date: 18/11/2015 01:56:36 a.m. ******/
CREATE DATABASE [maprme]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'maprme', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\maprme.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'maprme_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\maprme_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [maprme] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [maprme].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [maprme] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [maprme] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [maprme] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [maprme] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [maprme] SET ARITHABORT OFF 
GO

ALTER DATABASE [maprme] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [maprme] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [maprme] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [maprme] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [maprme] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [maprme] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [maprme] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [maprme] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [maprme] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [maprme] SET  DISABLE_BROKER 
GO

ALTER DATABASE [maprme] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [maprme] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [maprme] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [maprme] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [maprme] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [maprme] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [maprme] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [maprme] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [maprme] SET  MULTI_USER 
GO

ALTER DATABASE [maprme] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [maprme] SET DB_CHAINING OFF 
GO

ALTER DATABASE [maprme] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [maprme] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [maprme] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [maprme] SET  READ_WRITE 
GO



USE [maprme]
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emotion](
	[EmotionId] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Emotion] PRIMARY KEY CLUSTERED 
(
	[EmotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Episode]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Episode](
	[EpisodeId] [int] NOT NULL,
	[JourneyMapId] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[IlustrationId] [int] NULL,
	[EmotionId] [int] NULL,
 CONSTRAINT [PK_Episode] PRIMARY KEY CLUSTERED 
(
	[EpisodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[ImageId] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Path] [varchar](max) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JourneyMap]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JourneyMap](
	[JourneyMapId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[IsCurrent] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_JourneyMap] PRIMARY KEY CLUSTERED 
(
	[JourneyMapId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JourneyMapPersona]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JourneyMapPersona](
	[JourneyMapId] [int] NOT NULL,
	[PersonaId] [int] NOT NULL,
 CONSTRAINT [PK_JourneyMapPersona] PRIMARY KEY CLUSTERED 
(
	[JourneyMapId] ASC,
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persona]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[PersonaId] [int] NOT NULL,
	[ProfilePictureId] [int] NULL,
	[Name] [varchar](200) NOT NULL,
	[Gender] [char](1) NULL,
	[BirthDate] [date] NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Education] [varchar](50) NULL,
	[JobTitle] [varchar](50) NULL,
	[SmallDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[PersonaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TouchPoint]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouchPoint](
	[TouchPointId] [int] NOT NULL,
	[CustomerSatisfaction] [tinyint] NULL,
	[EpisodeId] [int] NOT NULL,
 CONSTRAINT [PK_TouchPoint] PRIMARY KEY CLUSTERED 
(
	[TouchPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 18/11/2015 01:53:34 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Website] [varchar](200) NULL,
	[LogoId] [int] NULL,
	[ProfilePictureId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Emotion] FOREIGN KEY([EmotionId])
REFERENCES [dbo].[Emotion] ([EmotionId])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Emotion]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_Ilustration] FOREIGN KEY([IlustrationId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_Ilustration]
GO
ALTER TABLE [dbo].[Episode]  WITH CHECK ADD  CONSTRAINT [FK_Episode_JourneyMap] FOREIGN KEY([JourneyMapId])
REFERENCES [dbo].[JourneyMap] ([JourneyMapId])
GO
ALTER TABLE [dbo].[Episode] CHECK CONSTRAINT [FK_Episode_JourneyMap]
GO
ALTER TABLE [dbo].[JourneyMap]  WITH CHECK ADD  CONSTRAINT [FK_JourneyMap_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[JourneyMap] CHECK CONSTRAINT [FK_JourneyMap_User]
GO
ALTER TABLE [dbo].[TouchPoint]  WITH CHECK ADD  CONSTRAINT [FK_TouchPoint_Episode] FOREIGN KEY([EpisodeId])
REFERENCES [dbo].[Episode] ([EpisodeId])
GO
ALTER TABLE [dbo].[TouchPoint] CHECK CONSTRAINT [FK_TouchPoint_Episode]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Logo] FOREIGN KEY([LogoId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Logo]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_ProfilePicture] FOREIGN KEY([ProfilePictureId])
REFERENCES [dbo].[Image] ([ImageId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_ProfilePicture]
GO
