USE [master]
GO
/****** Object:  Database [VulkanConfig]    Script Date: 6/17/2017 8:34:43 PM ******/
CREATE DATABASE [VulkanConfig]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VulkanConfig', FILENAME = N'F:\Data\VulkanConfig.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VulkanConfig_log', FILENAME = N'F:\Log\VulkanConfig_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VulkanConfig] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VulkanConfig].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VulkanConfig] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VulkanConfig] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VulkanConfig] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VulkanConfig] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VulkanConfig] SET ARITHABORT OFF 
GO
ALTER DATABASE [VulkanConfig] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VulkanConfig] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VulkanConfig] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VulkanConfig] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VulkanConfig] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VulkanConfig] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VulkanConfig] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VulkanConfig] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VulkanConfig] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VulkanConfig] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VulkanConfig] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VulkanConfig] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VulkanConfig] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VulkanConfig] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VulkanConfig] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VulkanConfig] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VulkanConfig] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VulkanConfig] SET RECOVERY FULL 
GO
ALTER DATABASE [VulkanConfig] SET  MULTI_USER 
GO
ALTER DATABASE [VulkanConfig] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VulkanConfig] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VulkanConfig] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VulkanConfig] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VulkanConfig] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VulkanConfig', N'ON'
GO
ALTER DATABASE [VulkanConfig] SET QUERY_STORE = OFF
GO
USE [VulkanConfig]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [VulkanConfig]
GO
/****** Object:  Schema [vulkan]    Script Date: 6/17/2017 8:34:43 PM ******/
CREATE SCHEMA [vulkan]
GO
/****** Object:  Table [vulkan].[BackupRestorePartialDatabaseConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[BackupRestorePartialDatabaseConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[BackupFilePathBakFileDestinationServer] [nvarchar](255) NULL,
	[FullOrPartialBackup] [nvarchar](255) NULL,
	[Active] [nchar](1) NULL,
	[RecoverModeDestinationDatabase] [nvarchar](255) NULL,
 CONSTRAINT [PK_BackupRestorePartialDatabaseConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [vulkan].[BaseConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[BaseConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[SourceServer] [nvarchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[SourceDatabase] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[RecoverModeSourceServer] [nvarchar](255) NULL,
	[RecoverModeDestinationServer] [nvarchar](255) NULL,
	[FullOrPartialBackup] [nvarchar](255) NULL,
	[FilePathBakFileSourceServer] [nvarchar](255) NULL,
	[FilePathBakFileDestinationServer] [nvarchar](255) NULL,
	[FilePathBakFileDestinationServerRemoteAccess] [nvarchar](255) NULL,
	[CopyBackupFileToDestinationServer] [nchar](1) NULL,
	[DeleteBackupFileOnSourceServer] [nvarchar](1) NULL,
	[DeleteBackupFileOnDestinationServer] [nvarchar](1) NULL,
	[Active] [nchar](1) NULL,
 CONSTRAINT [PK_BaseConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [vulkan].[BaseInformation]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[BaseInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NOT NULL,
	[SubSystemNameDescription] [nvarchar](1000) NULL,
 CONSTRAINT [PK_BaseInformation] PRIMARY KEY CLUSTERED 
(
	[SubSystemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [vulkan].[DatabaseFilesConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[DatabaseFilesConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[Database] [nvarchar](255) NULL,
	[FileGroupsToBackupRestore] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[FilePathDestination] [nvarchar](255) NULL,
	[LogicalName] [nvarchar](255) NULL,
	[Active] [nchar](1) NULL,
 CONSTRAINT [PK_DatabaseFilesConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [vulkan].[MergeConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [vulkan].[MergeConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[PartitionFunction] [nvarchar](255) NULL,
	[Range] [nvarchar](255) NULL,
	[Order] [nvarchar](255) NULL,
	[Active] [char](1) NULL,
 CONSTRAINT [PK_MergeConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [vulkan].[NonClustedIndexProcessConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[NonClustedIndexProcessConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[SourceServer] [nvarchar](255) NULL,
	[SourceDatabase] [nvarchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[CurrentSchema] [nvarchar](255) NULL,
	[CurrentTable] [nvarchar](255) NULL,
	[RunDate] [datetime2](7) NULL,
	[DropIndexScript] [nvarchar](max) NULL,
	[CreateIndexScript] [nvarchar](max) NULL,
 CONSTRAINT [PK_NonClustedIndexProcessConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [vulkan].[PartitionedTablesConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [vulkan].[PartitionedTablesConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[SourceServer] [nvarchar](255) NULL,
	[SourceDatabase] [varchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[schema] [nvarchar](255) NULL,
	[Table] [nvarchar](255) NULL,
	[Active] [nchar](1) NULL,
 CONSTRAINT [PK_PartitionedTablesConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [vulkan].[SwitchConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [vulkan].[SwitchConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubSystemName] [nvarchar](255) NULL,
	[DestinationServer] [nvarchar](255) NULL,
	[DestinationDatabase] [nvarchar](255) NULL,
	[schema] [nvarchar](255) NULL,
	[Table] [nvarchar](255) NULL,
	[CurrentFileGroup] [nvarchar](255) NULL,
	[Active] [nchar](1) NULL,
 CONSTRAINT [PK_SwitchConfiguration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [vulkan].[BackupRestorePartialDatabaseConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_BackupRestorePartialDatabaseConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[BackupRestorePartialDatabaseConfiguration] CHECK CONSTRAINT [FK_BackupRestorePartialDatabaseConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_BaseConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [FK_BaseConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[DatabaseFilesConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_DatabaseFilesConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[DatabaseFilesConfiguration] CHECK CONSTRAINT [FK_DatabaseFilesConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[MergeConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_MergeConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[MergeConfiguration] CHECK CONSTRAINT [FK_MergeConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[NonClustedIndexProcessConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_NonClustedIndexProcessConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[NonClustedIndexProcessConfiguration] CHECK CONSTRAINT [FK_NonClustedIndexProcessConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[PartitionedTablesConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_PartitionedTablesConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[PartitionedTablesConfiguration] CHECK CONSTRAINT [FK_PartitionedTablesConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[SwitchConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_SwitchConfiguration_BaseInformation] FOREIGN KEY([SubSystemName])
REFERENCES [vulkan].[BaseInformation] ([SubSystemName])
GO
ALTER TABLE [vulkan].[SwitchConfiguration] CHECK CONSTRAINT [FK_SwitchConfiguration_BaseInformation]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_DeleteBackupFileOnDestinationServer] CHECK  (([DeleteBackupFileOnDestinationServer]='n' OR [DeleteBackupFileOnDestinationServer]='y'))
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [CK_DeleteBackupFileOnDestinationServer]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_DeleteBackupFileOnSourceServer] CHECK  (([DeleteBackupFileOnSourceServer]='n' OR [DeleteBackupFileOnSourceServer]='y'))
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [CK_DeleteBackupFileOnSourceServer]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_FullOrPartial] CHECK  (([FullOrPartialBackup]='Full' OR [FullOrPartialBackup]='Partial'))
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [CK_FullOrPartial]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_RecoverModeDestinationServer] CHECK  (([RecoverModeDestinationServer]='Full' OR [RecoverModeDestinationServer]='Simple'))
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [CK_RecoverModeDestinationServer]
GO
ALTER TABLE [vulkan].[BaseConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_RecoverModeSourceServer] CHECK  (([RecoverModeSourceServer]='Full' OR [RecoverModeSourceServer]='Simple'))
GO
ALTER TABLE [vulkan].[BaseConfiguration] CHECK CONSTRAINT [CK_RecoverModeSourceServer]
GO
ALTER TABLE [vulkan].[DatabaseFilesConfiguration]  WITH CHECK ADD  CONSTRAINT [CK_Type] CHECK  (([Type]='Logfile' OR [Type]='Datafile'))
GO
ALTER TABLE [vulkan].[DatabaseFilesConfiguration] CHECK CONSTRAINT [CK_Type]
GO
/****** Object:  StoredProcedure [vulkan].[AddBaseConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [vulkan].[AddBaseConfiguration]
(
			@SubSystemName									NVARCHAR(200)										
           ,@SourceServer									NVARCHAR(200)
           ,@DestinationServer								NVARCHAR(200)
           ,@SourceDatabase									NVARCHAR(200)
           ,@DestinationDatabase							NVARCHAR(200)
           ,@RecoverModeSourceServer						NVARCHAR(200)
           ,@RecoverModeDestinationServer					NVARCHAR(200)
           ,@FullOrPartialBackup							NVARCHAR(200)
           ,@FilePathBakFileSourceServer					NVARCHAR(200)
           ,@FilePathBakFileDestinationServer				NVARCHAR(200)
           ,@FilePathBakFileDestinationServerRemoteAccess	NVARCHAR(200)
		   ,@CopyBackupFileToDestinationServer				NVARCHAR(200)
           ,@DeleteBackupFileOnSourceServer					NVARCHAR(1)
           ,@DeleteBackupFileOnDestinationServer  			NVARCHAR(1)	
		   ,@Active											NVARCHAR(1)				

)
AS
  BEGIN

INSERT INTO [vulkan].[BaseConfiguration]
           ([SubSystemName]
           ,[SourceServer]
           ,[DestinationServer]
           ,[SourceDatabase]
           ,[DestinationDatabase]
           ,[RecoverModeSourceServer]
           ,[RecoverModeDestinationServer]
           ,[FullOrPartialBackup]
           ,[FilePathBakFileSourceServer]
           ,[FilePathBakFileDestinationServer]
           ,[FilePathBakFileDestinationServerRemoteAccess]
		   ,[CopyBackupFileToDestinationServer]
           ,[DeleteBackupFileOnSourceServer]
           ,[DeleteBackupFileOnDestinationServer]
		   ,[Active])
     VALUES
           (
		  	@SubSystemName									
		     ,@SourceServer									 
		     ,@DestinationServer								 
		     ,@SourceDatabase									
		     ,@DestinationDatabase							
		     ,@RecoverModeSourceServer						
		     ,@RecoverModeDestinationServer					
		     ,@FullOrPartialBackup							
		     ,@FilePathBakFileSourceServer					
		     ,@FilePathBakFileDestinationServer				
		     ,@FilePathBakFileDestinationServerRemoteAccess	
			 ,@CopyBackupFileToDestinationServer	
		     ,@DeleteBackupFileOnSourceServer					
		     ,@DeleteBackupFileOnDestinationServer
			 ,@Active  	
			 )
			 


END			 		


GO
/****** Object:  StoredProcedure [vulkan].[AddDatabaseFileGroupConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [vulkan].[AddDatabaseFileGroupConfiguration]
(
  @SubSystemName NVARCHAR(200)
, @Database NVARCHAR(200)
, @FileGroupsToBackupRestore NVARCHAR(200)
, @Type NVARCHAR(200)
, @FilePathDestination NVARCHAR(200)
, @LogicalName NVARCHAR(200)
, @Active NCHAR(1)

)
AS
  BEGIN

  INSERT INTO [vulkan].[DatabaseFilesConfiguration]
           ([SubSystemName]
           ,[Database]
           ,[FileGroupsToBackupRestore]
           ,[Type]
           ,[FilePathDestination]
           ,[LogicalName]
		    ,[Active])
     VALUES
           (
		    @SubSystemName	  	           -- Grouping Name of solution
           , @Database	 				   -- Name of database
           , @FileGroupsToBackupRestore    -- Name of FileGroup
           , @Type				           -- Type of file (Datafile / LogFile )
           , @FilePathDestination		   -- FilePathDestination
           , @LogicalName				   -- LogicalName
		   , @Active				
		   
		   )
END


GO
/****** Object:  StoredProcedure [vulkan].[AddMergeConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [vulkan].[AddMergeConfiguration]
(
 @SubSystemName 			NVARCHAR(255)
,@DestinationServer 		NVARCHAR(255)
,@DestinationDatabase 		NVARCHAR(255)
,@PartitionFunction 		NVARCHAR(255)
,@Range 					NVARCHAR(255)
,@Order 					NVARCHAR(255)
,@Active 					CHAR(1)
)
AS
  BEGIN

INSERT INTO [vulkan].[MergeConfiguration]
           (
		    [SubSystemName]
           ,[DestinationServer]
           ,[DestinationDatabase]
           ,[PartitionFunction]
           ,[Range]
           ,[Order]
           ,[Active]
		   )
    VALUES
           (
		    @SubSystemName 		
           ,@DestinationServer 	
           ,@DestinationDatabase 	
           ,@PartitionFunction 	
           ,@Range 				
           ,@Order 				
           ,@Active 				
		   )
END



GO
/****** Object:  StoredProcedure [vulkan].[AddPartitionedTablesConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [vulkan].[AddPartitionedTablesConfiguration]
(
            @SubSystemName				NVARCHAR(255)       
           ,@SourceServer				NVARCHAR(255)
           ,@SourceDatabase				NVARCHAR(255)
           ,@DestinationServer			NVARCHAR(255)
           ,@DestinationDatabase		NVARCHAR(255)
           ,@schema						NVARCHAR(255)
           ,@Table						NVARCHAR(255)
           ,@Active						NCHAR(1)
)
AS
  BEGIN

INSERT INTO [vulkan].[PartitionedTablesConfiguration]
           ([SubSystemName]
           ,[SourceServer]
           ,[SourceDatabase]
           ,[DestinationServer]
           ,[DestinationDatabase]
           ,[schema]
           ,[Table]
           ,[Active])
     VALUES
           (
		   @SubSystemName			
		  ,@SourceServer			
		  ,@SourceDatabase			
		  ,@DestinationServer		
		  ,@DestinationDatabase	
		  ,@schema					
		  ,@Table					
		  ,@Active					
		   )
END



GO
/****** Object:  StoredProcedure [vulkan].[AddSwitchConfiguration]    Script Date: 6/17/2017 8:34:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [vulkan].[AddSwitchConfiguration]
(

            @SubSystemName				NVARCHAR(255)
           ,@DestinationServer			NVARCHAR(255)
           ,@DestinationDatabase		NVARCHAR(255)
           ,@schema						NVARCHAR(255)
           ,@Table						NVARCHAR(255)
           ,@CurrentFileGroup			NVARCHAR(255)
           ,@Active						CHAR(1)
 					
)
AS
  BEGIN


INSERT INTO [vulkan].[SwitchConfiguration]
           (
		   
		    [SubSystemName]
           ,[DestinationServer]
           ,[DestinationDatabase]
           ,[schema]
           ,[Table]
           ,[CurrentFileGroup]
           ,[Active]
		   
		   )
     VALUES
           (
		 @SubSystemName		
		,@DestinationServer	   
		,@DestinationDatabase
		,@schema				
		,@Table				
		,@CurrentFileGroup	
		,@Active	
		)
		
		END	



GO
USE [master]
GO
ALTER DATABASE [VulkanConfig] SET  READ_WRITE 
GO
