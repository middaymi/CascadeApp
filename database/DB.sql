USE [master]
GO
/****** Object:  Database [DB]    Script Date: 29.05.2017 12:25:38 ******/
CREATE DATABASE [DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB.mdf' , SIZE = 8384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB] SET  MULTI_USER 
GO
ALTER DATABASE [DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB]
GO
/****** Object:  Table [dbo].[ALL_RESULTS]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_RESULTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDtestsElementsLilk] [int] NOT NULL,
	[IDathlete] [int] NOT NULL,
	[ResultValue] [float] NOT NULL,
	[IDjudge] [int] NULL,
	[Mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ALL_RESULTS_COMPONENTS]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALL_RESULTS_COMPONENTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetitionPerformanceAthleteLink] [int] NOT NULL,
	[IDcomponent] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[IDjudge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ALL_RESULTS_ELEMENTS]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALL_RESULTS_ELEMENTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetitionPerformanceAthleteLink] [int] NOT NULL,
	[Base] [float] NOT NULL,
	[Info] [varchar](500) NULL,
	[Mark] [int] NOT NULL,
	[IDelement] [int] NOT NULL,
	[IDjudge] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ATHLETE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ATHLETE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Middlename] [varchar](255) NOT NULL,
	[Birthday] [date] NOT NULL,
	[IDrank] [int] NULL,
	[AssigneeFullName] [varchar](255) NULL,
	[PhoneNumber] [varchar](255) NOT NULL,
	[ActualAddress] [varchar](255) NULL,
	[MainDocumentCopy] [varchar](500) NULL,
	[MedicalCertificate] [varchar](500) NULL,
	[Insurance] [varchar](500) NULL,
	[Sex] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPETITION]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPETITION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetitionKind] [int] NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[InternalExternal] [bit] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
	[IDrank] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPETITION_ATHLETE_LINK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPETITION_ATHLETE_LINK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDathlete] [int] NOT NULL,
	[IDcompetition] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPETITION_JUDGE_LINK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPETITION_JUDGE_LINK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetition] [int] NOT NULL,
	[IDjudge] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPETITION_KIND]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPETITION_KIND](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[TableName] [varchar](100) NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetition] [int] NOT NULL,
	[IDathlete] [int] NOT NULL,
	[IDperformance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMPONENT]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMPONENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullNameENG] [varchar](255) NOT NULL,
	[FullNameRUS] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMPONENT_RANK_LINK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPONENT_RANK_LINK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcomponent] [int] NOT NULL,
	[IDrank] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Middlename] [varchar](255) NOT NULL,
	[Birthday] [date] NOT NULL CONSTRAINT [defval]  DEFAULT ('0000-00-00'),
	[Experience] [int] NOT NULL,
	[Education] [varchar](255) NOT NULL,
	[Post] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GLASIAL_ELEMENT]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GLASIAL_ELEMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ISU_ELEMENT]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ISU_ELEMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Abbreviation] [varchar](20) NULL,
	[FullNameENG] [varchar](255) NULL,
	[FullNameRUS] [varchar](255) NULL,
	[Level] [int] NULL,
	[IDelementType] [int] NULL,
	[Value_Plus_3] [float] NULL,
	[Value_Plus_2] [float] NULL,
	[Value_Plus_1] [float] NULL,
	[Value_Base] [float] NULL,
	[Value_Base_V] [float] NULL,
	[Value_Base_V1] [float] NULL,
	[Value_Base_V2] [int] NULL,
	[Value_Minus_1] [float] NULL,
	[Value_Minus_2] [float] NULL,
	[Value_Minus_3] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ISU_ELEMENT_TYPE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ISU_ELEMENT_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JUDGE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JUDGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Surname] [varchar](250) NOT NULL,
	[Middlename] [varchar](250) NOT NULL,
	[IDjudgetype] [int] NOT NULL,
	[Category] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JUDGE_TYPE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JUDGE_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OFP_SPECIFICATION]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OFP_SPECIFICATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Units] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[FullName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OFP_STANDARTS]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OFP_STANDARTS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDstandart] [int] NOT NULL,
	[Sex] [bit] NOT NULL,
	[Age] [int] NOT NULL,
	[MinValue] [float] NOT NULL,
	[MaxValue] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORGANIZATION]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORGANIZATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[OGRN] [varchar](13) NULL,
	[KPP] [varchar](9) NULL,
	[INN] [varchar](12) NOT NULL,
	[Account] [varchar](50) NULL,
	[PhoneNumber] [varchar](35) NOT NULL,
	[EMail] [varchar](255) NULL,
	[Site] [varchar](255) NULL,
	[LegalAddress] [varchar](255) NOT NULL,
	[ActualAddress] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERFORMANCE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PERFORMANCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Phonogram] [varchar](500) NOT NULL,
	[CostumeDesign] [varchar](500) NOT NULL,
	[CostumePhoto] [varchar](500) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RANK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RANK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Requirements] [varchar](500) NULL,
	[ProgramStructure] [varchar](500) NULL,
	[ProgramsCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REQUEST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetition] [int] NOT NULL,
	[IDperformance] [int] NOT NULL,
	[IDorganization] [int] NOT NULL,
	[NumberOfMembers] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RESULT]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESULT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetition] [int] NOT NULL,
	[IDathlete] [int] NOT NULL,
	[Place] [int] NULL,
	[SumResult] [float] NOT NULL,
	[isDone] [bit] NOT NULL,
	[StartNumber] [int] NULL,
	[SumOfAllElements] [float] NULL,
	[SumOfAllComponents] [float] NULL,
	[Deductions] [float] NULL,
	[SumPlaces] [int] NULL,
	[AverageMark] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SEASON]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SEASON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Period] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SEASON_PERFORMANCE]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEASON_PERFORMANCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDseason] [int] NOT NULL,
	[IDathlete] [int] NULL,
	[IDperformance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SFP_ELEMENT]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SFP_ELEMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TESTS_ELEMENTS_LINK]    Script Date: 29.05.2017 12:25:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TESTS_ELEMENTS_LINK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDcompetition] [int] NOT NULL,
	[IDelement] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ALL_RESULTS] ON 

INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (697, 195, 112, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (698, 195, 112, 8, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (699, 195, 112, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (700, 195, 112, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (701, 195, 112, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (702, 196, 112, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (703, 196, 112, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (704, 196, 112, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (705, 196, 112, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (706, 196, 112, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (707, 197, 112, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (708, 197, 112, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (709, 197, 112, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (710, 197, 112, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (711, 197, 112, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (712, 198, 112, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (713, 198, 112, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (714, 198, 112, 4, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (715, 198, 112, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (716, 198, 112, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (717, 195, 151, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (718, 195, 151, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (719, 195, 151, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (720, 195, 151, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (721, 195, 151, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (722, 196, 151, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (723, 196, 151, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (724, 196, 151, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (725, 196, 151, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (726, 196, 151, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (727, 197, 151, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (728, 197, 151, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (729, 197, 151, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (730, 197, 151, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (731, 197, 151, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (732, 198, 151, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (733, 198, 151, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (734, 198, 151, 3, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (735, 198, 151, 3, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (736, 198, 151, 2, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (737, 205, 127, 8, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (738, 205, 127, 8, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (739, 205, 127, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (740, 205, 127, 8, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (741, 205, 127, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (742, 206, 127, 8, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (743, 206, 127, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (744, 206, 127, 8, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (745, 206, 127, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (746, 206, 127, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (747, 204, 127, 9, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (748, 204, 127, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (749, 204, 127, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (750, 204, 127, 9, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (751, 204, 127, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (752, 207, 127, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (753, 207, 127, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (754, 207, 127, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (755, 207, 127, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (756, 207, 127, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (757, 203, 127, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (758, 203, 127, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (759, 203, 127, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (760, 203, 127, 8, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (761, 203, 127, 10, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (762, 199, 149, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (763, 199, 149, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (764, 199, 149, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (765, 199, 149, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (766, 199, 149, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (767, 200, 149, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (768, 200, 149, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (769, 200, 149, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (770, 200, 149, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (771, 200, 149, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (772, 201, 149, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (773, 201, 149, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (774, 201, 149, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (775, 201, 149, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (776, 201, 149, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (777, 202, 149, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (778, 202, 149, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (779, 202, 149, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (780, 202, 149, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (781, 202, 149, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (782, 199, 119, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (783, 199, 119, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (784, 199, 119, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (785, 199, 119, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (786, 199, 119, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (787, 200, 119, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (788, 200, 119, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (789, 200, 119, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (790, 200, 119, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (791, 200, 119, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (792, 201, 119, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (793, 201, 119, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (794, 201, 119, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (795, 201, 119, 6, 1007, NULL)
GO
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (796, 201, 119, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (797, 202, 119, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (798, 202, 119, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (799, 202, 119, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (800, 202, 119, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (801, 202, 119, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (802, 199, 142, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (803, 199, 142, 8, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (804, 199, 142, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (805, 199, 142, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (806, 199, 142, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (807, 200, 142, 10, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (808, 200, 142, 9, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (809, 200, 142, 8, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (810, 200, 142, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (811, 200, 142, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (812, 201, 142, 9, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (813, 201, 142, 10, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (814, 201, 142, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (815, 201, 142, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (816, 201, 142, 8, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (817, 202, 142, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (818, 202, 142, 0, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (819, 202, 142, 0, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (820, 202, 142, 0, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (821, 202, 142, 0, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (822, 199, 144, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (823, 199, 144, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (824, 199, 144, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (825, 199, 144, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (826, 199, 144, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (827, 200, 144, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (828, 200, 144, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (829, 200, 144, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (830, 200, 144, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (831, 200, 144, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (832, 201, 144, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (833, 201, 144, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (834, 201, 144, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (835, 201, 144, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (836, 201, 144, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (837, 202, 144, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (838, 202, 144, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (839, 202, 144, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (840, 202, 144, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (841, 202, 144, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (842, 199, 147, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (843, 199, 147, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (844, 199, 147, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (845, 199, 147, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (846, 199, 147, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (847, 200, 147, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (848, 200, 147, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (849, 200, 147, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (850, 200, 147, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (851, 200, 147, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (852, 201, 147, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (853, 201, 147, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (854, 201, 147, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (855, 201, 147, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (856, 201, 147, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (857, 202, 147, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (858, 202, 147, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (859, 202, 147, 4, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (860, 202, 147, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (861, 202, 147, 3, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (862, 199, 148, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (863, 199, 148, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (864, 199, 148, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (865, 199, 148, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (866, 199, 148, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (867, 200, 148, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (868, 200, 148, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (869, 200, 148, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (870, 200, 148, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (871, 200, 148, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (872, 201, 148, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (873, 201, 148, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (874, 201, 148, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (875, 201, 148, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (876, 201, 148, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (877, 202, 148, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (878, 202, 148, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (879, 202, 148, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (880, 202, 148, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (881, 202, 148, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (882, 199, 120, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (883, 199, 120, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (884, 199, 120, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (885, 199, 120, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (886, 199, 120, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (887, 200, 120, 9, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (888, 200, 120, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (889, 200, 120, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (890, 200, 120, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (891, 200, 120, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (892, 201, 120, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (893, 201, 120, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (894, 201, 120, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (895, 201, 120, 7, 1007, NULL)
GO
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (896, 201, 120, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (897, 202, 120, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (898, 202, 120, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (899, 202, 120, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (900, 202, 120, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (901, 202, 120, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (902, 199, 126, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (903, 199, 126, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (904, 199, 126, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (905, 199, 126, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (906, 199, 126, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (907, 200, 126, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (908, 200, 126, 8, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (909, 200, 126, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (910, 200, 126, 6, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (911, 200, 126, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (912, 201, 126, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (913, 201, 126, 8, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (914, 201, 126, 8, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (915, 201, 126, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (916, 201, 126, 7, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (917, 202, 126, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (918, 202, 126, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (919, 202, 126, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (920, 202, 126, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (921, 202, 126, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (922, 199, 115, 4, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (923, 199, 115, 4, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (924, 199, 115, 4, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (925, 199, 115, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (926, 200, 115, 7, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (927, 200, 115, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (928, 200, 115, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (929, 200, 115, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (930, 200, 115, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (931, 201, 115, 8, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (932, 201, 115, 7, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (933, 201, 115, 7, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (934, 201, 115, 7, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (935, 201, 115, 6, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (936, 202, 115, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (937, 202, 115, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (938, 202, 115, 4, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (939, 202, 115, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (940, 202, 115, 4, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (941, 199, 130, 4, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (942, 199, 130, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (943, 199, 130, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (944, 199, 130, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (945, 199, 130, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (946, 200, 130, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (947, 200, 130, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (948, 200, 130, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (949, 200, 130, 4, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (950, 200, 130, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (951, 201, 130, 5, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (952, 201, 130, 5, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (953, 201, 130, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (954, 201, 130, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (955, 201, 130, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (956, 202, 130, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (957, 202, 130, 6, 10, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (958, 202, 130, 5, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (959, 202, 130, 5, 1007, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (960, 202, 130, 5, 11, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (961, 224, 142, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (962, 224, 112, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (963, 224, 119, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (964, 224, 151, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (965, 223, 130, 5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (966, 223, 142, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (967, 223, 112, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (968, 223, 119, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (969, 223, 151, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (970, 224, 130, 5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (971, 225, 130, 5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (972, 225, 142, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (973, 225, 112, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (974, 225, 119, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (975, 225, 151, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (976, 226, 130, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (977, 226, 142, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (978, 226, 112, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (979, 226, 119, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (980, 226, 151, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (981, 227, 130, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (982, 227, 142, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (983, 227, 112, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (984, 227, 119, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (985, 227, 151, 4, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (986, 233, 113, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (987, 234, 113, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (988, 235, 113, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (989, 236, 113, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (990, 237, 113, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (991, 233, 131, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (992, 234, 131, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (993, 235, 131, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (994, 236, 131, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (995, 237, 131, 10, NULL, NULL)
GO
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (996, 233, 132, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (997, 234, 132, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (998, 235, 132, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (999, 236, 132, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1000, 237, 132, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1001, 233, 118, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1002, 234, 118, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1003, 235, 118, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1004, 236, 118, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1005, 237, 118, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1006, 233, 141, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1007, 234, 141, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1008, 235, 141, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1009, 236, 141, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1010, 237, 141, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1011, 233, 127, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1012, 234, 127, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1013, 235, 127, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1014, 236, 127, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1015, 237, 127, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1016, 228, 129, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1017, 229, 129, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1018, 230, 129, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1019, 231, 129, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1020, 232, 129, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1021, 228, 139, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1022, 229, 139, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1023, 230, 139, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1024, 231, 139, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1025, 232, 139, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1026, 228, 140, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1027, 229, 140, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1028, 230, 140, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1029, 231, 140, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1030, 232, 140, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1031, 228, 143, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1032, 229, 143, 98, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1033, 230, 143, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1034, 231, 143, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1035, 232, 143, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1036, 228, 144, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1037, 229, 144, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1038, 230, 144, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1039, 231, 144, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1040, 232, 144, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1041, 228, 114, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1042, 229, 114, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1043, 230, 114, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1044, 231, 114, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1045, 232, 114, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1046, 228, 115, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1047, 229, 115, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1048, 230, 115, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1049, 231, 115, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1050, 232, 115, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1051, 228, 147, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1052, 229, 147, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1053, 230, 147, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1054, 231, 147, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1055, 232, 147, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1056, 229, 148, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1057, 230, 148, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1058, 231, 148, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1059, 232, 148, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1060, 228, 149, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1061, 229, 149, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1062, 230, 149, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1063, 231, 149, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1064, 232, 149, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1065, 228, 120, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1066, 229, 120, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1067, 230, 120, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1068, 231, 120, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1069, 232, 120, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1070, 228, 123, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1071, 229, 123, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1072, 230, 123, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1073, 231, 123, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1074, 232, 123, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1075, 228, 124, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1076, 229, 124, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1077, 230, 124, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1078, 232, 124, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1079, 228, 125, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1080, 229, 125, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1081, 230, 125, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1082, 231, 125, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1083, 232, 125, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1084, 228, 126, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1085, 229, 126, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1086, 230, 126, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1087, 231, 126, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1088, 231, 124, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1089, 229, 143, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1090, 228, 148, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1091, 232, 126, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1092, 210, 130, 2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1093, 210, 142, 2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1094, 210, 112, 29, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1095, 210, 119, 73, NULL, NULL)
GO
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1096, 210, 151, 20, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1097, 208, 130, 95, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1098, 208, 142, 84, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1099, 208, 112, 108, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1100, 208, 119, 132, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1101, 208, 151, 86, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1102, 209, 130, 24, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1103, 209, 142, 22.8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1104, 209, 112, 31, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1105, 209, 119, 22.3, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1106, 209, 151, 24.5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1107, 212, 130, 15, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1108, 212, 142, 13, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1109, 212, 112, 11, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1110, 212, 119, 18, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1111, 212, 151, 2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1112, 211, 130, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1113, 211, 142, 15, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1114, 211, 112, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1115, 211, 119, 12, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1116, 211, 151, 4, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1117, 222, 131, 27, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1118, 222, 132, 23, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1119, 222, 141, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1120, 222, 113, 20, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1121, 222, 118, 21, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1122, 222, 127, 25, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1123, 221, 131, 22, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1124, 221, 132, 23, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1125, 221, 141, 22, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1126, 221, 113, 24, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1127, 221, 118, 16, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1128, 221, 127, 18, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1129, 220, 131, 9, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1130, 220, 132, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1131, 220, 141, 11, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1132, 220, 113, 21, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1133, 220, 118, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1134, 220, 127, 15, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1135, 218, 131, 206, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1136, 218, 132, 181, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1137, 218, 141, 166, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1138, 218, 113, 204, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1139, 218, 118, 162, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1140, 218, 127, 208, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1141, 219, 131, 16.8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1142, 219, 132, 18, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1143, 219, 141, 16.6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1144, 219, 113, 16.8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1145, 219, 118, 19, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1146, 219, 127, 18.5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1147, 213, 129, 119, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1148, 213, 139, 150, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1149, 213, 140, 134, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1150, 213, 143, 116, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1151, 213, 144, 117, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1152, 213, 114, 174, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1153, 213, 115, 145, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1154, 213, 147, 127, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1155, 213, 148, 102, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1156, 213, 149, 108, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1157, 213, 120, 98, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1158, 213, 123, 145, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1159, 213, 124, 144, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1160, 213, 125, 124, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1161, 213, 126, 141, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1162, 214, 129, 21.8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1163, 214, 139, 18.2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1164, 214, 140, 21.6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1165, 214, 143, 24.1, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1166, 214, 114, 19.6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1167, 214, 115, 21.5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1168, 214, 147, 21.2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1169, 214, 149, 22.3, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1170, 214, 120, 24, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1171, 214, 123, 21.8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1172, 214, 124, 19.2, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1173, 214, 125, 19.6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1174, 214, 126, 22, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1175, 215, 129, 1.5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1176, 215, 139, 11, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1177, 215, 140, 1.5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1178, 215, 143, 0, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1179, 215, 144, 5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1180, 215, 114, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1181, 215, 115, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1182, 215, 147, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1183, 215, 148, 3, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1184, 215, 149, 4, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1185, 215, 120, 0, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1186, 215, 123, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1187, 215, 124, 6, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1188, 215, 125, 11, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1189, 215, 126, 1, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1190, 216, 129, 14, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1191, 216, 139, 16, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1192, 216, 140, 16, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1193, 216, 143, 12, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1194, 216, 144, 14, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1195, 216, 114, 21, NULL, NULL)
GO
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1196, 216, 115, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1197, 216, 147, 17, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1198, 216, 148, 12, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1199, 216, 149, 15, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1200, 216, 120, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1201, 216, 123, 17, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1202, 216, 124, 17, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1203, 216, 125, 19, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1204, 216, 126, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1205, 217, 129, 8, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1206, 217, 139, 13, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1207, 217, 140, 19, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1208, 217, 143, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1209, 217, 144, 16, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1210, 217, 114, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1211, 217, 115, 10, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1212, 217, 147, 14, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1213, 217, 148, 5, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1214, 217, 149, 11, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1215, 217, 120, 14, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1216, 217, 123, 14, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1217, 217, 124, 19, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1218, 217, 125, 7, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1219, 217, 126, 15, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1220, 214, 148, 22, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1221, 214, 144, 22.3, NULL, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1222, 260, 112, 34, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1223, 260, 112, 45, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1224, 260, 112, 56, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1225, 261, 112, 56, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1226, 261, 112, 6, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1227, 261, 112, 6, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1228, 262, 112, 78, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1229, 262, 112, 78, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1230, 260, 113, 3, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1231, 260, 113, 4, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1232, 261, 113, 3, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1233, 261, 113, 1, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1234, 261, 113, 1, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1235, 262, 113, 1, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1236, 262, 113, 1, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1237, 262, 113, 1, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1238, 260, 114, 1, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1239, 260, 114, 1, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1240, 260, 114, 1, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1241, 261, 114, 1, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1242, 261, 114, 2, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1243, 261, 114, 2, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1244, 262, 114, 2, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1245, 262, 114, 2, 8, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1246, 262, 114, 2, 9, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1247, 262, 112, 6, 7, NULL)
INSERT [dbo].[ALL_RESULTS] ([ID], [IDtestsElementsLilk], [IDathlete], [ResultValue], [IDjudge], [Mark]) VALUES (1248, 260, 113, 77, 7, NULL)
SET IDENTITY_INSERT [dbo].[ALL_RESULTS] OFF
SET IDENTITY_INSERT [dbo].[ALL_RESULTS_COMPONENTS] ON 

INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (556, 10, 1, 1, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (557, 10, 1, 1, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (558, 10, 1, 1, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (559, 10, 1, 1, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (560, 10, 1, 1, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (561, 10, 2, 1.25, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (562, 10, 2, 1, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (563, 10, 2, 1, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (564, 10, 2, 1.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (565, 10, 2, 1, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (566, 11, 1, 1.5, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (567, 11, 1, 1.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (568, 11, 1, 1.25, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (569, 11, 1, 1.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (570, 11, 1, 1, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (571, 11, 2, 1.25, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (572, 11, 2, 1.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (573, 11, 2, 1.25, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (574, 11, 2, 1.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (575, 11, 2, 1, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (608, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (609, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (610, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (611, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (612, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (613, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (614, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (615, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (616, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (617, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (618, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (619, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (620, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (621, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (622, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (623, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (624, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (625, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (626, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (627, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (628, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (629, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (630, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (631, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (632, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (633, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (634, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (635, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (636, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (637, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (638, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (639, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (640, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (641, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (642, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (643, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (644, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (645, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (646, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (647, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (648, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (649, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (650, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (651, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (652, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (653, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (654, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (655, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (656, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (657, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (658, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (659, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (660, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (661, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (662, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (663, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (664, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (665, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (666, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (667, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (731, 15, 1, 3, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (732, 15, 1, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (733, 15, 1, 2.75, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (734, 15, 1, 2.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (735, 15, 1, 2.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (736, 15, 2, 2.25, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (737, 15, 2, 2.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (738, 15, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (739, 15, 2, 2.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (740, 15, 2, 3, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (741, 15, 3, 2.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (742, 15, 3, 2.75, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (743, 15, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (744, 15, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (745, 15, 3, 3, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (746, 15, 1, 3, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (747, 15, 1, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (748, 15, 1, 2.75, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (749, 15, 1, 2.25, 10)
GO
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (750, 15, 1, 2.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (751, 15, 2, 2.25, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (752, 15, 2, 2.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (753, 15, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (754, 15, 2, 2.25, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (755, 15, 2, 3, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (756, 15, 3, 2.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (757, 15, 3, 2.75, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (758, 15, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (759, 15, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (760, 15, 3, 3, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (761, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (762, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (763, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (764, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (765, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (766, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (767, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (768, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (769, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (770, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (771, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (772, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (773, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (774, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (775, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (776, 14, 1, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (777, 14, 1, 2.25, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (778, 14, 1, 2.5, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (779, 14, 1, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (780, 14, 1, 1.75, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (781, 14, 2, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (782, 14, 2, 3, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (783, 14, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (784, 14, 2, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (785, 14, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (786, 14, 3, 2, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (787, 14, 3, 2, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (788, 14, 3, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (789, 14, 3, 2, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (790, 14, 3, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (905, 23, 1, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (906, 23, 1, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (907, 23, 1, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (908, 23, 1, 1.5, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (909, 23, 1, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (910, 23, 2, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (911, 23, 2, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (912, 23, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (913, 23, 2, 1.75, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (914, 23, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (915, 24, 1, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (916, 24, 1, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (917, 24, 1, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (918, 24, 1, 1.52, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (919, 24, 1, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (920, 24, 2, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (921, 24, 2, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (922, 24, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (923, 24, 2, 1.75, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (924, 24, 2, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (925, 24, 1, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (926, 24, 1, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (927, 24, 1, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (928, 24, 1, 1.52, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (929, 24, 1, 2, 11)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (930, 24, 2, 1.75, 7)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (931, 24, 2, 1.5, 8)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (932, 24, 2, 2, 9)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (933, 24, 2, 1.75, 10)
INSERT [dbo].[ALL_RESULTS_COMPONENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [IDcomponent], [Value], [IDjudge]) VALUES (934, 24, 2, 2, 11)
SET IDENTITY_INSERT [dbo].[ALL_RESULTS_COMPONENTS] OFF
SET IDENTITY_INSERT [dbo].[ALL_RESULTS_ELEMENTS] ON 

INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (494, 10, 0.2, N'', 0, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (495, 10, 0.2, N'', 0, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (496, 10, 0.2, N'', 0, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (497, 10, 0.2, N'', 0, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (498, 10, 0.2, N'', 0, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (499, 10, 0.4, N'', -1, 3, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (500, 10, 0.4, N'', -1, 3, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (501, 10, 0.4, N'', -1, 3, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (502, 10, 0.4, N'', -1, 3, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (503, 10, 0.4, N'', -1, 3, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (504, 10, 0.5, N'x <', -3, 4, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (505, 10, 0.5, N'x <', -2, 4, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (506, 10, 0.5, N'x <', -1, 4, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (507, 10, 0.5, N'x <', -2, 4, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (508, 10, 0.5, N'x <', -1, 4, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (509, 10, 1, N'', -1, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (510, 10, 1, N'', -1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (511, 10, 1, N'', -1, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (512, 10, 1, N'', -1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (513, 10, 1, N'', -1, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (514, 10, 1.5, N'', -1, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (515, 10, 1.5, N'', -1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (516, 10, 1.5, N'', -1, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (517, 10, 1.5, N'', -1, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (518, 10, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (519, 11, 0.2, N'', 0, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (520, 11, 0.2, N'', 0, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (521, 11, 0.2, N'', 0, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (522, 11, 0.2, N'', 0, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (523, 11, 0.2, N'', 0, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (524, 11, 0.4, N'', 0, 3, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (525, 11, 0.4, N'', 0, 3, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (526, 11, 0.4, N'', 0, 3, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (527, 11, 0.4, N'', 0, 3, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (528, 11, 0.4, N'', 1, 3, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (529, 11, 0.5, N'x <', -2, 4, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (530, 11, 0.5, N'x <', -2, 4, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (531, 11, 0.5, N'x <', -2, 4, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (532, 11, 0.5, N'x <', -1, 4, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (533, 11, 0.5, N'x <', -1, 4, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (534, 11, 1, N'', -1, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (535, 11, 1, N'', -1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (536, 11, 1, N'', 0, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (537, 11, 1, N'', -1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (538, 11, 1, N'', 1, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (539, 11, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (540, 11, 1.5, N'', 0, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (541, 11, 1.5, N'', 0, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (542, 11, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (543, 11, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (600, 14, 0.9, N'', 0, 104, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (601, 14, 0.9, N'', 1, 104, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (602, 14, 0.9, N'', 1, 104, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (603, 14, 0.9, N'', 1, 104, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (604, 14, 0.9, N'', 0, 104, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (605, 14, 0.4, N'', 0, 2, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (606, 14, 0.4, N'', 0, 2, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (607, 14, 0.4, N'', 0, 2, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (608, 14, 0.4, N'', 0, 2, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (609, 14, 0.4, N'', 0, 2, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (610, 14, 1.5, N'', -2, 86, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (611, 14, 1.5, N'', -1, 86, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (612, 14, 1.5, N'', -1, 86, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (613, 14, 1.5, N'', -1, 86, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (614, 14, 1.5, N'', -1, 86, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (615, 14, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (616, 14, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (617, 14, 1, N'', 1, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (618, 14, 1, N'', 1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (619, 14, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (620, 14, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (621, 14, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (622, 14, 1.5, N'', 2, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (623, 14, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (624, 14, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (625, 14, 0.2, N'', 0, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (626, 14, 0.2, N'', 0, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (627, 14, 0.2, N'', 0, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (628, 14, 0.2, N'', 0, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (629, 14, 0.2, N'', 0, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (630, 14, 0.4, N'', -1, 2, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (631, 14, 0.4, N'', -1, 2, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (632, 14, 0.4, N'', -3, 2, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (633, 14, 0.4, N'', 0, 2, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (634, 14, 0.4, N'', 0, 2, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (635, 14, 0.9, N'', 0, 104, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (636, 14, 0.9, N'', 1, 104, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (637, 14, 0.9, N'', 1, 104, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (638, 14, 0.9, N'', 1, 104, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (639, 14, 0.9, N'', 0, 104, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (640, 14, 0.4, N'', 0, 2, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (641, 14, 0.4, N'', 0, 2, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (642, 14, 0.4, N'', 0, 2, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (643, 14, 0.4, N'', 0, 2, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (644, 14, 0.4, N'', 0, 2, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (645, 14, 1.5, N'', -2, 86, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (646, 14, 1.5, N'', -1, 86, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (647, 14, 1.5, N'', -1, 86, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (648, 14, 1.5, N'', -1, 86, 10)
GO
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (649, 14, 1.5, N'', -1, 86, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (650, 14, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (651, 14, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (652, 14, 1, N'', 1, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (653, 14, 1, N'', 1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (654, 14, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (655, 14, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (656, 14, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (657, 14, 1.5, N'', 2, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (658, 14, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (659, 14, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (724, 15, 1.1, N'', -2, 7, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (725, 15, 1.1, N'', -1, 7, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (726, 15, 1.1, N'', -1, 7, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (727, 15, 1.1, N'', -2, 7, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (728, 15, 1.1, N'', -2, 7, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (729, 15, 1.6, N'', 1, 81, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (730, 15, 1.6, N'', 2, 81, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (731, 15, 1.6, N'', 2, 81, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (732, 15, 1.6, N'', 2, 81, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (733, 15, 1.6, N'', 1, 81, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (734, 15, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (735, 15, 1.5, N'', 0, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (736, 15, 1.5, N'', 0, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (737, 15, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (738, 15, 1.5, N'', -1, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (739, 15, 1, N'', 0, 106, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (740, 15, 1, N'', 0, 106, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (741, 15, 1, N'', 0, 106, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (742, 15, 1, N'', 1, 106, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (743, 15, 1, N'', 0, 106, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (744, 15, 1.3, N'<<', -2, 9, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (745, 15, 1.3, N'<<', -2, 9, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (746, 15, 1.3, N'<<', -3, 9, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (747, 15, 1.3, N'<<', -2, 9, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (748, 15, 1.3, N'<<', 0, 9, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (749, 15, 1.8, N'x <', -3, 10, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (750, 15, 1.8, N'x <', -3, 10, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (751, 15, 1.8, N'x <', -3, 10, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (752, 15, 1.8, N'x <', -2, 10, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (753, 15, 1.8, N'x <', -3, 10, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (754, 15, 1.6, N'', 0, 56, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (755, 15, 1.6, N'', 0, 56, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (756, 15, 1.6, N'', 1, 56, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (757, 15, 1.6, N'', 0, 56, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (758, 15, 1.6, N'', 1, 56, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (759, 15, 2, N'', 0, 101, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (760, 15, 2, N'', 2, 101, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (761, 15, 2, N'', 2, 101, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (762, 15, 2, N'', 0, 101, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (763, 15, 2, N'', 0, 101, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (764, 15, 1.1, N'', -2, 7, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (765, 15, 1.1, N'', -1, 7, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (766, 15, 1.1, N'', -1, 7, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (767, 15, 1.1, N'', -2, 7, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (768, 15, 1.1, N'', -2, 7, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (769, 15, 1.6, N'', 1, 81, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (770, 15, 1.6, N'', 2, 81, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (771, 15, 1.6, N'', 2, 81, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (772, 15, 1.6, N'', 2, 81, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (773, 15, 1.6, N'', 1, 81, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (774, 15, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (775, 15, 1.5, N'', 0, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (776, 15, 1.5, N'', 0, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (777, 15, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (778, 15, 1.5, N'', -1, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (779, 15, 1, N'', 0, 106, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (780, 15, 1, N'', 0, 106, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (781, 15, 1, N'', 0, 106, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (782, 15, 1, N'', 1, 106, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (783, 15, 1, N'', 0, 106, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (784, 15, 1.3, N'<<', -2, 9, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (785, 15, 1.3, N'<<', -2, 9, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (786, 15, 1.3, N'<<', -3, 9, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (787, 15, 1.3, N'<<', -2, 9, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (788, 15, 1.3, N'<<', 0, 9, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (789, 15, 1.8, N'x <', -3, 10, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (790, 15, 1.8, N'x <', -3, 10, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (791, 15, 1.8, N'x <', -3, 10, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (792, 15, 1.8, N'x <', -2, 10, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (793, 15, 1.8, N'x <', -3, 10, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (794, 15, 1.1, N'', 0, 36, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (795, 15, 1.1, N'', 0, 36, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (796, 15, 1.1, N'', 1, 36, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (797, 15, 1.1, N'', -1, 36, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (798, 15, 1.1, N'', 1, 36, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (799, 15, 2, N'', 0, 101, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (800, 15, 2, N'', 2, 101, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (801, 15, 2, N'', 2, 101, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (802, 15, 2, N'', 0, 101, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (803, 15, 2, N'', 0, 101, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (804, 14, 0.9, N'', 0, 104, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (805, 14, 0.9, N'', 1, 104, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (806, 14, 0.9, N'', 1, 104, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (807, 14, 0.9, N'', 1, 104, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (808, 14, 0.9, N'', 0, 104, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (809, 14, 0.4, N'', 0, 2, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (810, 14, 0.4, N'', 0, 2, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (811, 14, 0.4, N'', 0, 2, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (812, 14, 0.4, N'', 0, 2, 10)
GO
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (813, 14, 0.4, N'', 0, 2, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (814, 14, 1.5, N'', -2, 86, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (815, 14, 1.5, N'', -1, 86, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (816, 14, 1.5, N'', -1, 86, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (817, 14, 1.5, N'', -1, 86, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (818, 14, 1.5, N'', -1, 86, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (819, 14, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (820, 14, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (821, 14, 1, N'', 1, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (822, 14, 1, N'', 1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (823, 14, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (824, 14, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (825, 14, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (826, 14, 1.5, N'', 2, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (827, 14, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (828, 14, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (829, 14, 0.2, N'', -3, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (830, 14, 0.2, N'', -3, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (831, 14, 0.2, N'', -3, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (832, 14, 0.2, N'', -3, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (833, 14, 0.2, N'', -3, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (834, 14, 0.9, N'', 0, 104, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (835, 14, 0.9, N'', 1, 104, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (836, 14, 0.9, N'', 1, 104, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (837, 14, 0.9, N'', 1, 104, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (838, 14, 0.9, N'', 0, 104, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (839, 14, 0.4, N'', 0, 2, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (840, 14, 0.4, N'', 0, 2, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (841, 14, 0.4, N'', 0, 2, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (842, 14, 0.4, N'', 0, 2, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (843, 14, 0.4, N'', 0, 2, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (844, 14, 1.5, N'', -2, 86, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (845, 14, 1.5, N'', -1, 86, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (846, 14, 1.5, N'', -1, 86, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (847, 14, 1.5, N'', -1, 86, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (848, 14, 1.5, N'', -1, 86, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (849, 14, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (850, 14, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (851, 14, 1, N'', 1, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (852, 14, 1, N'', 1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (853, 14, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (854, 14, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (855, 14, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (856, 14, 1.5, N'', 2, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (857, 14, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (858, 14, 1.5, N'', 0, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1090, 23, 0.2, N'', -1, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1091, 23, 0.2, N'', -1, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1092, 23, 0.2, N'', -1, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1093, 23, 0.2, N'', -1, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1094, 23, 0.2, N'', -1, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1095, 23, 0.2, N'', -1, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1096, 23, 0.2, N'', -1, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1097, 23, 0.2, N'', -1, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1098, 23, 0.2, N'', -1, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1099, 23, 0.2, N'', -1, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1100, 23, 0.4, N'x <', -1, 3, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1101, 23, 0.4, N'x <', -1, 3, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1102, 23, 0.4, N'x <', -1, 3, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1103, 23, 0.4, N'x <', -1, 3, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1104, 23, 0.4, N'x <', -1, 3, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1105, 23, 0.5, N'', -2, 4, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1106, 23, 0.5, N'', -2, 4, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1107, 23, 0.5, N'', 0, 4, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1108, 23, 0.5, N'', -2, 4, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1109, 23, 0.5, N'', 0, 4, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1110, 23, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1111, 23, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1112, 23, 1, N'', 0, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1113, 23, 1, N'', -1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1114, 23, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1115, 24, 0.2, N'', -1, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1116, 24, 0.2, N'', -1, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1117, 24, 0.2, N'', -1, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1118, 24, 0.2, N'', -1, 1, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1119, 24, 0.2, N'', -1, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1120, 24, 0.4, N'', -1, 3, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1121, 24, 0.4, N'', -1, 3, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1122, 24, 0.4, N'', -1, 3, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1123, 24, 0.4, N'', -1, 3, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1124, 24, 0.4, N'', -1, 3, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1125, 24, 0.5, N'', -2, 4, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1126, 24, 0.5, N'', -2, 4, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1127, 24, 0.5, N'', 0, 4, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1128, 24, 0.5, N'', -2, 4, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1129, 24, 0.5, N'', 0, 4, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1130, 24, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1131, 24, 1, N'', -1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1132, 24, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1133, 24, 1, N'', 0, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1134, 24, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1135, 24, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1136, 24, 1.5, N'', 1, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1137, 24, 1.5, N'', 1, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1138, 24, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1139, 24, 1.5, N'', 0, 96, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1140, 24, 0.2, N'', -1, 1, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1141, 24, 0.2, N'', -1, 1, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1142, 24, 0.2, N'', -1, 1, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1143, 24, 0.2, N'', -1, 1, 10)
GO
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1144, 24, 0.2, N'', -1, 1, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1145, 24, 0.4, N'', -1, 3, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1146, 24, 0.4, N'', -1, 3, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1147, 24, 0.4, N'', -1, 3, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1148, 24, 0.4, N'', -1, 3, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1149, 24, 0.4, N'', -1, 3, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1150, 24, 0.5, N'', -2, 4, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1151, 24, 0.5, N'', -2, 4, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1152, 24, 0.5, N'', -2, 4, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1153, 24, 0.5, N'', 0, 4, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1154, 24, 0.5, N'', 0, 4, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1155, 24, 1, N'', 1, 26, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1156, 24, 1, N'', -1, 26, 10)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1157, 24, 1, N'', 0, 26, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1158, 24, 1, N'', 0, 26, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1159, 24, 1, N'', 0, 26, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1160, 24, 1.5, N'', 1, 96, 8)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1161, 24, 1.5, N'', 1, 96, 9)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1162, 24, 1.5, N'', 1, 96, 11)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1163, 24, 1.5, N'', 0, 96, 7)
INSERT [dbo].[ALL_RESULTS_ELEMENTS] ([ID], [IDcompetitionPerformanceAthleteLink], [Base], [Info], [Mark], [IDelement], [IDjudge]) VALUES (1164, 24, 1.5, N'', 0, 96, 10)
SET IDENTITY_INSERT [dbo].[ALL_RESULTS_ELEMENTS] OFF
SET IDENTITY_INSERT [dbo].[ATHLETE] ON 

INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (112, N'Белкания', N'Мирослава', N'Марковна', CAST(N'2011-11-22' AS Date), NULL, N'Белкания Марк Владимирович
Белкания Ольга Игоревна', N'8-917-526-80-40 (мама)
8-903-154-98-11 (папа) olga.ko@mail.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (113, N'Бутенко', N'Екатерина', N'Сергеевна', CAST(N'2002-06-18' AS Date), 6, N'Бутенко Сергей Алексеевич
Бутенко Надежда Павловна', N'8-926-230-52-55 (Н.П.)
8-925-446-25-42 (Катя) transvektorfirm@mail.ru
ekaterina2002634@gmail.com', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (114, N'Вершинина', N'Софья', N'Александровна', CAST(N'2007-02-19' AS Date), 4, N'Вершинин Александр Владимирович
Вершинина Елена Николаевна', N'8-499-781-23-54
8-903-569-76-68 v5697668@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (115, N'Гарайдич', N'София', N'Павловна', CAST(N'2008-01-22' AS Date), 2, N'Гарайдич Павел Емельянович
Гарайдич Екатерина Витальевна', N'8-985-289-31-46 ', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (116, N'Голтыхова', N'Мария', N'Алексеевна', CAST(N'2005-12-30' AS Date), NULL, N'Голтыхов Алексей Геннадьевич
Голтыхова Елена Анатольевна', N'8-903-577-46-63 ateatr@teatrsveta.ru
rlo6@bk.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (117, N'Голтыхова', N'Ульяна', N'Алексеевна', CAST(N'2007-04-24' AS Date), NULL, N'Голтыхов Алексей Геннадьевич
Голтыхова Елена Анатольевна', N'8-903-577-46-63 ateatr@teatrsveta.ru 
rlo6@bk.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (118, N'Горбачева', N'Наталья', N'Алексеевна', CAST(N'2000-07-13' AS Date), 4, N'Горбачев Алексей Иванович
Горбачева Лариса Олеговна', N'8-916-148-68-25 (Лариса)
8-915-348-03-17 (Наташа) larissa.chayka68@gmail.com', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (119, N'Дмитриева', N'Алиса', N'Вячеславовна', CAST(N'2011-05-20' AS Date), NULL, N'Дмитриев Вячеслав Витальевич
Дмитриева Анна Валерьевна', N'8-926-833-80-37 
(WhatsApp, Viber) admitrieva-80@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (120, N'Дубинина', N'Екатерина', N'Алексеевна', CAST(N'2010-12-07' AS Date), NULL, N'Дубинин Алексей Вячеславович
Дубинина Лариса Евгеньевна', N'8-926-325-51-33 (мама)
(WhatsApp, Viber)
8-903-222-05-47 (бабушка)
8-967-004-24-64 (папа) step_marina@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (121, N'Ефремова', N'Александра', N'Сергеевна', CAST(N'2004-04-22' AS Date), 5, N'Ефремов Сергей Александрович
Ефремова Олеся Сергеевна', N'8-916-472-34-01 
8-910-313-71-19 (мама)
8-919-276-88-02 (Саша) oefremova1982@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (122, N'Ефремова', N'Анна', N'Сергеевна', CAST(N'2008-07-29' AS Date), NULL, N'Ефремов Сергей Александрович
Ефремова Олеся Сергеевна', N'8-916-472-34-01 
8-910-313-71-19 (мама) oefremova1982@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (123, N'Иминова', N'Амина', N'Магомедкамиловна', CAST(N'2006-01-12' AS Date), NULL, N'Иминова Хадижат Магомедкамиловна', N'8-963-712-03-72 iminova64@yandex.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (124, N'Иминова', N'Хазина', N'Магомедкамиловна', CAST(N'2006-01-12' AS Date), NULL, N'Иминова Хадижат Магомедкамиловна', N'8-963-712-03-72 iminova64@yandex.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (125, N'Калямова', N'Виктория', N'Алексеевна', CAST(N'2007-12-10' AS Date), NULL, N'Калямов Алексей Александрович
Меркина Александра Владимировна', N'8-916-100-05-10
(WhatsApp, Viber) alexandra.merkina@gmail.com', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (126, N'Карпович', N'Анастасия', N'Сергеевна', CAST(N'2010-01-30' AS Date), NULL, N'Карпович Сергей Петрович
Карпович Елена Александровна', N'8-926-282-26-13
8-915-219-01-16
8-915-602-35-90
(WhatsApp, Viber) serge-karpovich@rambler.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (127, N'Кононенко', N'Елена', N'Артемовна', CAST(N'2000-04-26' AS Date), NULL, N'Кононенко Татьяна Анатольевна', N'8-903-156-34-24 (WhatsApp)
8-495-321-07-68 tkonon@mail.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (128, N'Кувшинникова', N'Елена', N'Андреевна', CAST(N'1989-04-27' AS Date), 5, NULL, N'8-926-256-34-75 e_lena27@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (129, N'Макарова', N'Екатерина', N'Александровна', CAST(N'2010-03-15' AS Date), NULL, N'Макаров Александр Николаевич
Макаровна Анна Витальевна', N'8-926-272-84-92
(WhatsApp, Viber) anavmakarova.am@gmail.com', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (130, N'Милехин', N'Александр', N'Алексеевич', CAST(N'2011-08-08' AS Date), NULL, N'Милехин Алексей Николаевич
Пашкова Елена Николаевна', N'8-916-618-21-65 (Елена)
8-903-765-13-98 (Алексей)
8-903-775-08-78 
(Николай Дмитриевич, дедушка) elena.pashkova@rbcmail.ru', NULL, N'+', NULL, N'+', 1)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (131, N'Милехина', N'Анна', N'Алексеевна', CAST(N'2003-08-17' AS Date), 3, N'Милехин Алексей Николаевич
Пашкова Елена Николаевна', N'8-916-618-21-65 (мама)
8-903-765-13-98 (папа)
8-903-775-08-78 
(Николай Дмитриевич, дедушка) elena.pashkova@rbcmail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (132, N'Милехина', N'Елизавета', N'Алексеевна', CAST(N'2005-07-27' AS Date), 3, N'Милехин Алексей Николаевич
Пашкова Елена Николаевна', N'8-916-618-21-65 (мама)
8-903-765-13-98 (папа)
8-903-775-08-78 
(Николай Дмитриевич, дедушка) elena.pashkova@rbcmail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (133, N'Минаева', N'Алина', N'Сергеевна', CAST(N'2005-07-22' AS Date), NULL, N'Минаева Сергей Дмитриевич
Минаева Наталья Михайловна', N'8-903-220-58-68 nataljaminaeva@mail.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (134, N'Минаева', N'Маргарита', N'Сергеевна', CAST(N'2009-11-14' AS Date), NULL, N'Минаева Сергей Дмитриевич
Минаева Наталья Михайловна', N'8-903-220-58-68 nataljaminaeva@mail.ru', NULL, N'+', NULL, NULL, 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (135, N'Нефедов', N'Кирилл', N'Олегович', CAST(N'2012-03-16' AS Date), NULL, N'Нефедов Олег Николаевич
Андриянова Елена Викторовна', N'8-906-793-94-24
8-903-715-36-83 alionkaaaaa@yandex.ru', NULL, NULL, NULL, N'+', 1)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (136, N'Обара', N'Анна', N'Владимировна', CAST(N'2003-10-23' AS Date), NULL, N'Обара Владимир Евгеньевич
Обара Наталья Олеговна', N'8-916-179-30-12 natalia.obara@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (137, N'Пастухова', N'Александра', N'Александровна', CAST(N'2008-05-20' AS Date), NULL, N'Пастухов Александр Владимирович
Овчинникова Елена Вячеславовна', N'8-926-595-51-28 (мама) shunya-2008@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (138, N'Полицына', N'Екатерина', N'Валерьевна', CAST(N'1985-11-15' AS Date), 6, NULL, N'8-903-524-78-25 kathrin.beaver@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (139, N'Пухова', N'Арина', N'Вячеславовна', CAST(N'2006-08-01' AS Date), NULL, N'Пухов Вячеслав Александрович
Пухова Наталья Николаевна', N'8-903-155-76-28
8-903-528-36-67 avt4262690@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (140, N'Родионова', N'Милена', N'Сергеевна', CAST(N'2010-08-23' AS Date), NULL, N'Родионов Сергей Сергеевич
Родионова Мария Леонидовна', N'8-903-737-05-06 (мама)
8-916-622-95-68 (папа) gimenokalisiya@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (141, N'Руденко', N'Анна', N'Викторовна', CAST(N'2004-12-24' AS Date), NULL, N'Руденко Виктор Иванович
Руденко Елена Владимировна', N'8-903-792-55-53 (мама) 
(WhatsApp, Viber)
8-903-792-55-52 Lena17.06.74@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (142, N'Серман', N'Антонина', N'Васильевна', CAST(N'2011-12-18' AS Date), NULL, N'Серман Василий Юрьевич
Серман Анна Петровна', N'8-910-437-48-81
8-499-748-87-46 marfavas1@rambler.ru
yankee@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (143, N'Серман', N'Лидия', N'Васильевна', CAST(N'2009-02-27' AS Date), NULL, N'Серман Василий Юрьевич
Серман Анна Петровна', N'8-910-437-48-81
8-499-748-87-46 marfavas1@rambler.ru
yankee@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (144, N'Товмасян', N'Адриана', N'Гургеновна', CAST(N'2010-06-29' AS Date), NULL, N'Товмасян Элона Романовна
Товмасян Гурген Владимирович', N'8-926-671-44-06 (мама)
8-903-722-08-39 (папа) elona-05@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (145, N'Третьякова', N'Анастасия', N'Алексеевна', CAST(N'1995-04-06' AS Date), 5, NULL, N'8-916-409-59-61 nastijaa@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (146, N'Ходжава', N'Анастасия', N'Гелаевна', CAST(N'2006-07-29' AS Date), NULL, N'Ходжава Гела Жонериевич
Железнова Юлия Владимировна', N'8-916-847-59-97 (мама)
8-916-755-39-12 (папа) lapidusss@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (147, N'Чернышова', N'Анастасия', N'Михайловна', CAST(N'2008-08-24' AS Date), NULL, N'Чернышов Михаил Николаевич
Чернышова Марина Михайловна', N'8-926-701-00-50 chernishovi@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (148, N'Чернышова', N'Надежда', N'Михайловна', CAST(N'2009-10-10' AS Date), NULL, N'Чернышов Михаил Николаевич
Чернышова Марина Михайловна', N'8-926-701-00-50 chernishovi@mail.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (149, N'Алексеева', N'Анастасия', N'Николаевна', CAST(N'2009-03-05' AS Date), NULL, N'Хомич Николай Павлович Алексеева Светлана Анатольевна', N'8-499-165-82-83 8-916-860-36-27', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (150, N'Андриянова', N'Елена', N'Викторовна', CAST(N'1980-08-15' AS Date), 5, NULL, N'8-916-172-37-74 8-903-715-36-83 alionkaaaaa@yandex.ru', NULL, N'+', NULL, N'+', 0)
INSERT [dbo].[ATHLETE] ([ID], [Surname], [Name], [Middlename], [Birthday], [IDrank], [AssigneeFullName], [PhoneNumber], [ActualAddress], [MainDocumentCopy], [MedicalCertificate], [Insurance], [Sex]) VALUES (151, N'Руденко', N'Иван', N'Викторович', CAST(N'2000-01-01' AS Date), NULL, N'Руденко Виктор Иванович Руденко Елена Владимировна', N'8-903-792-55-53 (мама) (WhatsApp, Viber) 8-903-792-55-52 Lena17.06.74@mail.ru', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ATHLETE] OFF
SET IDENTITY_INSERT [dbo].[COMPETITION] ON 

INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1046, 4, N'Юный фигурист', 0, CAST(N'2017-05-18 20:55:44.433' AS DateTime), N'Сиреневый б-р,2', N'', 1)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1054, 4, N'3 юношеский ', 0, CAST(N'2017-05-18 21:32:01.273' AS DateTime), N'Сиреневый б-р,2', N'', 2)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1060, 4, N'2 юношеский ', 0, CAST(N'2017-05-18 21:33:04.983' AS DateTime), N'Сиреневый б-р,2', N'', 3)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1061, 4, N'1 юношеский', 0, CAST(N'2017-05-18 21:35:15.143' AS DateTime), N'Сиреневый б-р,2', N'', 4)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1062, 3, N'Зачет 1 ', 0, CAST(N'2017-05-18 21:35:59.590' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1063, 3, N'Зачет 2', 0, CAST(N'2017-05-18 21:36:15.720' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1064, 3, N'3 юношеский(зачет)', 0, CAST(N'2017-05-18 21:36:23.680' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1067, 2, N'Младшая группа (ОФП)', 0, CAST(N'2017-05-18 21:38:28.167' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1068, 2, N'Средняя группа (ОФП)', 0, CAST(N'2017-05-18 21:39:12.737' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1069, 2, N'Старшая группа (ОФП)', 0, CAST(N'2017-05-18 21:39:31.850' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1070, 1, N'Младшая группа (СФП)', 0, CAST(N'2017-05-18 21:39:52.843' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1071, 1, N'Средняя группа (СФП)', 0, CAST(N'2017-05-18 21:40:08.580' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1072, 1, N'Старшая группа (СФП)', 0, CAST(N'2017-05-18 21:40:32.867' AS DateTime), N'Сиреневый б-р,2', N'', NULL)
INSERT [dbo].[COMPETITION] ([ID], [IDcompetitionKind], [FullName], [InternalExternal], [DateTime], [Address], [Description], [IDrank]) VALUES (1077, 2, N'Старшая группа спортсменов', 0, CAST(N'2017-05-27 13:53:30.873' AS DateTime), N'', N'', 1)
SET IDENTITY_INSERT [dbo].[COMPETITION] OFF
SET IDENTITY_INSERT [dbo].[COMPETITION_ATHLETE_LINK] ON 

INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1174, 140, 1046)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1175, 129, 1046)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1176, 123, 1046)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1177, 124, 1046)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1178, 131, 1061)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1179, 141, 1061)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1180, 132, 1061)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1181, 118, 1061)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1182, 114, 1060)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1183, 125, 1054)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1184, 139, 1054)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1185, 143, 1054)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1187, 151, 1062)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1188, 112, 1062)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1189, 149, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1190, 119, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1191, 142, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1192, 144, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1193, 147, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1194, 148, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1195, 120, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1196, 126, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1197, 115, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1198, 130, 1063)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1199, 127, 1064)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1201, 151, 1067)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1202, 112, 1067)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1203, 142, 1067)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1204, 130, 1067)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1205, 119, 1067)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1206, 140, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1207, 129, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1208, 124, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1209, 123, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1210, 139, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1211, 143, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1212, 125, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1213, 114, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1214, 149, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1215, 144, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1216, 147, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1217, 148, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1218, 120, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1219, 115, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1220, 126, 1068)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1221, 118, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1222, 131, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1223, 132, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1224, 141, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1225, 113, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1226, 127, 1069)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1227, 151, 1070)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1228, 112, 1070)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1229, 142, 1070)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1230, 130, 1070)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1231, 119, 1070)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1232, 140, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1233, 129, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1234, 123, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1235, 124, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1236, 139, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1237, 143, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1238, 125, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1239, 114, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1240, 149, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1241, 144, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1242, 147, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1243, 148, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1244, 120, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1245, 115, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1246, 126, 1071)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1247, 118, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1248, 131, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1250, 132, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1251, 141, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1252, 113, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1253, 127, 1072)
INSERT [dbo].[COMPETITION_ATHLETE_LINK] ([ID], [IDathlete], [IDcompetition]) VALUES (1268, 149, 1077)
SET IDENTITY_INSERT [dbo].[COMPETITION_ATHLETE_LINK] OFF
SET IDENTITY_INSERT [dbo].[COMPETITION_JUDGE_LINK] ON 

INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1039, 1046, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1040, 1046, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1041, 1046, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1042, 1046, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1043, 1046, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1044, 1061, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1045, 1061, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1046, 1061, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1047, 1061, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1048, 1061, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1049, 1060, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1050, 1060, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1051, 1060, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1052, 1060, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1053, 1060, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1054, 1054, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1055, 1054, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1056, 1054, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1057, 1054, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1058, 1054, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1059, 1062, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1060, 1062, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1061, 1062, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1062, 1062, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1063, 1062, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1064, 1063, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1065, 1063, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1066, 1063, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1067, 1063, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1068, 1063, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1069, 1064, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1070, 1064, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1071, 1064, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1072, 1064, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1073, 1064, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1074, 1067, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1075, 1067, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1076, 1067, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1077, 1067, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1078, 1067, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1079, 1067, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1080, 1068, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1081, 1068, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1082, 1068, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1083, 1068, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1084, 1068, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1085, 1068, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1086, 1069, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1087, 1069, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1088, 1069, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1089, 1069, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1090, 1069, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1091, 1069, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1092, 1070, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1093, 1070, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1094, 1070, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1095, 1070, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1096, 1070, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1097, 1070, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1098, 1071, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1099, 1071, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1100, 1071, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1101, 1071, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1102, 1071, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1103, 1071, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1104, 1072, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1105, 1072, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1106, 1072, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1107, 1072, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1108, 1072, 11)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1109, 1072, 1007)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1122, 1077, 7)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1123, 1077, 8)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1124, 1077, 9)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1125, 1077, 10)
INSERT [dbo].[COMPETITION_JUDGE_LINK] ([ID], [IDcompetition], [IDjudge]) VALUES (1126, 1077, 11)
SET IDENTITY_INSERT [dbo].[COMPETITION_JUDGE_LINK] OFF
SET IDENTITY_INSERT [dbo].[COMPETITION_KIND] ON 

INSERT [dbo].[COMPETITION_KIND] ([ID], [FullName], [TableName], [Description]) VALUES (1, N'СФП', N'SFP_ELEMENT', N'---')
INSERT [dbo].[COMPETITION_KIND] ([ID], [FullName], [TableName], [Description]) VALUES (2, N'ОФП', N'OFP_SPECIFICATION', N'---')
INSERT [dbo].[COMPETITION_KIND] ([ID], [FullName], [TableName], [Description]) VALUES (3, N'Ледовые зачеты', N'GLASIAL_ELEMENT', N'---')
INSERT [dbo].[COMPETITION_KIND] ([ID], [FullName], [TableName], [Description]) VALUES (4, N'Одиночное катание', N'Неизвестно', N'---')
INSERT [dbo].[COMPETITION_KIND] ([ID], [FullName], [TableName], [Description]) VALUES (5, N'Спортбалет', N'Неизвестно', N'---')
SET IDENTITY_INSERT [dbo].[COMPETITION_KIND] OFF
SET IDENTITY_INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ON 

INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (10, 1046, 123, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (11, 1046, 124, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (12, 1046, 129, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (13, 1046, 140, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (14, 1054, 125, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (15, 1060, 114, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (16, 1054, 139, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (17, 1054, 143, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (18, 1061, 118, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (19, 1061, 131, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (20, 1061, 132, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (21, 1061, 141, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (22, 1077, 113, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (23, 1077, 140, NULL)
INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID], [IDcompetition], [IDathlete], [IDperformance]) VALUES (24, 1077, 149, NULL)
SET IDENTITY_INSERT [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] OFF
SET IDENTITY_INSERT [dbo].[COMPONENT] ON 

INSERT [dbo].[COMPONENT] ([ID], [FullNameENG], [FullNameRUS], [Description]) VALUES (1, N'Skating skills', N'Навыки скольжения', NULL)
INSERT [dbo].[COMPONENT] ([ID], [FullNameENG], [FullNameRUS], [Description]) VALUES (2, N'Performance', N'Представление', NULL)
INSERT [dbo].[COMPONENT] ([ID], [FullNameENG], [FullNameRUS], [Description]) VALUES (3, N'Interpretation of the Music(Timing)', N'Интерпретация', NULL)
INSERT [dbo].[COMPONENT] ([ID], [FullNameENG], [FullNameRUS], [Description]) VALUES (4, N'Transitions', N'Переходы между элементами', NULL)
INSERT [dbo].[COMPONENT] ([ID], [FullNameENG], [FullNameRUS], [Description]) VALUES (5, N'Сomposition', N'Хореография', NULL)
SET IDENTITY_INSERT [dbo].[COMPONENT] OFF
SET IDENTITY_INSERT [dbo].[COMPONENT_RANK_LINK] ON 

INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (1, 1, 1)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (2, 2, 1)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (3, 1, 2)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (4, 2, 2)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (5, 3, 2)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (6, 1, 3)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (7, 2, 3)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (8, 3, 3)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (9, 1, 4)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (10, 2, 4)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (11, 3, 4)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (12, 1, 5)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (13, 2, 5)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (14, 3, 5)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (15, 4, 5)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (16, 1, 6)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (17, 2, 6)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (18, 3, 6)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (19, 4, 6)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (20, 5, 6)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (21, 1, 7)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (22, 2, 7)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (23, 3, 7)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (24, 4, 7)
INSERT [dbo].[COMPONENT_RANK_LINK] ([ID], [IDcomponent], [IDrank]) VALUES (25, 5, 7)
SET IDENTITY_INSERT [dbo].[COMPONENT_RANK_LINK] OFF
SET IDENTITY_INSERT [dbo].[EMPLOYEE] ON 

INSERT [dbo].[EMPLOYEE] ([ID], [Name], [Surname], [Middlename], [Birthday], [Experience], [Education], [Post]) VALUES (1, N'Ирина', N'Прохорова', N'Владимировна', CAST(N'2000-01-01' AS Date), 0, N'Смоленский государственный институт
физической культуры (МГАФК)', N'Старший тренер-постановщик')
INSERT [dbo].[EMPLOYEE] ([ID], [Name], [Surname], [Middlename], [Birthday], [Experience], [Education], [Post]) VALUES (2, N'Надежда', N'Бутенко', N'Павловна', CAST(N'2000-01-01' AS Date), 0, N'Ташкентское хореографическое училище, 
Московский Государственный Университет культуры и искусств', N'Хореограф-постановщик')
INSERT [dbo].[EMPLOYEE] ([ID], [Name], [Surname], [Middlename], [Birthday], [Experience], [Education], [Post]) VALUES (3, N'Екатерина', N'Полицына', N'Валерьевна', CAST(N'2000-01-01' AS Date), 0, N'Московская государственная академия физической культуры (МГАФК)', N'Тренер')
INSERT [dbo].[EMPLOYEE] ([ID], [Name], [Surname], [Middlename], [Birthday], [Experience], [Education], [Post]) VALUES (4, N'Алена', N'Андриянова', N'...', CAST(N'2000-01-01' AS Date), 0, N'...', N'Тренер')
SET IDENTITY_INSERT [dbo].[EMPLOYEE] OFF
SET IDENTITY_INSERT [dbo].[GLASIAL_ELEMENT] ON 

INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (1, N'Змейка вперед', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (2, N'Змейка назад', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (3, N'Козлик', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (4, N'Вращение на двух ногах с циркуля', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (5, N'Перебежка вперед в обе стороны', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (6, N'Перебежка назад в обе стороны', N'Ногу желательно вести по льду')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (7, N'Перекидной прыжок', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (8, N'Вращение с перебежки назад', N'На одной или двух ногах')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (9, N'Либела — волчок', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (10, N'Флип', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (11, N'Винт', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (12, N'Сальхов-риттбергер', N'Описание какое-нибудь')
INSERT [dbo].[GLASIAL_ELEMENT] ([ID], [FullName], [Description]) VALUES (20, N'Сальхов', N'Описание какое-нибудь')
SET IDENTITY_INSERT [dbo].[GLASIAL_ELEMENT] OFF
SET IDENTITY_INSERT [dbo].[ISU_ELEMENT] ON 

INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (1, N'1W', N'Waltz Jump', N'Перекидной', 0, 1, 0.1, 0.1, 0.1, 0.2, 0.1, NULL, 0, -0.1, -0.2, -0.2)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (2, N'1T', N'Single Toeloop', N'Одинарный Тулуп', 0, 1, 0.6, 0.4, 0.2, 0.4, 0.3, NULL, 0, -0.1, -0.2, -0.3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (3, N'1S', N'Single Salhov', N'Одинарный Сальхов', 0, 1, 0.6, 0.4, 0.2, 0.4, 0.3, NULL, 0, -0.1, -0.2, -0.3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (4, N'1Lo', N'Signle Loop', N'Одинарный Риттбергер', 0, 1, 0.6, 0.4, 0.2, 0.5, 0.4, NULL, 0, -0.1, -0.2, -0.3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (5, N'1F', N'Single Flip', N'Одинарный Флип', 0, 1, 0.6, 0.4, 0.2, 0.5, 0.4, 0.3, 0, -0.1, -0.2, -0.3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (6, N'1Lz', N'Single Lutz', N'Одинарный Лутц', 0, 1, 0.6, 0.4, 0.2, 0.6, 0.5, 0.4, 0, -0.1, -0.2, -0.3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (7, N'1A', N'Single Axcel', N'Одинарный Аксель', 0, 1, 0.6, 0.4, 0.2, 1.1, 0.8, NULL, 1, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (8, N'2T', N'Double Toeloop', N'Тройной тулуп', 0, 1, 0.6, 0.4, 0.2, 1.3, 0.9, NULL, 2, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (9, N'2S', N'Double Salhov', N'Двойной Сальхов', 0, 1, 0.6, 0.4, 0.2, 1.3, 0.9, NULL, 3, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (10, N'2Lo', N'Double Loop', N'Двойной Риттбергер', 0, 1, 0.9, 0.6, 0.3, 1.8, 1.3, NULL, 4, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (11, N'2F', N'Double Flip', N'Двойной Флип', 0, 1, 0.9, 0.6, 0.3, 1.9, 1.4, 1.3, 5, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (12, N'2Lz', N'Double Lutz', N'Двойной Лутц', 0, 1, 0.9, 0.6, 0.3, 2.1, 1.5, 1.4, 6, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (13, N'2A', N'Double Axcel', N'Двойной Аксель', 0, 1, 1.5, 1, 0.5, 3.3, 2.3, NULL, 7, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (14, N'3T', N'Triple Toeloop', N'Тройной Тулуп', 0, 1, 2.1, 1.4, 0.7, 4.3, 3, NULL, 8, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (15, N'3S', N'Triple Salhov', N'Тройной Сальхов', 0, 1, 2.1, 1.4, 0.7, 4.4, 3.1, NULL, 9, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (16, N'3Lo', N'Triple Loop', N'Тройной Риттбергер', 0, 1, 2.1, 1.4, 0.7, 5.1, 3.6, NULL, 10, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (17, N'3F', N'Triple Flip', N'Тройной Флип', 0, 1, 2.1, 1.4, 0.7, 5.3, 3.7, 3.2, 11, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (18, N'3Lz', N'Triple Lutz', N'Тройной Лутц', 0, 1, 2.1, 1.4, 0.7, 6, 4.2, 3.6, 12, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (19, N'3A', N'Triple Axcel', N'Тройной Аксель', 0, 1, 3, 2, 1, 8.5, 5.9, NULL, 13, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (20, N'4T', N'Quad Toeloop', N'Четверной Тулуп', 0, 1, 3, 2, 1, 10.3, 8, NULL, 14, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (21, N'4S', N'Quad Salhov', N'Четверной Сальхов', 0, 1, 3, 2, 1, 10.5, 8.1, NULL, 15, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (22, N'4Lo', N'Quad Loop', N'Четверн. Риттбергер', 0, 1, 3, 2, 1, 12, 8.4, NULL, 16, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (23, N'4F', N'Quad Flip', N'Четверной Флип', 0, 1, 3, 2, 1, 12.3, 8.6, 8, 17, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (24, N'4Lz', N'Quad Lutz', N'Четверной Лутц', 0, 1, 3, 2, 1, 13.6, 9.5, 8.4, 18, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (25, N'4A', N'Quad Axcel', N'Четверной Аксель', 0, 1, 3.6, 2.4, 1.2, 15, 10.5, NULL, 19, -1.2, -2.4, -3.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (26, N'USpB', N'Stand', N'Стоя Уровень Базовый', 0, 2, 1.5, 1, 0.5, 1, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (27, N'USp1', N'Stand level 1', N'Стоя Уровень 1', 1, 2, 1.5, 1, 0.5, 1.2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (28, N'USp2', N'Stand level 2', N'Стоя Уровень 2', 2, 2, 1.5, 1, 0.5, 1.5, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (29, N'USp3', N'Stand level 3', N'Стоя Уровень 3', 3, 2, 1.5, 1, 0.5, 1.9, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (30, N'USp4', N'Stand level 4', N'Стоя Уровень 4', 4, 2, 1.5, 1, 0.5, 2.4, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (31, N'LSpB', N'Layback spin', N'Заклон Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (32, N'LSp1', N'Layback spin level 1', N'Заклон Уровень 1', 1, 2, 1.5, 1, 0.5, 1.5, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (33, N'LSp2', N'Layback spin level 2', N'Заклон Уровень 2', 2, 2, 1.5, 1, 0.5, 1.9, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (34, N'LSp3', N'Layback spin level 3', N'Заклон Уровень 3', 3, 2, 1.5, 1, 0.5, 2.4, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (35, N'LSp4', N'Layback spin level 4', N'Заклон Уровень 4', 4, 2, 1.5, 1, 0.5, 2.7, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (36, N'CSpB', N'Camel Spin', N'Либела Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.1, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (37, N'CSp1', N'Camel Spin Level 1', N'Либела Уровень 1', 1, 2, 1.5, 1, 0.5, 1.4, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (38, N'CSp2', N'Camel Spin Level 2', N'Либела Уровень 2', 2, 2, 1.5, 1, 0.5, 1.8, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (39, N'CSp3', N'Camel Spin Level 3', N'Либела Уровень 3', 3, 2, 1.5, 1, 0.5, 2.3, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (40, N'CSp4', N'Camel Spin Level 4', N'Либела Уровень 4', 4, 2, 1.5, 1, 0.5, 2.6, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (41, N'SSpB', N'Sit Spin', N'Волчок Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.1, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (42, N'SSp1', N'Sit spin level 1', N'Волчок Уровень 1', 1, 2, 1.5, 1, 0.5, 1.3, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (43, N'SSp2', N'Sit spin level 2', N'Волчок Уровень 2', 2, 2, 1.5, 1, 0.5, 1.6, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (44, N'SSp3', N'Sit spin level 3', N'Волчок Уровень 3', 3, 2, 1.5, 1, 0.5, 2.1, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (45, N'SSp4', N'Sit spin level 4', N'Волчок Уровень 4', 4, 2, 1.5, 1, 0.5, 2.5, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (46, N'FUSpB', N'Jump Spin', N'Стоя Уровень Базовый', 0, 2, 1.5, 1, 0.5, 1.5, 1.1, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (47, N'FUSp1', N'Jump Spin level 1', N'Стоя Уровень 1', 1, 2, 1.5, 1, 0.5, 1.7, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (48, N'FUSp2', N'Jump Spin level 2', N'Стоя Уровень 2', 2, 2, 1.5, 1, 0.5, 2, 1.4, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (49, N'FUSp3', N'Jump Spin level 3', N'Стоя Уровень 3', 3, 2, 1.5, 1, 0.5, 2.4, 1.7, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (50, N'FUSp4', N'Jump Spin level 4', N'Стоя Уровень 4', 4, 2, 1.5, 1, 0.5, 2.9, 2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (51, N'FLSpB', N'Jump Layback Spin', N'Заклон Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.7, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (52, N'FLSp1', N'Jump Layback Spin level 1', N'Заклон Уровень 1', 1, 2, 1.5, 1, 0.5, 2, 1.4, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (53, N'FLSp2', N'Jump Layback Spin level 2', N'Заклон Уровень 2', 2, 2, 1.5, 1, 0.5, 2.4, 1.7, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (54, N'FLSp3', N'Jump Layback Spin level 3', N'Заклон Уровень 3', 3, 2, 1.5, 1, 0.5, 2.9, 2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (55, N'FLSp4', N'Jump Layback Spin level 4', N'Заклон Уровень 4', 4, 2, 1.5, 1, 0.5, 3.2, 2.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (56, N'FCSpB', N'Jump Camel Spin', N'Либела Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.6, 1.1, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (57, N'FCSp1', N'Jump Camel Spin level 1', N'Либела Уровень 1', 1, 2, 1.5, 1, 0.5, 1.9, 1.3, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (58, N'FCSp2', N'Jump Camel Spin level 2', N'Либела Уровень 2', 2, 2, 1.5, 1, 0.5, 2.3, 1.6, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (59, N'FCSp3', N'Jump Camel Spin level 3', N'Либела Уровень 3', 3, 2, 1.5, 1, 0.5, 2.8, 2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (60, N'FCSp4', N'Jump Camel Spin level 4', N'Либела Уровень 4', 4, 2, 1.5, 1, 0.5, 3.2, 2.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (61, N'FSSpB', N'Jump Sit Spin', N'Волчок Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.7, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (62, N'FSSp1', N'Jump Sit Spin level 1', N'Волчок Уровень 1', 1, 2, 1.5, 1, 0.5, 2, 1.4, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (63, N'FSSp2', N'Jump Sit Spin level 2', N'Волчок Уровень 2', 2, 2, 1.5, 1, 0.5, 2.3, 1.6, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (64, N'FSSp3', N'Jump Sit Spin level 3', N'Волчок Уровень 3', 3, 2, 1.5, 1, 0.5, 2.6, 1.8, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (65, N'FSSp4', N'Jump Sit Spin level 4', N'Волчок Уровень 4', 4, 2, 1.5, 1, 0.5, 3, 2.1, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (66, N'(F)CUSpB', N'Change leg stand', N'Стоя Уровень Базовый', 0, 2, 1.5, 1, 0.5, 1.5, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (67, N'(F)CUSp1', N'Change leg stand level 1', N'Стоя Уровень 1', 1, 2, 1.5, 1, 0.5, 1.7, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (68, N'(F)CUSp2', N'Change leg stand level 2', N'Стоя Уровень 2', 2, 2, 1.5, 1, 0.5, 2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (69, N'(F)CUSp3', N'Change leg stand level 3', N'Стоя Уровень 3', 3, 2, 1.5, 1, 0.5, 2.4, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (70, N'(F)CUSp4', N'Change leg stand level 4', N'Стоя Уровень 4', 4, 2, 1.5, 1, 0.5, 2.9, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (71, N'(F)CLSpB', N'Change leg Layback', N'Заклон Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.7, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (72, N'(F)CLSp1', N'Change leg Layback level 1', N'Заклон Уровень 1', 1, 2, 1.5, 1, 0.5, 2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (73, N'(F)CLSp2', N'Change leg Layback level 2', N'Заклон Уровень 2', 2, 2, 1.5, 1, 0.5, 2.4, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (74, N'(F)CLSp3', N'Change leg Layback level 3', N'Заклон Уровень 3', 3, 2, 1.5, 1, 0.5, 2.9, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (75, N'(F)CLSp4', N'Change leg Layback level 4', N'Заклон Уровень 4', 4, 2, 1.5, 1, 0.5, 3.2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (76, N'(F)CCSpB', N'Change leg Camel', N'Либела Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.7, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (77, N'(F)CCSp1', N'Change leg Camel level 1', N'Либела Уровень 1', 1, 2, 1.5, 1, 0.5, 2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (78, N'(F)CCSp2', N'Change leg Camel level 2', N'Либела Уровень 2', 2, 2, 1.5, 1, 0.5, 2.3, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (79, N'(F)CCSp3', N'Change leg Camel level 3', N'Либела Уровень 3', 3, 2, 1.5, 1, 0.5, 2.8, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (80, N'(F)CCSp4', N'Change leg Camel level 4', N'Либела Уровень 4', 4, 2, 1.5, 1, 0.5, 3.2, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (81, N'(F)CSSpB', N'Change leg Sit spin', N'Волчок Уров. Базовый', 0, 2, 1.5, 1, 0.5, 1.6, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (82, N'(F)CSSp1', N'Change leg Sit spin level 1', N'Волчок Уровень 1', 1, 2, 1.5, 1, 0.5, 1.9, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (83, N'(F)CSSp2', N'Change leg Sit spin level 2', N'Волчок Уровень 2', 2, 2, 1.5, 1, 0.5, 2.3, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (84, N'(F)CSSp3', N'Change leg Sit spin level 3', N'Волчок Уровень 3', 3, 2, 1.5, 1, 0.5, 2.6, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (85, N'(F)CSSp4', N'Change leg Sit spin level 4', N'Волчок Уровень 4', 4, 2, 1.5, 1, 0.5, 3, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (86, N'(F)CoSp3pB', N'Combination spin', N'Комбинированное вращение', 0, 2, 1.5, 1, 0.5, 1.5, 1.1, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (87, N'(F)CoSp3p1', N'Combination spin level 1', N'Комбинированное вращение уровень 1', 1, 2, 1.5, 1, 0.5, 1.7, 1.3, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (88, N'(F)CoSp3p2', N'Combination spin level 2', N'Комбинированное вращение уровень 2', 2, 2, 1.5, 1, 0.5, 2, 1.5, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (89, N'(F)CoSp3p3', N'Combination spin level 3', N'Комбинированное вращение уровень 3', 3, 2, 1.5, 1, 0.5, 2.5, 1.8, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (90, N'(F)CoSp3p4', N'Combination spin level 4', N'Комбинированное вращение уровень 4', 4, 2, 1.5, 1, 0.5, 3, 2.1, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (91, N'(F)CCoSp3pB', N'Combination change leg', N'Комбинированное вращение со сменой ноги', 0, 2, 1.5, 1, 0.5, 1.7, 1.5, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (92, N'(F)CCoSp3p1', N'Combination change leg  lvl1', N'Комбинированное вращение со сменой ноги уровень 1', 1, 2, 1.5, 1, 0.5, 2, 1.7, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (93, N'(F)CCoSp3p2', N'Combination change leg  lvl2', N'Комбинированное вращение со сменой ноги уровень 2', 2, 2, 1.5, 1, 0.5, 2.5, 2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (94, N'(F)CCoSp3p3', N'Combination change leg  lvl3', N'Комбинированное вращение со сменой ноги уровень 3', 3, 2, 1.5, 1, 0.5, 3, 2.5, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (95, N'(F)CCoSp3p4', N'Combination change leg  lvl4', N'Комбинированное вращение со сменой ноги уровень 4', 4, 2, 1.5, 1, 0.5, 3.5, 3, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (96, N'StSqB', N'Series of steps', N'Дорожка шагов', 0, 3, 1.5, 1, 0.5, 1.5, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (97, N'StSq1', N'Series of steps level 1', N'Дорожка шагов уровень 1', 1, 3, 1.5, 1, 0.5, 1.8, NULL, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (98, N'StSq2', N'Series of steps level 2', N'Дорожка шагов уровень 2', 2, 3, 1.5, 1, 0.5, 2.6, NULL, NULL, 0, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (99, N'StSq3', N'Series of steps level 3', N'Дорожка шагов уровень 3', 3, 3, 1.5, 1, 0.5, 3.3, NULL, NULL, 0, -0.7, -1.4, -2.1)
GO
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (100, N'StSq4', N'Series of steps level 4', N'Дорожка шагов уровень 4', 4, 3, 2.1, 1.4, 0.7, 3.9, NULL, NULL, 0, -0.7, -1.4, -2.1)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (101, N'ChSq', N'Choreografic sequence', N'Хореографическая посл.', 0, 3, 2.1, 1.4, 0.7, 2, NULL, NULL, 0, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (102, N'1W+1Lo', N'Waltz Jump + Loop', N'Перекидной+Риттбергер', 0, 1, 0.7, 0.5, 0.3, 0.7, 0.5, NULL, 0, -0.2, -0.4, -0.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (103, N'1T+1Lo', N'Toeloop-Loop', N'Тулуп-Риттбергер', 0, 1, 1.2, 0.8, 0.4, 0.9, 0.7, NULL, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (104, N'1S+1Lo', N'Salhov-Loop', N'Сальхов-Риттбергер', 0, 1, 1.2, 0.8, 0.4, 0.9, 0.7, NULL, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (105, N'1Lo+1Lo', N'Loop-Loop', N'Риттбергер-Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1, 0.8, NULL, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (106, N'1F+1Lo', N'Flip-Loop', N'Флип-Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1, 0.8, 0.7, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (107, N'1Lz+1Lo', N'Lutz-Loop', N'Лутц-Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1.1, 0.9, 0.8, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (108, N'1T+1T', N'Toeloop-Toeloop', N'Тулуп-Тулуп', 0, 1, 1.2, 0.8, 0.4, 0.8, 0.6, NULL, 0, -0.2, -0.4, -0.6)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (109, N'1T+2T', N'Toeloop-Double toeloop', N'Тулуп-Двойной тулуп', 0, 1, 1.2, 0.8, 0.4, 1.7, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (110, N'2T+1T', N'Double Toeloop - Toeloop', N'Двойной тулуп-тулуп', 0, 1, 1.2, 0.8, 0.4, 1.7, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (111, N'2T+1Lo', N'Double Toeloop - loop', N'Двойной тулуп- Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1.8, 1.3, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (112, N'2Lo+1Lo', N'Double loop - loop', N'Двойной Риттбергер - Риттбергер', 0, 1, 1.5, 1, 0.5, 2.3, 1.7, NULL, 0, -0.4, -0.8, -1.2)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (113, N'2S+1Lo', N'Double Salhov - Loop', N'Двойной Сальхов - Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1.8, 1.3, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (114, N'2F+1Lo', N'Double Flip - loop', N'Двойной Флип - Риттбергер', 0, 1, 1.5, 1, 0.5, 2.4, 1.8, 1.7, 0, -0.4, -0.8, -1.2)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (115, N'1A+1Lo', N'Axcel-loop', N'Аксель - Риттбергер', 0, 1, 1.2, 0.8, 0.4, 1.6, 1.2, NULL, 0, -0.3, -0.6, -0.9)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (116, N'1A+2Lo', N'Axcel - Double loop', N'Аксель - Двойной Риттбергер', 0, 1, 1.5, 1, 0.5, 2.9, 2.1, NULL, 0, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (117, N'1A+1Lo+1S', N'Axcel - Loop - Salhov', N'Аксель-Риттбергер-Сальхов', 0, 1, 1.8, 1.2, 0.6, 2, 1.5, NULL, 0, -0.4, -0.8, -1.2)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (118, N'1A+1Lo+2S', N'Axel - Loop - Double Salhov', N'Аксель - Риттбергер - Двойной сальхов', 0, 1, 1.8, 1.2, 0.6, 2.9, 2.1, NULL, 0, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (119, N'2T+2T', N'Double Toeloop - Double Toeloop', N'Двойной тулуп - Двойной тулуп', 0, 1, 1.2, 0.8, 0.4, 2.6, 1.8, NULL, 0, -0.4, -0.8, -1.2)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (120, N'2T+2Lo', N'Double Toeloop - Double Loop', N'Двойной тулуп - Двойной Риттбергер', 0, 1, 3, 2, 1, 6.1, 4.3, NULL, 0, -1, -2, -3)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (121, N'2S+2Lo', N'Double Salhov - Double loop', N'Двойной сальхов - Двойной Риттбергер', 0, 1, 1.5, 1, 0.5, 3.1, 2.2, NULL, 0, -0.5, -1, -1.5)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (122, N'2Lo+2Lo', N'Double Loop - Double loop', N'Двойной Риттбергер - Двойной Риттбергер', 0, 1, 1.8, 1.2, 0.6, 3.6, 2.6, NULL, 105, -0.6, -1.2, -1.8)
INSERT [dbo].[ISU_ELEMENT] ([ID], [Abbreviation], [FullNameENG], [FullNameRUS], [Level], [IDelementType], [Value_Plus_3], [Value_Plus_2], [Value_Plus_1], [Value_Base], [Value_Base_V], [Value_Base_V1], [Value_Base_V2], [Value_Minus_1], [Value_Minus_2], [Value_Minus_3]) VALUES (123, N'2F+2Lo', N'Double Flip - Double loop', N'Двойной флип - двойной Риттбергер', 0, 1, 1.8, 1.2, 0.6, 3.7, 2.7, 2.6, 0, -0.6, -1.2, -1.8)
SET IDENTITY_INSERT [dbo].[ISU_ELEMENT] OFF
SET IDENTITY_INSERT [dbo].[ISU_ELEMENT_TYPE] ON 

INSERT [dbo].[ISU_ELEMENT_TYPE] ([ID], [FullName], [Description]) VALUES (1, N'Прыжки', NULL)
INSERT [dbo].[ISU_ELEMENT_TYPE] ([ID], [FullName], [Description]) VALUES (2, N'Вращения', NULL)
INSERT [dbo].[ISU_ELEMENT_TYPE] ([ID], [FullName], [Description]) VALUES (3, N'Шаги и хореографические последовательности', NULL)
SET IDENTITY_INSERT [dbo].[ISU_ELEMENT_TYPE] OFF
SET IDENTITY_INSERT [dbo].[JUDGE] ON 

INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (7, N'Елена', N'Андриянова', N'Викторовна', 1, N'Первая категория')
INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (8, N'Елена', N'Кувшинникова', N'Андреевна', 1, N'Первая категория')
INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (9, N'Анастасия', N'Третьякова', N'Алексеевна', 1, N'Первая категория')
INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (10, N'Екатерина', N'Полицына', N'Валерьевна', 1, N'Первая категория')
INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (11, N'Ольга', N'Морозова', N'Викторовна', 1, N'Первая категория')
INSERT [dbo].[JUDGE] ([ID], [Name], [Surname], [Middlename], [IDjudgetype], [Category]) VALUES (1007, N'Ирина', N'Прохорова', N'Владимировна', 1, N'1')
SET IDENTITY_INSERT [dbo].[JUDGE] OFF
SET IDENTITY_INSERT [dbo].[JUDGE_TYPE] ON 

INSERT [dbo].[JUDGE_TYPE] ([ID], [FullName]) VALUES (1, N'Тип1')
INSERT [dbo].[JUDGE_TYPE] ([ID], [FullName]) VALUES (2, N'Тип2')
INSERT [dbo].[JUDGE_TYPE] ([ID], [FullName]) VALUES (3, N'Тип3')
SET IDENTITY_INSERT [dbo].[JUDGE_TYPE] OFF
SET IDENTITY_INSERT [dbo].[OFP_SPECIFICATION] ON 

INSERT [dbo].[OFP_SPECIFICATION] ([ID], [Units], [Description], [FullName]) VALUES (6, N'см', N'Описанние', N'Прыжок в длину с места')
INSERT [dbo].[OFP_SPECIFICATION] ([ID], [Units], [Description], [FullName]) VALUES (7, N'сек', N'Описанние', N'Челночный бег 10 по 5 м')
INSERT [dbo].[OFP_SPECIFICATION] ([ID], [Units], [Description], [FullName]) VALUES (8, N'кол-во, сек', N'Описанние', N'Вис')
INSERT [dbo].[OFP_SPECIFICATION] ([ID], [Units], [Description], [FullName]) VALUES (9, N'кол-во', N'Описанние', N'Подъем туловища за 30 сек')
INSERT [dbo].[OFP_SPECIFICATION] ([ID], [Units], [Description], [FullName]) VALUES (10, N'см', N'Описанние', N'Наклоны сидя')
SET IDENTITY_INSERT [dbo].[OFP_SPECIFICATION] OFF
SET IDENTITY_INSERT [dbo].[OFP_STANDARTS] ON 

INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (2, 7, 0, 4, 22.7, 19.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (3, 7, 1, 4, 22.2, 19.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (4, 7, 0, 5, 22.7, 19.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (5, 7, 1, 5, 22.2, 19.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (6, 7, 0, 6, 22.7, 19.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (7, 7, 1, 6, 22.2, 19.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (8, 7, 0, 7, 22.7, 19.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (9, 7, 1, 7, 22.2, 19.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (10, 7, 0, 8, 22.5, 19.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (11, 7, 1, 8, 21.8, 18.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (12, 7, 0, 9, 22, 19)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (13, 7, 1, 9, 21.5, 18.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (14, 7, 0, 10, 21.8, 18.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (15, 7, 1, 10, 21, 18.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (16, 7, 0, 11, 21.8, 18.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (17, 7, 1, 11, 21, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (18, 7, 0, 12, 21.5, 18.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (19, 7, 1, 12, 20.7, 17.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (20, 7, 0, 13, 21, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (21, 7, 1, 13, 20.4, 17.7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (22, 7, 0, 14, 20.6, 17.6)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (23, 7, 1, 14, 20.1, 17.1)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (24, 7, 0, 15, 20.2, 17.2)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (25, 7, 1, 15, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (26, 7, 0, 16, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (27, 7, 1, 16, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (28, 7, 0, 17, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (29, 7, 1, 17, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (30, 7, 0, 18, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (31, 7, 1, 18, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (32, 7, 0, 19, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (33, 7, 1, 19, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (34, 7, 0, 20, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (35, 7, 1, 20, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (36, 7, 0, 21, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (37, 7, 1, 21, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (38, 7, 0, 22, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (39, 7, 1, 22, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (40, 7, 0, 23, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (41, 7, 1, 23, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (42, 7, 0, 24, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (43, 7, 1, 24, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (44, 7, 0, 25, 19.8, 16.8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (45, 7, 1, 25, 19.5, 16.5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (46, 8, 0, 4, 3, 11)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (47, 8, 1, 4, 1, 3)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (48, 8, 0, 5, 3, 11)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (49, 8, 1, 5, 1, 3)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (50, 8, 0, 6, 3, 11)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (51, 8, 1, 6, 1, 3)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (52, 8, 0, 7, 3, 11)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (53, 8, 1, 7, 1, 3)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (54, 8, 0, 8, 4, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (55, 8, 1, 8, 1, 4)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (56, 8, 0, 9, 6, 14)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (57, 8, 1, 9, 2, 5)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (58, 8, 0, 10, 7, 15)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (59, 8, 1, 10, 2, 6)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (60, 8, 0, 11, 6, 13)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (61, 8, 1, 11, 3, 7)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (62, 8, 0, 12, 7, 14)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (63, 8, 1, 12, 3, 8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (64, 8, 0, 13, 7, 15)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (65, 8, 1, 13, 4, 9)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (66, 8, 0, 14, 8, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (67, 8, 1, 14, 4, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (68, 8, 0, 15, 8, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (69, 8, 1, 15, 4, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (70, 8, 0, 16, 9, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (71, 8, 1, 16, 4, 14)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (72, 8, 0, 17, 10, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (73, 8, 1, 17, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (74, 8, 0, 18, 11, 19)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (75, 8, 1, 18, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (76, 8, 0, 19, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (77, 8, 1, 19, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (78, 8, 0, 20, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (79, 8, 1, 20, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (80, 8, 0, 21, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (81, 8, 1, 21, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (82, 8, 0, 22, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (83, 8, 1, 22, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (84, 8, 0, 23, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (85, 8, 1, 23, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (86, 8, 0, 24, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (87, 8, 1, 24, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (88, 8, 0, 25, 12, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (89, 8, 1, 25, 5, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (90, 6, 0, 4, 100, 130)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (91, 6, 1, 4, 110, 140)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (92, 6, 0, 5, 100, 130)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (93, 6, 1, 5, 110, 140)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (94, 6, 0, 6, 100, 130)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (95, 6, 1, 6, 110, 140)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (96, 6, 0, 7, 100, 130)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (97, 6, 1, 7, 110, 140)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (98, 6, 0, 8, 110, 140)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (99, 6, 1, 8, 120, 150)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (100, 6, 0, 9, 115, 145)
GO
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (101, 6, 1, 9, 130, 160)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (102, 6, 0, 10, 120, 150)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (103, 6, 1, 10, 140, 170)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (104, 6, 0, 11, 130, 160)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (105, 6, 1, 11, 150, 180)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (106, 6, 0, 12, 140, 170)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (107, 6, 1, 12, 160, 190)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (108, 6, 0, 13, 145, 175)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (109, 6, 1, 13, 165, 195)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (110, 6, 0, 14, 155, 190)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (111, 6, 1, 14, 175, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (112, 6, 0, 15, 165, 200)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (113, 6, 1, 15, 180, 220)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (114, 6, 0, 16, 170, 205)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (115, 6, 1, 16, 190, 230)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (116, 6, 0, 17, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (117, 6, 1, 17, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (118, 6, 0, 18, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (119, 6, 1, 18, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (120, 6, 0, 19, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (121, 6, 1, 19, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (122, 6, 0, 20, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (123, 6, 1, 20, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (124, 6, 0, 21, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (125, 6, 1, 21, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (126, 6, 0, 22, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (127, 6, 1, 22, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (128, 6, 0, 23, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (129, 6, 1, 23, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (130, 6, 0, 24, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (131, 6, 1, 24, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (132, 6, 0, 25, 180, 210)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (133, 6, 1, 25, 210, 240)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (134, 9, 0, 4, 6, 13)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (135, 9, 1, 4, 8, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (136, 9, 0, 5, 6, 13)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (137, 9, 1, 5, 8, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (138, 9, 0, 6, 6, 13)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (139, 9, 1, 6, 8, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (140, 9, 0, 7, 6, 13)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (141, 9, 1, 7, 8, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (142, 9, 0, 8, 7, 15)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (143, 9, 1, 8, 8, 19)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (144, 9, 0, 9, 8, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (145, 9, 1, 9, 9, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (146, 9, 0, 10, 9, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (147, 9, 1, 10, 10, 21)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (148, 9, 0, 11, 9, 16)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (149, 9, 1, 11, 11, 21)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (150, 9, 0, 12, 8, 17)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (151, 9, 1, 12, 14, 23)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (152, 9, 0, 13, 9, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (153, 9, 1, 13, 15, 24)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (154, 9, 0, 14, 12, 17)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (155, 9, 1, 14, 14, 24)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (156, 9, 0, 15, 13, 24)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (157, 9, 1, 15, 16, 28)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (158, 9, 0, 16, 13, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (159, 9, 1, 16, 17, 29)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (160, 9, 0, 17, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (161, 9, 1, 17, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (162, 9, 0, 18, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (163, 9, 1, 18, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (164, 9, 0, 19, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (165, 9, 1, 19, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (166, 9, 0, 20, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (167, 9, 1, 20, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (168, 9, 0, 21, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (169, 9, 1, 21, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (170, 9, 0, 22, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (171, 9, 1, 22, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (172, 9, 0, 23, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (173, 9, 1, 23, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (174, 9, 0, 24, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (175, 9, 1, 24, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (176, 9, 0, 25, 14, 26)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (177, 9, 1, 25, 18, 30)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (178, 10, 0, 4, 0, 9)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (179, 10, 1, 4, 0, 8)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (180, 10, 0, 5, 0, 9)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (181, 10, 1, 5, 0, 9)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (182, 10, 0, 6, 0, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (183, 10, 1, 6, 0, 9)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (184, 10, 0, 7, 0, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (185, 10, 1, 7, 0, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (186, 10, 0, 8, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (187, 10, 1, 8, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (188, 10, 0, 9, 2, 14)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (189, 10, 1, 9, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (190, 10, 0, 10, 3, 18)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (191, 10, 1, 10, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (192, 10, 0, 11, 3, 20)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (193, 10, 1, 11, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (194, 10, 0, 12, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (195, 10, 1, 12, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (196, 10, 0, 13, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (197, 10, 1, 13, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (198, 10, 0, 14, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (199, 10, 1, 14, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (200, 10, 0, 15, 3, 25)
GO
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (201, 10, 1, 15, 1, 10)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (202, 10, 0, 16, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (203, 10, 1, 16, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (204, 10, 0, 17, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (205, 10, 1, 17, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (206, 10, 0, 18, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (207, 10, 1, 18, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (208, 10, 0, 19, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (209, 10, 1, 19, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (210, 10, 0, 20, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (211, 10, 1, 20, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (212, 10, 0, 21, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (213, 10, 1, 21, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (214, 10, 0, 22, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (215, 10, 1, 22, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (216, 10, 0, 23, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (217, 10, 1, 23, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (218, 10, 0, 24, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (219, 10, 1, 24, 1, 12)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (220, 10, 0, 25, 3, 25)
INSERT [dbo].[OFP_STANDARTS] ([ID], [IDstandart], [Sex], [Age], [MinValue], [MaxValue]) VALUES (221, 10, 1, 25, 1, 12)
SET IDENTITY_INSERT [dbo].[OFP_STANDARTS] OFF
SET IDENTITY_INSERT [dbo].[ORGANIZATION] ON 

INSERT [dbo].[ORGANIZATION] ([ID], [FullName], [OGRN], [KPP], [INN], [Account], [PhoneNumber], [EMail], [Site], [LegalAddress], [ActualAddress]) VALUES (1, N'Ансамбль ледового танца "Каскад"', N'1165000052447', N'503201001', N'5032245563', N'407038109380000063', N'8-495-371-32-67, 8-916-335-95-03', N'kaskad-ice@yandex.ru', N'kaskad-ice.ru', N'МО, р-н Одинцовский, г. Одинцово, ул. Садовая, д.12, кв 47, 143002', N'г.Москва, Сиреневый бульвар, 1. УСЗК “Измайлово", 143397')
SET IDENTITY_INSERT [dbo].[ORGANIZATION] OFF
SET IDENTITY_INSERT [dbo].[PERFORMANCE] ON 

INSERT [dbo].[PERFORMANCE] ([ID], [FullName], [Phonogram], [CostumeDesign], [CostumePhoto], [Description]) VALUES (75, N'Первая постановка', N'\\C:EXMPL1', N'\\C:EXMPL1', N'\\C:EXMPL1', N'Отличная')
INSERT [dbo].[PERFORMANCE] ([ID], [FullName], [Phonogram], [CostumeDesign], [CostumePhoto], [Description]) VALUES (133, N'Первое плавание', N'C:\program1', N'C:\design1', N'C:\photo1', N'Упражнения нормы юф')
INSERT [dbo].[PERFORMANCE] ([ID], [FullName], [Phonogram], [CostumeDesign], [CostumePhoto], [Description]) VALUES (134, N'Еврейский танец', N'C:\program2', N'C:\design2', N'C:\photo2', N'Спортбалет')
INSERT [dbo].[PERFORMANCE] ([ID], [FullName], [Phonogram], [CostumeDesign], [CostumePhoto], [Description]) VALUES (135, N'Фентази', N'C:\program3', N'C:\design3', N'C:\photo3', N'Хор. упражнения (коротокая программа), категория SENIOR')
SET IDENTITY_INSERT [dbo].[PERFORMANCE] OFF
SET IDENTITY_INSERT [dbo].[RANK] ON 

INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (1, N'Норма "Юный фигурист"', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (2, N'3 юношеский спортивный разряд', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (3, N'2 юношеский спортивный разряд', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (4, N'1 юношеский спортивный разряд', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (5, N'2 спортивный разряд', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (6, N'1 спортивный разряд', NULL, NULL, NULL)
INSERT [dbo].[RANK] ([ID], [FullName], [Requirements], [ProgramStructure], [ProgramsCount]) VALUES (7, N'КМС', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RANK] OFF
SET IDENTITY_INSERT [dbo].[RESULT] ON 

INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (302, 1046, 123, NULL, 5.24, 1, 1, 2.72, 2.52, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (303, 1046, 124, NULL, 6.2799997, 1, 2, 3.34, 2.94, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (304, 1046, 129, NULL, 10.41, 1, 3, 5.19, 5.22, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (305, 1046, 140, NULL, 7.7200003, 1, 4, 3.46, 4.26, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (317, 1062, 112, 1, 121, 1, NULL, NULL, NULL, NULL, 22, 6.05)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (318, 1062, 151, 2, 110, 0, NULL, NULL, NULL, NULL, 31, 5.5)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (319, 1064, 127, 1, 185, 1, NULL, NULL, NULL, NULL, 25, 7.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (320, 1063, 144, 4, 116, 0, NULL, NULL, NULL, NULL, 85, 5.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (321, 1063, 130, 10, 103, 0, NULL, NULL, NULL, NULL, 134, 5.15)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (322, 1063, 115, 9, 104, 0, NULL, NULL, NULL, NULL, 114, 5.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (323, 1063, 147, 7, 113, 0, NULL, NULL, NULL, NULL, 97, 5.65)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (324, 1063, 148, 3, 121, 1, NULL, NULL, NULL, NULL, 67, 6.05)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (325, 1063, 149, 6, 116, 0, NULL, NULL, NULL, NULL, 88, 5.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (326, 1063, 119, 8, 114, 0, NULL, NULL, NULL, NULL, 99, 5.7)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (327, 1063, 120, 4, 118, 0, NULL, NULL, NULL, NULL, 85, 5.9)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (328, 1063, 126, 1, 130, 1, NULL, NULL, NULL, NULL, 50, 6.5)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (329, 1063, 142, 2, 123, 1, NULL, NULL, NULL, NULL, 63, 6.15)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (330, 1070, 130, 4, 30, 1, NULL, NULL, NULL, NULL, 21, 6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (331, 1070, 142, 3, 37, 1, NULL, NULL, NULL, NULL, 14, 7.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (332, 1070, 112, 2, 44, 1, NULL, NULL, NULL, NULL, 10, 8.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (333, 1070, 119, 1, 48, 1, NULL, NULL, NULL, NULL, 5, 9.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (334, 1070, 151, 5, 29, 1, NULL, NULL, NULL, NULL, 22, 5.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (341, 1072, 113, 1, 50, 1, NULL, NULL, NULL, NULL, 5, 10)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (342, 1072, 131, 2, 48, 1, NULL, NULL, NULL, NULL, 7, 9.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (343, 1072, 132, 3, 47, 1, NULL, NULL, NULL, NULL, 9, 9.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (344, 1072, 118, 4, 46, 1, NULL, NULL, NULL, NULL, 10, 9.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (345, 1072, 141, 6, 39, 1, NULL, NULL, NULL, NULL, 25, 7.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (346, 1072, 127, 5, 42, 1, NULL, NULL, NULL, NULL, 16, 8.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (377, 1067, 130, 3, 14, 1, NULL, NULL, NULL, NULL, 15, 2.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (378, 1067, 142, 3, 16, 1, NULL, NULL, NULL, NULL, 15, 3.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (379, 1067, 112, 2, 37, 1, NULL, NULL, NULL, NULL, 12, 7.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (380, 1067, 119, 1, 58, 1, NULL, NULL, NULL, NULL, 9, 11.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (381, 1067, 151, 5, 14, 1, NULL, NULL, NULL, NULL, 18, 2.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (424, 1068, 129, 7, 18, 1, NULL, NULL, NULL, NULL, 28, 3.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (425, 1068, 139, 9, 17, 1, NULL, NULL, NULL, NULL, 39, 3.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (426, 1068, 140, 1, 25, 1, NULL, NULL, NULL, NULL, 17, 5)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (427, 1068, 143, 11, 15, 1, NULL, NULL, NULL, NULL, 40, 3)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (428, 1068, 144, 5, 22, 1, NULL, NULL, NULL, NULL, 26, 4.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (429, 1068, 114, 3, 23, 1, NULL, NULL, NULL, NULL, 25, 4.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (430, 1068, 115, 13, 15, 1, NULL, NULL, NULL, NULL, 43, 3)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (431, 1068, 147, 2, 22, 1, NULL, NULL, NULL, NULL, 22, 4.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (432, 1068, 148, 15, 12, 1, NULL, NULL, NULL, NULL, 50, 2.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (433, 1068, 149, 14, 12, 1, NULL, NULL, NULL, NULL, 45, 2.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (434, 1068, 120, 12, 14, 1, NULL, NULL, NULL, NULL, 41, 2.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (435, 1068, 123, 9, 16, 1, NULL, NULL, NULL, NULL, 39, 3.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (436, 1068, 124, 6, 19, 1, NULL, NULL, NULL, NULL, 27, 3.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (437, 1068, 125, 3, 22, 1, NULL, NULL, NULL, NULL, 25, 4.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (438, 1068, 126, 8, 20, 1, NULL, NULL, NULL, NULL, 33, 4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (439, 1071, 129, 9, 44, 1, NULL, NULL, NULL, NULL, 28, 8.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (440, 1071, 139, 14, 39, 1, NULL, NULL, NULL, NULL, 54, 7.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (441, 1071, 140, 7, 45, 1, NULL, NULL, NULL, NULL, 21, 9)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (442, 1071, 143, 12, 41, 1, NULL, NULL, NULL, NULL, 47, 8.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (443, 1071, 144, 9, 44, 1, NULL, NULL, NULL, NULL, 28, 8.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (444, 1071, 114, 4, 46, 1, NULL, NULL, NULL, NULL, 12, 9.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (445, 1071, 115, 13, 41, 1, NULL, NULL, NULL, NULL, 51, 8.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (446, 1071, 147, 1, 49, 1, NULL, NULL, NULL, NULL, 5, 9.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (447, 1071, 148, 11, 43, 1, NULL, NULL, NULL, NULL, 39, 8.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (448, 1071, 149, 15, 36, 1, NULL, NULL, NULL, NULL, 68, 7.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (449, 1071, 120, 4, 46, 1, NULL, NULL, NULL, NULL, 12, 9.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (450, 1071, 123, 3, 47, 1, NULL, NULL, NULL, NULL, 10, 9.4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (451, 1071, 124, 2, 48, 1, NULL, NULL, NULL, NULL, 7, 9.6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (452, 1071, 125, 8, 46, 1, NULL, NULL, NULL, NULL, 23, 9.2)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (453, 1071, 126, 6, 45, 1, NULL, NULL, NULL, NULL, 17, 9)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (468, 1060, 114, NULL, 21.55, 1, 1, 10.31, 12.24, 1, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (469, 1054, 125, NULL, 15.23, 0, 1, 5.78, 9.45, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (470, 1054, 139, NULL, 14.09, 0, 2, 4.86, 9.23, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (471, 1054, 143, NULL, 15.42, 1, 3, 5.88, 9.54, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (472, 1061, 118, NULL, 30.52, 0, 1, 9.52, 21, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (473, 1061, 131, NULL, 33.24, 0, 1, 11.94, 21.3, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (476, 1061, 132, NULL, 32.99, 0, 2, 12.79, 21.2, 1, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (477, 1061, 141, NULL, 36.64, 0, 3, 14.84, 21.8, 0, NULL, NULL)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (487, 1069, 113, 2, 30, 1, NULL, NULL, NULL, NULL, 13, 6)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (488, 1069, 131, 2, 25, 1, NULL, NULL, NULL, NULL, 13, 5)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (489, 1069, 132, 1, 25, 1, NULL, NULL, NULL, NULL, 12, 5)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (490, 1069, 118, 6, 9, 1, NULL, NULL, NULL, NULL, 23, 1.8)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (491, 1069, 141, 5, 20, 1, NULL, NULL, NULL, NULL, 18, 4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (492, 1069, 127, 4, 20, 1, NULL, NULL, NULL, NULL, 15, 4)
INSERT [dbo].[RESULT] ([ID], [IDcompetition], [IDathlete], [Place], [SumResult], [isDone], [StartNumber], [SumOfAllElements], [SumOfAllComponents], [Deductions], [SumPlaces], [AverageMark]) VALUES (493, 1077, 149, NULL, 7.88, 1, 1, 3.62, 4.26, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RESULT] OFF
SET IDENTITY_INSERT [dbo].[SEASON] ON 

INSERT [dbo].[SEASON] ([ID], [Period]) VALUES (2, N'2016/2017')
INSERT [dbo].[SEASON] ([ID], [Period]) VALUES (20, N'ninin')
SET IDENTITY_INSERT [dbo].[SEASON] OFF
SET IDENTITY_INSERT [dbo].[SEASON_PERFORMANCE] ON 

INSERT [dbo].[SEASON_PERFORMANCE] ([ID], [IDseason], [IDathlete], [IDperformance]) VALUES (247, 2, NULL, 133)
INSERT [dbo].[SEASON_PERFORMANCE] ([ID], [IDseason], [IDathlete], [IDperformance]) VALUES (248, 2, NULL, 134)
INSERT [dbo].[SEASON_PERFORMANCE] ([ID], [IDseason], [IDathlete], [IDperformance]) VALUES (249, 2, NULL, 135)
SET IDENTITY_INSERT [dbo].[SEASON_PERFORMANCE] OFF
SET IDENTITY_INSERT [dbo].[SFP_ELEMENT] ON 

INSERT [dbo].[SFP_ELEMENT] ([ID], [FullName], [Description]) VALUES (1, N'Шпагат с левой ноги', N'Описание какое-нибудь')
INSERT [dbo].[SFP_ELEMENT] ([ID], [FullName], [Description]) VALUES (2, N'Шпагат с правой ноги', N'Описание какое-нибудь')
INSERT [dbo].[SFP_ELEMENT] ([ID], [FullName], [Description]) VALUES (3, N'Шпагат поперечный', N'Описание какое-нибудь')
INSERT [dbo].[SFP_ELEMENT] ([ID], [FullName], [Description]) VALUES (4, N'Тур', N'Описание какое-нибудь')
INSERT [dbo].[SFP_ELEMENT] ([ID], [FullName], [Description]) VALUES (5, N'Мостик', N'Описание какое-нибудь')
SET IDENTITY_INSERT [dbo].[SFP_ELEMENT] OFF
SET IDENTITY_INSERT [dbo].[TESTS_ELEMENTS_LINK] ON 

INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (195, 1062, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (196, 1062, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (197, 1062, 3)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (198, 1062, 4)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (199, 1063, 5)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (200, 1063, 6)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (201, 1063, 7)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (202, 1063, 8)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (203, 1064, 12)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (204, 1064, 10)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (205, 1064, 20)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (206, 1064, 9)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (207, 1064, 11)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (208, 1067, 6)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (209, 1067, 7)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (210, 1067, 8)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (211, 1067, 9)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (212, 1067, 10)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (213, 1068, 6)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (214, 1068, 7)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (215, 1068, 8)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (216, 1068, 9)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (217, 1068, 10)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (218, 1069, 6)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (219, 1069, 7)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (220, 1069, 8)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (221, 1069, 9)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (222, 1069, 10)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (223, 1070, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (224, 1070, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (225, 1070, 3)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (226, 1070, 4)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (227, 1070, 5)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (228, 1071, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (229, 1071, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (230, 1071, 3)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (231, 1071, 4)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (232, 1071, 5)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (233, 1072, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (234, 1072, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (235, 1072, 3)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (236, 1072, 4)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (237, 1072, 5)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (260, 1073, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (261, 1073, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (262, 1073, 3)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (269, 1077, 1)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (270, 1077, 2)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (271, 1077, 6)
INSERT [dbo].[TESTS_ELEMENTS_LINK] ([ID], [IDcompetition], [IDelement]) VALUES (272, 1077, 7)
SET IDENTITY_INSERT [dbo].[TESTS_ELEMENTS_LINK] OFF
/****** Object:  Index [ALL_RESULTS_IDathlete]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ALL_RESULTS_IDathlete] ON [dbo].[ALL_RESULTS]
(
	[IDathlete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ALL_RESULTS_IDtestsElementsLilk]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ALL_RESULTS_IDtestsElementsLilk] ON [dbo].[ALL_RESULTS]
(
	[IDtestsElementsLilk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ALL_RESULTS_COMPONENTS_IDcompetitionPerformanceAthleteLink]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ALL_RESULTS_COMPONENTS_IDcompetitionPerformanceAthleteLink] ON [dbo].[ALL_RESULTS_COMPONENTS]
(
	[IDcompetitionPerformanceAthleteLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ALL_RESULTS_ELEMENTS_IDcompetitionPerformanceAthleteLink]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ALL_RESULTS_ELEMENTS_IDcompetitionPerformanceAthleteLink] ON [dbo].[ALL_RESULTS_ELEMENTS]
(
	[IDcompetitionPerformanceAthleteLink] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ATHLETE_ID]    Script Date: 29.05.2017 12:25:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [ATHLETE_ID] ON [dbo].[ATHLETE]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ATHLETE_Middlename]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ATHLETE_Middlename] ON [dbo].[ATHLETE]
(
	[Middlename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ATHLETE_Name]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ATHLETE_Name] ON [dbo].[ATHLETE]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ATHLETE_Surname]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [ATHLETE_Surname] ON [dbo].[ATHLETE]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [COMPETITION_FullName]    Script Date: 29.05.2017 12:25:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [COMPETITION_FullName] ON [dbo].[COMPETITION]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMPETITION_IDcompetitionKind]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPETITION_IDcompetitionKind] ON [dbo].[COMPETITION]
(
	[IDcompetitionKind] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMPETITION_PERFORMANCE_ATHLETE_LINK_IDathlete]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPETITION_PERFORMANCE_ATHLETE_LINK_IDathlete] ON [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]
(
	[IDathlete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMPETITION_PERFORMANCE_ATHLETE_LINK_IDcompetition]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPETITION_PERFORMANCE_ATHLETE_LINK_IDcompetition] ON [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]
(
	[IDcompetition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [COMPONENT_FullNameENG]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPONENT_FullNameENG] ON [dbo].[COMPONENT]
(
	[FullNameENG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMPONENT_RANK_LINK_IDcomponent]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPONENT_RANK_LINK_IDcomponent] ON [dbo].[COMPONENT_RANK_LINK]
(
	[IDcomponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [COMPONENT_RANK_LINK_IDrank]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [COMPONENT_RANK_LINK_IDrank] ON [dbo].[COMPONENT_RANK_LINK]
(
	[IDrank] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EMPLOYEE_Middlename]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [EMPLOYEE_Middlename] ON [dbo].[EMPLOYEE]
(
	[Middlename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EMPLOYEE_Name]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [EMPLOYEE_Name] ON [dbo].[EMPLOYEE]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EMPLOYEE_Surname]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [EMPLOYEE_Surname] ON [dbo].[EMPLOYEE]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [GLASIAL_ELEMENT_FullName]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [GLASIAL_ELEMENT_FullName] ON [dbo].[GLASIAL_ELEMENT]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [JUDGE_Middlename]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [JUDGE_Middlename] ON [dbo].[JUDGE]
(
	[Middlename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [JUDGE_Name]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [JUDGE_Name] ON [dbo].[JUDGE]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [JUDGE_Surname]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [JUDGE_Surname] ON [dbo].[JUDGE]
(
	[Surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [PERFORMANCE_FullName]    Script Date: 29.05.2017 12:25:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PERFORMANCE_FullName] ON [dbo].[PERFORMANCE]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PERFORMANCE_ID]    Script Date: 29.05.2017 12:25:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [PERFORMANCE_ID] ON [dbo].[PERFORMANCE]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RANK_FullName]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [RANK_FullName] ON [dbo].[RANK]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [REQUEST_IDcompetition]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [REQUEST_IDcompetition] ON [dbo].[REQUEST]
(
	[IDcompetition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RESULT_IDathlete]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [RESULT_IDathlete] ON [dbo].[RESULT]
(
	[IDathlete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [RESULT_IDcompetition]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [RESULT_IDcompetition] ON [dbo].[RESULT]
(
	[IDcompetition] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [SEASON_PERFORMANCE_IDseason]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [SEASON_PERFORMANCE_IDseason] ON [dbo].[SEASON_PERFORMANCE]
(
	[IDseason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [SFP_ELEMENT_FullName]    Script Date: 29.05.2017 12:25:38 ******/
CREATE NONCLUSTERED INDEX [SFP_ELEMENT_FullName] ON [dbo].[SFP_ELEMENT]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ALL_RESULTS]  WITH CHECK ADD  CONSTRAINT [FKALL_RESULT630754] FOREIGN KEY([IDtestsElementsLilk])
REFERENCES [dbo].[TESTS_ELEMENTS_LINK] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS] CHECK CONSTRAINT [FKALL_RESULT630754]
GO
ALTER TABLE [dbo].[ALL_RESULTS]  WITH CHECK ADD  CONSTRAINT [FKALL_RESULT915953] FOREIGN KEY([IDathlete])
REFERENCES [dbo].[ATHLETE] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS] CHECK CONSTRAINT [FKALL_RESULT915953]
GO
ALTER TABLE [dbo].[ALL_RESULTS_COMPONENTS]  WITH CHECK ADD FOREIGN KEY([IDjudge])
REFERENCES [dbo].[JUDGE] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_COMPONENTS]  WITH CHECK ADD  CONSTRAINT [FKALL_RESULT231120] FOREIGN KEY([IDcompetitionPerformanceAthleteLink])
REFERENCES [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_COMPONENTS] CHECK CONSTRAINT [FKALL_RESULT231120]
GO
ALTER TABLE [dbo].[ALL_RESULTS_COMPONENTS]  WITH CHECK ADD  CONSTRAINT [FKALL_RESULT991633] FOREIGN KEY([IDcomponent])
REFERENCES [dbo].[COMPONENT] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_COMPONENTS] CHECK CONSTRAINT [FKALL_RESULT991633]
GO
ALTER TABLE [dbo].[ALL_RESULTS_ELEMENTS]  WITH CHECK ADD FOREIGN KEY([IDelement])
REFERENCES [dbo].[ISU_ELEMENT] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_ELEMENTS]  WITH CHECK ADD FOREIGN KEY([IDjudge])
REFERENCES [dbo].[JUDGE] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_ELEMENTS]  WITH CHECK ADD  CONSTRAINT [FKALL_RESULT730463] FOREIGN KEY([IDcompetitionPerformanceAthleteLink])
REFERENCES [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] ([ID])
GO
ALTER TABLE [dbo].[ALL_RESULTS_ELEMENTS] CHECK CONSTRAINT [FKALL_RESULT730463]
GO
ALTER TABLE [dbo].[ATHLETE]  WITH CHECK ADD  CONSTRAINT [FKATHLETE366475] FOREIGN KEY([IDrank])
REFERENCES [dbo].[RANK] ([ID])
GO
ALTER TABLE [dbo].[ATHLETE] CHECK CONSTRAINT [FKATHLETE366475]
GO
ALTER TABLE [dbo].[COMPETITION]  WITH CHECK ADD FOREIGN KEY([IDrank])
REFERENCES [dbo].[RANK] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO471435] FOREIGN KEY([IDcompetitionKind])
REFERENCES [dbo].[COMPETITION_KIND] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION] CHECK CONSTRAINT [FKCOMPETITIO471435]
GO
ALTER TABLE [dbo].[COMPETITION_ATHLETE_LINK]  WITH CHECK ADD  CONSTRAINT [toathlete] FOREIGN KEY([IDathlete])
REFERENCES [dbo].[ATHLETE] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_ATHLETE_LINK] CHECK CONSTRAINT [toathlete]
GO
ALTER TABLE [dbo].[COMPETITION_ATHLETE_LINK]  WITH CHECK ADD  CONSTRAINT [tocompetition] FOREIGN KEY([IDcompetition])
REFERENCES [dbo].[COMPETITION] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_ATHLETE_LINK] CHECK CONSTRAINT [tocompetition]
GO
ALTER TABLE [dbo].[COMPETITION_JUDGE_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO560431] FOREIGN KEY([IDjudge])
REFERENCES [dbo].[JUDGE] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_JUDGE_LINK] CHECK CONSTRAINT [FKCOMPETITIO560431]
GO
ALTER TABLE [dbo].[COMPETITION_JUDGE_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO627556] FOREIGN KEY([IDcompetition])
REFERENCES [dbo].[COMPETITION] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_JUDGE_LINK] CHECK CONSTRAINT [FKCOMPETITIO627556]
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO392003] FOREIGN KEY([IDathlete])
REFERENCES [dbo].[ATHLETE] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] CHECK CONSTRAINT [FKCOMPETITIO392003]
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO76804] FOREIGN KEY([IDcompetition])
REFERENCES [dbo].[COMPETITION] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] CHECK CONSTRAINT [FKCOMPETITIO76804]
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPETITIO92772] FOREIGN KEY([IDperformance])
REFERENCES [dbo].[PERFORMANCE] ([ID])
GO
ALTER TABLE [dbo].[COMPETITION_PERFORMANCE_ATHLETE_LINK] CHECK CONSTRAINT [FKCOMPETITIO92772]
GO
ALTER TABLE [dbo].[COMPONENT_RANK_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPONENT_11898] FOREIGN KEY([IDcomponent])
REFERENCES [dbo].[COMPONENT] ([ID])
GO
ALTER TABLE [dbo].[COMPONENT_RANK_LINK] CHECK CONSTRAINT [FKCOMPONENT_11898]
GO
ALTER TABLE [dbo].[COMPONENT_RANK_LINK]  WITH CHECK ADD  CONSTRAINT [FKCOMPONENT_584186] FOREIGN KEY([IDrank])
REFERENCES [dbo].[RANK] ([ID])
GO
ALTER TABLE [dbo].[COMPONENT_RANK_LINK] CHECK CONSTRAINT [FKCOMPONENT_584186]
GO
ALTER TABLE [dbo].[JUDGE]  WITH CHECK ADD  CONSTRAINT [FKJUDGE9639] FOREIGN KEY([IDjudgetype])
REFERENCES [dbo].[JUDGE_TYPE] ([ID])
GO
ALTER TABLE [dbo].[JUDGE] CHECK CONSTRAINT [FKJUDGE9639]
GO
ALTER TABLE [dbo].[OFP_STANDARTS]  WITH CHECK ADD FOREIGN KEY([IDstandart])
REFERENCES [dbo].[OFP_SPECIFICATION] ([ID])
GO
ALTER TABLE [dbo].[REQUEST]  WITH CHECK ADD  CONSTRAINT [FKREQUEST228446] FOREIGN KEY([IDorganization])
REFERENCES [dbo].[ORGANIZATION] ([ID])
GO
ALTER TABLE [dbo].[REQUEST] CHECK CONSTRAINT [FKREQUEST228446]
GO
ALTER TABLE [dbo].[REQUEST]  WITH CHECK ADD  CONSTRAINT [FKREQUEST954384] FOREIGN KEY([IDcompetition])
REFERENCES [dbo].[COMPETITION] ([ID])
GO
ALTER TABLE [dbo].[REQUEST] CHECK CONSTRAINT [FKREQUEST954384]
GO
ALTER TABLE [dbo].[REQUEST]  WITH CHECK ADD  CONSTRAINT [FKREQUEST970352] FOREIGN KEY([IDperformance])
REFERENCES [dbo].[PERFORMANCE] ([ID])
GO
ALTER TABLE [dbo].[REQUEST] CHECK CONSTRAINT [FKREQUEST970352]
GO
ALTER TABLE [dbo].[RESULT]  WITH CHECK ADD  CONSTRAINT [FKRESULT464662] FOREIGN KEY([IDathlete])
REFERENCES [dbo].[ATHLETE] ([ID])
GO
ALTER TABLE [dbo].[RESULT] CHECK CONSTRAINT [FKRESULT464662]
GO
ALTER TABLE [dbo].[RESULT]  WITH CHECK ADD  CONSTRAINT [FKRESULT822127] FOREIGN KEY([IDcompetition])
REFERENCES [dbo].[COMPETITION] ([ID])
GO
ALTER TABLE [dbo].[RESULT] CHECK CONSTRAINT [FKRESULT822127]
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE]  WITH CHECK ADD  CONSTRAINT [FKSEASON_PER172707] FOREIGN KEY([IDseason])
REFERENCES [dbo].[SEASON] ([ID])
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE] CHECK CONSTRAINT [FKSEASON_PER172707]
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE]  WITH CHECK ADD  CONSTRAINT [FKSEASON_PER707025] FOREIGN KEY([IDathlete])
REFERENCES [dbo].[ATHLETE] ([ID])
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE] CHECK CONSTRAINT [FKSEASON_PER707025]
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE]  WITH CHECK ADD  CONSTRAINT [FKSEASON_PER993742] FOREIGN KEY([IDperformance])
REFERENCES [dbo].[PERFORMANCE] ([ID])
GO
ALTER TABLE [dbo].[SEASON_PERFORMANCE] CHECK CONSTRAINT [FKSEASON_PER993742]
GO
USE [master]
GO
ALTER DATABASE [DB] SET  READ_WRITE 
GO
