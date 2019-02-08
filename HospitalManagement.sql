USE [master]
GO
/****** Object:  Database [HospitalManagement]    Script Date: 02/08/2019 6:40:40 PM ******/
CREATE DATABASE [HospitalManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HospitalManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HospitalManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HospitalManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HospitalManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HospitalManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HospitalManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HospitalManagement]
GO
/****** Object:  Table [dbo].[Caregivers]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caregivers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[User_Id] [bigint] NOT NULL,
	[Patient_Id] [bigint] NULL,
 CONSTRAINT [PK_Caregivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Designation] [nvarchar](max) NULL,
	[Specialization] [nvarchar](max) NULL,
	[User_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Events]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Start] [datetime] NULL,
	[End] [datetime] NULL,
	[allDay] [bit] NULL,
	[UserId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[StartDateStr] [nvarchar](max) NULL,
	[StartTime] [time](7) NULL,
	[EndDateStr] [nvarchar](max) NULL,
	[EndTime] [time](7) NULL,
	[URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginAttempts]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginAttempts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IsPassed] [bit] NULL,
	[AttemptDateTime] [datetime] NULL,
	[IpAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoginAttempts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NULL,
	[DoctorId] [bigint] NOT NULL,
	[PatientId] [bigint] NOT NULL,
	[FromPatient] [bit] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Disease] [nvarchar](max) NULL,
	[Occupation] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[EntryTime] [time](7) NULL,
	[EntryDateStr] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[User_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/08/2019 6:40:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[Age] [bigint] NULL,
	[Gender] [nvarchar](max) NULL,
	[NRIC] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[ContactNo] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Token] [nvarchar](max) NULL,
	[OTP] [nvarchar](max) NULL,
	[OTPExpiration] [datetime] NULL,
	[IsLogin] [bit] NULL,
	[LastLogin] [datetime] NULL,
	[IsEnabled] [bit] NULL,
	[EnableToken] [nvarchar](max) NULL,
	[LoginAttemptCount] [int] NULL,
	[Role_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

GO
INSERT [dbo].[Doctors] ([Id], [Designation], [Specialization], [User_Id]) VALUES (1, N'Doctor', N'Dentist', 7)
GO
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginAttempts] ON 

GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (1, N'p1@p1.com', N'patient', 0, CAST(N'2019-02-07 19:22:37.847' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (2, N'p1@p1.com', NULL, 1, CAST(N'2019-02-07 19:24:31.930' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (3, N'd1@d1.com', NULL, 1, CAST(N'2019-02-07 19:25:27.513' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (4, N'hello@123.com', NULL, 1, CAST(N'2019-02-07 19:32:10.920' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (5, N'hello@123.com', NULL, 1, CAST(N'2019-02-07 19:32:53.817' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (6, N'admin@admin.com', NULL, 1, CAST(N'2019-02-08 13:12:21.227' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (7, N'admin@admin.com', N'Admin', 0, CAST(N'2019-02-08 13:14:54.980' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (8, N'admin@admin.com', NULL, 1, CAST(N'2019-02-08 13:16:22.630' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (9, N'admin@admin.com', N'Admin', 0, CAST(N'2019-02-08 16:22:36.183' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (10, N'admin@admin.com', NULL, 1, CAST(N'2019-02-08 16:44:48.657' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (11, N'p1@p1.com', NULL, 1, CAST(N'2019-02-08 16:47:03.237' AS DateTime), N'::1')
GO
INSERT [dbo].[LoginAttempts] ([Id], [Email], [Password], [IsPassed], [AttemptDateTime], [IpAddress]) VALUES (12, N'd1@d1.com', NULL, 1, CAST(N'2019-02-08 16:48:03.073' AS DateTime), N'::1')
GO
SET IDENTITY_INSERT [dbo].[LoginAttempts] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

GO
INSERT [dbo].[Messages] ([Id], [Text], [DoctorId], [PatientId], [FromPatient]) VALUES (1, N'This is Patient 1', 1, 1, 1)
GO
INSERT [dbo].[Messages] ([Id], [Text], [DoctorId], [PatientId], [FromPatient]) VALUES (2, N'hello doctor
', 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (1, N'Flu', N'Engineer', CAST(N'2017-06-18 10:34:09.000' AS DateTime), CAST(N'10:34:09' AS Time), NULL, N'Admitted', 2)
GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (2, N'Flu', N'Engineer', CAST(N'2017-02-18 10:34:09.000' AS DateTime), CAST(N'10:34:09' AS Time), NULL, N'Admitted', 3)
GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (3, N'Flu', N'Engineer', CAST(N'2017-06-18 10:34:09.000' AS DateTime), CAST(N'10:34:09' AS Time), NULL, N'Admitted', 4)
GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (4, N'Flu', N'Engineer', CAST(N'2017-02-18 10:34:09.000' AS DateTime), CAST(N'10:34:09' AS Time), NULL, N'Admitted', 5)
GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (5, N'Flu', N'Engineer', CAST(N'2017-06-18 10:34:09.000' AS DateTime), CAST(N'10:34:09' AS Time), NULL, N'Admitted', 6)
GO
INSERT [dbo].[Patients] ([Id], [Disease], [Occupation], [EntryDate], [EntryTime], [EntryDateStr], [Status], [User_Id]) VALUES (6, NULL, NULL, CAST(N'2019-02-07 19:29:46.970' AS DateTime), CAST(N'19:29:47.2097179' AS Time), NULL, N'Admitted', 8)
GO
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Patient')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Caregiver')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'Doctor')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (1, N'admin@admin.com', N'8C6976E5B5410415BDE908BD4DEE15DFB167A9C873FC4BB8A81F6F2AB448A918', N'', N'admin', 35, N'Male', N'Admin NRIC', N'', N'Address', N'+6591548630', N'Admin', NULL, NULL, NULL, 0, CAST(N'2019-02-08 16:44:48.463' AS DateTime), NULL, NULL, 2, 1)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (2, N'p1@p1.com', N'patient', NULL, N'patient', 25, N'Female', N'Patient NRIC', N'', N'Address', N'48572947', N'Imran', N'7458150f-4cf9-40b8-b0fe-ef4b64d28fa7', N'eUqC3OEa', CAST(N'2019-02-08 13:07:30.740' AS DateTime), 1, CAST(N'2019-02-08 16:47:03.020' AS DateTime), NULL, NULL, 1, 2)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (3, N'p2@p2.com', N'patient', NULL, N'patient', 25, N'Male', N'Patient NRIC', N'', N'Address', N'48572947', N'P1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (4, N'p3@p3.com', N'patient', NULL, N'patient', 25, N'Female', N'Patient NRIC', N'', N'Address', N'48572947', N'P3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (5, N'p4@p2.com', N'patient', NULL, N'patient', 25, N'Male', N'Patient NRIC', N'', N'Address', N'48572947', N'P4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (6, N'p5@p5.com', N'patient', NULL, N'patient', 25, N'Female', N'Patient NRIC', N'', N'Address', N'48572947', N'P5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (7, N'd1@d1.com', N'doctor', NULL, N'd', 25, N'Female', N'Doctor NRIC', N'', N'Address', N'48572947', N'Doctor', NULL, NULL, NULL, 1, CAST(N'2019-02-08 16:48:02.970' AS DateTime), NULL, NULL, NULL, 4)
GO
INSERT [dbo].[Users] ([Id], [Email], [Password], [Salt], [UserName], [Age], [Gender], [NRIC], [Comments], [Address], [ContactNo], [FullName], [Token], [OTP], [OTPExpiration], [IsLogin], [LastLogin], [IsEnabled], [EnableToken], [LoginAttemptCount], [Role_Id]) VALUES (8, N'hello@123.com', N'2B1803278A240429DBE5D27F76580EC73C2D206AAF3C39013A2A2AA9D0F5DFD4', N'FeS3If2rD4', NULL, NULL, N'Male', NULL, NULL, NULL, N'8585858585', NULL, NULL, NULL, NULL, 1, CAST(N'2019-02-07 19:32:47.803' AS DateTime), 1, NULL, 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_FK_PatientCaregiver]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PatientCaregiver] ON [dbo].[Caregivers]
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserCaregiver]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserCaregiver] ON [dbo].[Caregivers]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserDoctor]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserDoctor] ON [dbo].[Doctors]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserEvent]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserEvent] ON [dbo].[Events]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DoctorMessage]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_DoctorMessage] ON [dbo].[Messages]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PatientMessage]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PatientMessage] ON [dbo].[Messages]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserPatient]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserPatient] ON [dbo].[Patients]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserRole]    Script Date: 02/08/2019 6:40:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserRole] ON [dbo].[Users]
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Caregivers]  WITH CHECK ADD  CONSTRAINT [FK_PatientCaregiver] FOREIGN KEY([Patient_Id])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Caregivers] CHECK CONSTRAINT [FK_PatientCaregiver]
GO
ALTER TABLE [dbo].[Caregivers]  WITH CHECK ADD  CONSTRAINT [FK_UserCaregiver] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Caregivers] CHECK CONSTRAINT [FK_UserCaregiver]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_UserDoctor] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_UserDoctor]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_UserEvent] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_UserEvent]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_DoctorMessage] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_DoctorMessage]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_PatientMessage] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_PatientMessage]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_UserPatient] FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_UserPatient]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_UserRole] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_UserRole]
GO
USE [master]
GO
ALTER DATABASE [HospitalManagement] SET  READ_WRITE 
GO
