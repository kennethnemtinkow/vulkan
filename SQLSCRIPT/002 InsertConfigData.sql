USE [VulkanConfig]
GO
SET IDENTITY_INSERT [vulkan].[BaseInformation] ON 

GO
INSERT [vulkan].[BaseInformation] ([ID], [SubSystemName], [SubSystemNameDescription]) VALUES (1, N'VulkanDemo1', N'VulkanDemo1')
GO
INSERT [vulkan].[BaseInformation] ([ID], [SubSystemName], [SubSystemNameDescription]) VALUES (2, N'VulkanDemoFull', N'VulkanDemoFull')
GO
INSERT [vulkan].[BaseInformation] ([ID], [SubSystemName], [SubSystemNameDescription]) VALUES (3, N'VulkanDemoPartial', N'VulkanDemoPartial')
GO
INSERT [vulkan].[BaseInformation] ([ID], [SubSystemName], [SubSystemNameDescription]) VALUES (4, N'VulkanDemoPartition', N'VulkanDemoPartition')
GO
SET IDENTITY_INSERT [vulkan].[BaseInformation] OFF
GO
SET IDENTITY_INSERT [vulkan].[BackupRestorePartialDatabaseConfiguration] ON 

GO
INSERT [vulkan].[BackupRestorePartialDatabaseConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [BackupFilePathBakFileDestinationServer], [FullOrPartialBackup], [Active], [RecoverModeDestinationDatabase]) VALUES (3, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'F:/Backup/', N'Partial', N'y', N'SIMPLE')
GO
SET IDENTITY_INSERT [vulkan].[BackupRestorePartialDatabaseConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[BaseConfiguration] ON 

GO
INSERT [vulkan].[BaseConfiguration] ([ID], [SubSystemName], [SourceServer], [DestinationServer], [SourceDatabase], [DestinationDatabase], [RecoverModeSourceServer], [RecoverModeDestinationServer], [FullOrPartialBackup], [FilePathBakFileSourceServer], [FilePathBakFileDestinationServer], [FilePathBakFileDestinationServerRemoteAccess], [CopyBackupFileToDestinationServer], [DeleteBackupFileOnSourceServer], [DeleteBackupFileOnDestinationServer], [Active]) VALUES (3, N'VulkanDemoFull', N'VulkanDemoProd', N'VulkanDemoTest', N'VulkanProd', N'VulkanProd', N'FULL', N'FULL', N'Full', N'F:\VulkanBackup\', N'W:\', N'\\VulkanDemoProd\VulkanBackup\', N'n', N'y', N'n', N'y')
GO
INSERT [vulkan].[BaseConfiguration] ([ID], [SubSystemName], [SourceServer], [DestinationServer], [SourceDatabase], [DestinationDatabase], [RecoverModeSourceServer], [RecoverModeDestinationServer], [FullOrPartialBackup], [FilePathBakFileSourceServer], [FilePathBakFileDestinationServer], [FilePathBakFileDestinationServerRemoteAccess], [CopyBackupFileToDestinationServer], [DeleteBackupFileOnSourceServer], [DeleteBackupFileOnDestinationServer], [Active]) VALUES (4, N'VulkanDemoPartial', N'VulkanDemoProd', N'VulkanDemoTest', N'VulkanProd', N'VulkanProd', N'Simple', N'Simple', N'Partial', N'F:\VulkanBackup\', N'W:\', N'\\VulkanDemoProd\VulkanBackup\', N'n', N'n', N'n', N'y')
GO
INSERT [vulkan].[BaseConfiguration] ([ID], [SubSystemName], [SourceServer], [DestinationServer], [SourceDatabase], [DestinationDatabase], [RecoverModeSourceServer], [RecoverModeDestinationServer], [FullOrPartialBackup], [FilePathBakFileSourceServer], [FilePathBakFileDestinationServer], [FilePathBakFileDestinationServerRemoteAccess], [CopyBackupFileToDestinationServer], [DeleteBackupFileOnSourceServer], [DeleteBackupFileOnDestinationServer], [Active]) VALUES (5, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanDemoTest', N'VulkanProd', N'VulkanProd', N'Simple', N'Simple', N'Partial', N'F:\VulkanBackup\', N'W:\', N'\\VulkanDemoProd\VulkanBackup\', N'n', N'y', N'n', N'y')
GO
SET IDENTITY_INSERT [vulkan].[BaseConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[DatabaseFilesConfiguration] ON 

GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (31, N'VulkanDemoFull', N'VulkanProd', N'PRIMARY', N'Datafile', N'F:\Data\VulkanProd.mdf', N'VulkanProd', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (32, N'VulkanDemoFull', N'VulkanProd', N'Not Applicable', N'Logfile', N'F:\Log\VulkanProd_log.ldf', N'VulkanProd_log', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (33, N'VulkanDemoFull', N'VulkanProd', N'LoggGroup', N'Datafile', N'F:\Data\LoggGroup.ndf', N'LoggGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (34, N'VulkanDemoFull', N'VulkanProd', N'MainDataGroup', N'Datafile', N'F:\Data\MainDataGroup.ndf', N'MainDataGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (35, N'VulkanDemoFull', N'VulkanProd', N'MainIndexGroup', N'Datafile', N'F:\Data\MainIndexGroup.ndf', N'MainIndexGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (36, N'VulkanDemoFull', N'VulkanProd', N'FG2009', N'Datafile', N'F:\Data\VulkanProdFG2009.ndf', N'FG2009', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (37, N'VulkanDemoFull', N'VulkanProd', N'FG2010', N'Datafile', N'F:\Data\VulkanProdFG2010.ndf', N'FG2010', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (38, N'VulkanDemoFull', N'VulkanProd', N'FG2011', N'Datafile', N'F:\Data\VulkanProdFG2011.ndf', N'FG2011', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (39, N'VulkanDemoFull', N'VulkanProd', N'FG2012', N'Datafile', N'F:\Data\VulkanProdFG2012.ndf', N'FG2012', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (40, N'VulkanDemoFull', N'VulkanProd', N'FG2013', N'Datafile', N'F:\Data\VulkanProdFG2013.ndf', N'FG2013', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (41, N'VulkanDemoFull', N'VulkanProd', N'FG2014', N'Datafile', N'F:\Data\VulkanProdFG2014.ndf', N'FG2014', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (42, N'VulkanDemoFull', N'VulkanProd', N'FG2015', N'Datafile', N'F:\Data\VulkanProdFG2015.ndf', N'FG2015', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (43, N'VulkanDemoFull', N'VulkanProd', N'FG2016', N'Datafile', N'F:\Data\VulkanProdFG2016.ndf', N'FG2016', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (44, N'VulkanDemoFull', N'VulkanProd', N'FG2017', N'Datafile', N'F:\Data\VulkanProdFG2017.ndf', N'FG2017', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (45, N'VulkanDemoFull', N'VulkanProd', N'FG2018', N'Datafile', N'F:\Data\VulkanProdFG2018.ndf', N'FG2018', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (46, N'VulkanDemoFull', N'VulkanProd', N'FG2019', N'Datafile', N'F:\Data\VulkanProdFG2019.ndf', N'FG2019', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (47, N'VulkanDemoFull', N'VulkanProd', N'FG2020', N'Datafile', N'F:\Data\VulkanProdFG2020.ndf', N'FG2020', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (48, N'VulkanDemoFull', N'VulkanProd', N'FG2021', N'Datafile', N'F:\Data\VulkanProdFG2021.ndf', N'FG2021', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (49, N'VulkanDemoFull', N'VulkanProd', N'FG2022', N'Datafile', N'F:\Data\VulkanProdFG2022.ndf', N'FG2022', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (50, N'VulkanDemoFull', N'VulkanProd', N'FG2023', N'Datafile', N'F:\Data\VulkanProdFG2023.ndf', N'FG2023', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (51, N'VulkanDemoFull', N'VulkanProd', N'FG2024', N'Datafile', N'F:\Data\VulkanProdFG2024.ndf', N'FG2024', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (52, N'VulkanDemoFull', N'VulkanProd', N'FG2025', N'Datafile', N'F:\Data\VulkanProdFG2025.ndf', N'FG2025', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (53, N'VulkanDemoFull', N'VulkanProd', N'FG2002', N'Datafile', N'F:\Data\VulkanProdFG2002.ndf', N'FG2002', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (54, N'VulkanDemoFull', N'VulkanProd', N'FG2003', N'Datafile', N'F:\Data\VulkanProdFG2003.ndf', N'FG2003', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (55, N'VulkanDemoFull', N'VulkanProd', N'FG2004', N'Datafile', N'F:\Data\VulkanProdFG2004.ndf', N'FG2004', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (56, N'VulkanDemoFull', N'VulkanProd', N'FG2005', N'Datafile', N'F:\Data\VulkanProdFG2005.ndf', N'FG2005', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (57, N'VulkanDemoFull', N'VulkanProd', N'FG2006', N'Datafile', N'F:\Data\VulkanProdFG2006.ndf', N'FG2006', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (58, N'VulkanDemoFull', N'VulkanProd', N'FG2007', N'Datafile', N'F:\Data\VulkanProdFG2007.ndf', N'FG2007', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (59, N'VulkanDemoFull', N'VulkanProd', N'FG2008', N'Datafile', N'F:\Data\VulkanProdFG2008.ndf', N'FG2008', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (60, N'VulkanDemoPartial', N'VulkanProd', N'PRIMARY', N'Datafile', N'F:\Data\VulkanProd.mdf', N'VulkanProd', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (61, N'VulkanDemoPartial', N'VulkanProd', N'Not Applicable', N'Logfile', N'F:\Log\VulkanProd_log.ldf', N'VulkanProd_log', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (63, N'VulkanDemoPartial', N'VulkanProd', N'MainDataGroup', N'Datafile', N'F:\Data\MainDataGroup.ndf', N'MainDataGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (64, N'VulkanDemoPartial', N'VulkanProd', N'MainIndexGroup', N'Datafile', N'F:\Data\MainIndexGroup.ndf', N'MainIndexGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (65, N'VulkanDemoPartial', N'VulkanProd', N'FG2009', N'Datafile', N'F:\Data\VulkanProdFG2009.ndf', N'FG2009', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (66, N'VulkanDemoPartial', N'VulkanProd', N'FG2010', N'Datafile', N'F:\Data\VulkanProdFG2010.ndf', N'FG2010', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (67, N'VulkanDemoPartial', N'VulkanProd', N'FG2011', N'Datafile', N'F:\Data\VulkanProdFG2011.ndf', N'FG2011', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (68, N'VulkanDemoPartial', N'VulkanProd', N'FG2012', N'Datafile', N'F:\Data\VulkanProdFG2012.ndf', N'FG2012', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (69, N'VulkanDemoPartial', N'VulkanProd', N'FG2013', N'Datafile', N'F:\Data\VulkanProdFG2013.ndf', N'FG2013', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (70, N'VulkanDemoPartial', N'VulkanProd', N'FG2014', N'Datafile', N'F:\Data\VulkanProdFG2014.ndf', N'FG2014', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (71, N'VulkanDemoPartial', N'VulkanProd', N'FG2015', N'Datafile', N'F:\Data\VulkanProdFG2015.ndf', N'FG2015', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (72, N'VulkanDemoPartial', N'VulkanProd', N'FG2016', N'Datafile', N'F:\Data\VulkanProdFG2016.ndf', N'FG2016', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (73, N'VulkanDemoPartial', N'VulkanProd', N'FG2017', N'Datafile', N'F:\Data\VulkanProdFG2017.ndf', N'FG2017', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (74, N'VulkanDemoPartial', N'VulkanProd', N'FG2018', N'Datafile', N'F:\Data\VulkanProdFG2018.ndf', N'FG2018', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (75, N'VulkanDemoPartial', N'VulkanProd', N'FG2019', N'Datafile', N'F:\Data\VulkanProdFG2019.ndf', N'FG2019', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (76, N'VulkanDemoPartial', N'VulkanProd', N'FG2020', N'Datafile', N'F:\Data\VulkanProdFG2020.ndf', N'FG2020', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (77, N'VulkanDemoPartial', N'VulkanProd', N'FG2021', N'Datafile', N'F:\Data\VulkanProdFG2021.ndf', N'FG2021', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (78, N'VulkanDemoPartial', N'VulkanProd', N'FG2022', N'Datafile', N'F:\Data\VulkanProdFG2022.ndf', N'FG2022', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (79, N'VulkanDemoPartial', N'VulkanProd', N'FG2023', N'Datafile', N'F:\Data\VulkanProdFG2023.ndf', N'FG2023', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (80, N'VulkanDemoPartial', N'VulkanProd', N'FG2024', N'Datafile', N'F:\Data\VulkanProdFG2024.ndf', N'FG2024', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (81, N'VulkanDemoPartial', N'VulkanProd', N'FG2025', N'Datafile', N'F:\Data\VulkanProdFG2025.ndf', N'FG2025', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (82, N'VulkanDemoPartial', N'VulkanProd', N'FG2002', N'Datafile', N'F:\Data\VulkanProdFG2002.ndf', N'FG2002', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (83, N'VulkanDemoPartial', N'VulkanProd', N'FG2003', N'Datafile', N'F:\Data\VulkanProdFG2003.ndf', N'FG2003', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (84, N'VulkanDemoPartial', N'VulkanProd', N'FG2004', N'Datafile', N'F:\Data\VulkanProdFG2004.ndf', N'FG2004', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (85, N'VulkanDemoPartial', N'VulkanProd', N'FG2005', N'Datafile', N'F:\Data\VulkanProdFG2005.ndf', N'FG2005', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (86, N'VulkanDemoPartial', N'VulkanProd', N'FG2006', N'Datafile', N'F:\Data\VulkanProdFG2006.ndf', N'FG2006', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (87, N'VulkanDemoPartial', N'VulkanProd', N'FG2007', N'Datafile', N'F:\Data\VulkanProdFG2007.ndf', N'FG2007', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (88, N'VulkanDemoPartial', N'VulkanProd', N'FG2008', N'Datafile', N'F:\Data\VulkanProdFG2008.ndf', N'FG2008', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (89, N'VulkanDemoPartition', N'VulkanProd', N'PRIMARY', N'Datafile', N'F:\Data\VulkanProd.mdf', N'VulkanProd', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (90, N'VulkanDemoPartition', N'VulkanProd', N'Not Applicable', N'Logfile', N'F:\Log\VulkanProd_log.ldf', N'VulkanProd_log', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (91, N'VulkanDemoPartition', N'VulkanProd', N'MainDataGroup', N'Datafile', N'F:\Data\MainDataGroup.ndf', N'MainDataGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (92, N'VulkanDemoPartition', N'VulkanProd', N'MainIndexGroup', N'Datafile', N'F:\Data\MainIndexGroup.ndf', N'MainIndexGroup', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (100, N'VulkanDemoPartition', N'VulkanProd', N'FG2016', N'Datafile', N'F:\Data\VulkanProdFG2016.ndf', N'FG2016', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (101, N'VulkanDemoPartition', N'VulkanProd', N'FG2017', N'Datafile', N'F:\Data\VulkanProdFG2017.ndf', N'FG2017', N'y')
GO
INSERT [vulkan].[DatabaseFilesConfiguration] ([ID], [SubSystemName], [Database], [FileGroupsToBackupRestore], [Type], [FilePathDestination], [LogicalName], [Active]) VALUES (117, N'VulkanDemoPartition', N'VulkanProd', N'FG2015', N'Datafile', N'F:\Data\VulkanProdFG2015.ndf', N'FG2015', N'y')
GO
SET IDENTITY_INSERT [vulkan].[DatabaseFilesConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[MergeConfiguration] ON 

GO
INSERT [vulkan].[MergeConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [PartitionFunction], [Range], [Order], [Active]) VALUES (1, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'IntRange_pf', N'20160101', N'2', N'y')
GO
INSERT [vulkan].[MergeConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [PartitionFunction], [Range], [Order], [Active]) VALUES (2, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'IntRange_pf', N'20170101', N'1', N'y')
GO
INSERT [vulkan].[MergeConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [PartitionFunction], [Range], [Order], [Active]) VALUES (3, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'DateTimeRange_pf', N'''2016-01-01 00:00:00''', N'2', N'y')
GO
INSERT [vulkan].[MergeConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [PartitionFunction], [Range], [Order], [Active]) VALUES (4, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'DateTimeRange_pf', N'''2017-01-01 00:00:00''', N'1', N'y')
GO
SET IDENTITY_INSERT [vulkan].[MergeConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[NonClustedIndexProcessConfiguration] ON 

GO
INSERT [vulkan].[NonClustedIndexProcessConfiguration] ([ID], [SubSystemName], [SourceServer], [SourceDatabase], [DestinationServer], [DestinationDatabase], [CurrentSchema], [CurrentTable], [RunDate], [DropIndexScript], [CreateIndexScript]) VALUES (1, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanProd', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTableModifiedDate', CAST(N'2017-06-17T19:48:28.0000000' AS DateTime2), N'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTableModifiedDate'') AND NAME =''NonClusteredIndexCarrierTrackingNumber'' )  DROP INDEX [NonClusteredIndexCarrierTrackingNumber] ON [dbo].[FactTableModifiedDate]', N' IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTableModifiedDate'') AND NAME =''NonClusteredIndexCarrierTrackingNumber'' ) 
 CREATE NONCLUSTERED INDEX [NonClusteredIndexCarrierTrackingNumber] ON [dbo].[FactTableModifiedDate] (  CarrierTrackingNumber ASC  )   INCLUDE ( ProductID , SpecialOfferID )  WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  ) ON [MainIndexGroup] ')
GO
INSERT [vulkan].[NonClustedIndexProcessConfiguration] ([ID], [SubSystemName], [SourceServer], [SourceDatabase], [DestinationServer], [DestinationDatabase], [CurrentSchema], [CurrentTable], [RunDate], [DropIndexScript], [CreateIndexScript]) VALUES (2, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanProd', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTableModifiedDate', CAST(N'2017-06-17T19:48:28.0000000' AS DateTime2), N'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTableModifiedDate'') AND NAME =''NonClusteredIndexSalesOrderDetailID'' )  DROP INDEX [NonClusteredIndexSalesOrderDetailID] ON [dbo].[FactTableModifiedDate]', N' IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTableModifiedDate'') AND NAME =''NonClusteredIndexSalesOrderDetailID'' ) 
 CREATE NONCLUSTERED INDEX [NonClusteredIndexSalesOrderDetailID] ON [dbo].[FactTableModifiedDate] (  SalesOrderDetailID ASC  , UnitPrice ASC  )   WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  ) ON [MainIndexGroup] ')
GO
INSERT [vulkan].[NonClustedIndexProcessConfiguration] ([ID], [SubSystemName], [SourceServer], [SourceDatabase], [DestinationServer], [DestinationDatabase], [CurrentSchema], [CurrentTable], [RunDate], [DropIndexScript], [CreateIndexScript]) VALUES (3, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanProd', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTablePeriod', CAST(N'2017-06-17T19:48:28.0000000' AS DateTime2), N'IF EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTablePeriod'') AND NAME =''NonClusteredIndex'' )  DROP INDEX [NonClusteredIndex] ON [dbo].[FactTablePeriod]', N' IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = object_id(''dbo.FactTablePeriod'') AND NAME =''NonClusteredIndex'' ) 
 CREATE NONCLUSTERED INDEX [NonClusteredIndex] ON [dbo].[FactTablePeriod] (  CarrierTrackingNumber ASC  )   WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  ) ON [MainIndexGroup] ')
GO
SET IDENTITY_INSERT [vulkan].[NonClustedIndexProcessConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[PartitionedTablesConfiguration] ON 

GO
INSERT [vulkan].[PartitionedTablesConfiguration] ([ID], [SubSystemName], [SourceServer], [SourceDatabase], [DestinationServer], [DestinationDatabase], [schema], [Table], [Active]) VALUES (1, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanProd', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTableModifiedDate', N'y')
GO
INSERT [vulkan].[PartitionedTablesConfiguration] ([ID], [SubSystemName], [SourceServer], [SourceDatabase], [DestinationServer], [DestinationDatabase], [schema], [Table], [Active]) VALUES (2, N'VulkanDemoPartition', N'VulkanDemoProd', N'VulkanProd', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTablePeriod', N'y')
GO
SET IDENTITY_INSERT [vulkan].[PartitionedTablesConfiguration] OFF
GO
SET IDENTITY_INSERT [vulkan].[SwitchConfiguration] ON 

GO
INSERT [vulkan].[SwitchConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [schema], [Table], [CurrentFileGroup], [Active]) VALUES (1, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTableModifiedDate', N'FG2015', N'y')
GO
INSERT [vulkan].[SwitchConfiguration] ([ID], [SubSystemName], [DestinationServer], [DestinationDatabase], [schema], [Table], [CurrentFileGroup], [Active]) VALUES (2, N'VulkanDemoPartition', N'VulkanDemoTest', N'VulkanProd', N'dbo', N'FactTablePeriod', N'FG2015', N'y')
GO
SET IDENTITY_INSERT [vulkan].[SwitchConfiguration] OFF
GO
