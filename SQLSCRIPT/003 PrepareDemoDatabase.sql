

 


--******************
--1. CREATE OUR DEMO DATABASE
 
--******************


IF db_id('VulkanProd') IS NOT NULL 
BEGIN
	USE master; 
	ALTER DATABASE [VulkanProd] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [VulkanProd];
END 
GO

CREATE DATABASE [VulkanProd]
GO

ALTER DATABASE [VulkanProd]
	MODIFY FILE ( NAME = N'VulkanProd', SIZE = 256MB , MAXSIZE = 10GB , FILEGROWTH = 512MB );
ALTER DATABASE [VulkanProd]	
	MODIFY FILE ( NAME = N'VulkanProd_log', SIZE = 128MB , FILEGROWTH = 128MB );
GO


USE [master]
GO
ALTER DATABASE [VulkanProd] ADD FILEGROUP [LoggGroup]
GO
ALTER DATABASE [VulkanProd] ADD FILEGROUP [MainDataGroup]
GO
ALTER DATABASE [VulkanProd] ADD FILEGROUP [MainIndexGroup]
GO
 

 USE [master]
GO
ALTER DATABASE [VulkanProd] ADD FILE ( NAME = N'LoggGroup', FILENAME = N'F:\Data\LoggGroup.ndf' , SIZE = 262144KB , FILEGROWTH = 131072KB ) TO FILEGROUP [LoggGroup]
GO
ALTER DATABASE [VulkanProd] ADD FILE ( NAME = N'MainDataGroup', FILENAME = N'F:\Data\MainDataGroup.ndf' , SIZE = 262144KB , FILEGROWTH = 131072KB ) TO FILEGROUP [MainDataGroup]
GO
ALTER DATABASE [VulkanProd] ADD FILE ( NAME = N'MainIndexGroup', FILENAME = N'F:\Data\MainIndexGroup.ndf' , SIZE = 262144KB , FILEGROWTH = 131072KB ) TO FILEGROUP [MainIndexGroup]
GO


USE VulkanProd;
GO

 

--*******************************
--2 CREATE HELPER OBJECTS
 
--*******************************

--Create a schema for "partition helper" objects
CREATE SCHEMA [ph] AUTHORIZATION dbo;
GO

--Create a view to see partition information by filegroup
CREATE VIEW ph.FileGroupDetail
AS
SELECT  pf.name AS pf_name ,
        ps.name AS partition_scheme_name ,
        p.partition_number ,
        ds.name AS partition_filegroup ,
        pf.type_desc AS pf_type_desc ,
        pf.fanout AS pf_fanout ,
        pf.boundary_value_on_right ,
        OBJECT_NAME(si.object_id) AS object_name ,
        rv.value AS range_value ,
        SUM(CASE WHEN si.index_id IN ( 1, 0 ) THEN p.rows
                    ELSE 0
            END) AS num_rows ,
        SUM(dbps.reserved_page_count) * 8 / 1024. AS reserved_mb_all_indexes ,
        SUM(CASE ISNULL(si.index_id, 0)
                WHEN 0 THEN 0
                ELSE 1
            END) AS num_indexes
FROM    sys.destination_data_spaces AS dds
        JOIN sys.data_spaces AS ds ON dds.data_space_id = ds.data_space_id
        JOIN sys.partition_schemes AS ps ON dds.partition_scheme_id = ps.data_space_id
        JOIN sys.partition_functions AS pf ON ps.function_id = pf.function_id
        LEFT JOIN sys.partition_range_values AS rv ON pf.function_id = rv.function_id
                                                        AND dds.destination_id = CASE pf.boundary_value_on_right
                                                                                    WHEN 0 THEN rv.boundary_id
                                                                                    ELSE rv.boundary_id + 1
                                                                                END
        LEFT JOIN sys.indexes AS si ON dds.partition_scheme_id = si.data_space_id
        LEFT JOIN sys.partitions AS p ON si.object_id = p.object_id
                                            AND si.index_id = p.index_id
                                            AND dds.destination_id = p.partition_number
        LEFT JOIN sys.dm_db_partition_stats AS dbps ON p.object_id = dbps.object_id
                                                        AND p.partition_id = dbps.partition_id
GROUP BY ds.name ,
        p.partition_number ,
        pf.name ,
        pf.type_desc ,
        pf.fanout ,
        pf.boundary_value_on_right ,
        ps.name ,
        si.object_id ,
        rv.value;
GO

--Create a view to see partition information by object
CREATE VIEW ph.ObjectDetail	
AS
SELECT  SCHEMA_NAME(so.schema_id) AS schema_name ,
        OBJECT_NAME(p.object_id) AS object_name ,
        p.partition_number ,
        p.data_compression_desc ,
        dbps.row_count ,
        dbps.reserved_page_count * 8 / 1024. AS reserved_mb ,
        si.index_id ,
        CASE WHEN si.index_id = 0 THEN '(heap!)'
                ELSE si.name
        END AS index_name ,
        si.is_unique ,
        si.data_space_id ,
        mappedto.name AS mapped_to_name ,
        mappedto.type_desc AS mapped_to_type_desc ,
        partitionds.name AS partition_filegroup ,
        pf.name AS pf_name ,
        pf.type_desc AS pf_type_desc ,
        pf.fanout AS pf_fanout ,
        pf.boundary_value_on_right ,
        ps.name AS partition_scheme_name ,
        rv.value AS range_value
FROM    sys.partitions p
JOIN    sys.objects so
        ON p.object_id = so.object_id
            AND so.is_ms_shipped = 0
LEFT JOIN sys.dm_db_partition_stats AS dbps
        ON p.object_id = dbps.object_id
            AND p.partition_id = dbps.partition_id
JOIN    sys.indexes si
        ON p.object_id = si.object_id
            AND p.index_id = si.index_id
LEFT JOIN sys.data_spaces mappedto
        ON si.data_space_id = mappedto.data_space_id
LEFT JOIN sys.destination_data_spaces dds
        ON si.data_space_id = dds.partition_scheme_id
            AND p.partition_number = dds.destination_id
LEFT JOIN sys.data_spaces partitionds
        ON dds.data_space_id = partitionds.data_space_id
LEFT JOIN sys.partition_schemes AS ps
        ON dds.partition_scheme_id = ps.data_space_id
LEFT JOIN sys.partition_functions AS pf
        ON ps.function_id = pf.function_id
LEFT JOIN sys.partition_range_values AS rv
        ON pf.function_id = rv.function_id
            AND dds.destination_id = CASE pf.boundary_value_on_right
                                        WHEN 0 THEN rv.boundary_id
                                        ELSE rv.boundary_id + 1
                                    END
GO



 
SELECT name,type_desc, fanout, boundary_value_on_right, create_date 
FROM sys.partition_functions;
GO




--******************
--4. SET UP SOME FILEGROUPS and FILES FOR OUR PARTITIONS TO LIVE ON.
--In production they MIGHT be on different drives with the 
--appropriate RAID and spindles.
--******************

--Add filegroups.
--Number of filegroups = 1 + Number of boundary points 
--defined in partition function

ALTER DATABASE VulkanProd ADD FILEGROUP FG2002
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2003
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2004
GO
ALTER DATABASE VulkanProd ADD FILEGROUP FG2005
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2006
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2007
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2008
GO
ALTER DATABASE VulkanProd ADD FILEGROUP FG2009
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2010
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2011
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2012
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2013
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2014
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2015
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2016
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2017
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2018
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2019
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2020
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2021
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2022
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2023
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2024
GO 
ALTER DATABASE VulkanProd ADD FILEGROUP FG2025
GO


--Add files to the filegroups
--This is being done dynamically so it will work on different instances, 
--but it makes some big assumptions!
DECLARE @path NVARCHAR(256), @i INT=2002, @sql NVARCHAR(4000);
SELECT TOP 1 @path=LEFT(physical_name,LEN(physical_name)-4) 
FROM sys.database_files WHERE name='VulkanProd';


WHILE @i <= 2025
BEGIN
	SET @sql=N'ALTER DATABASE VulkanProd ADD FILE (name=FG' + CAST(@i AS NCHAR(4))+', 
		 filename=''' +  @path + N'FG'+ CAST(@i AS NCHAR(4))+'.ndf' + ''',
		 size=5MB, filegrowth=5MB) TO FILEGROUP FG'+CAST(@i AS NCHAR(4))
	--show the command we're running
	--RAISERROR (@sql,0,0)
	
	PRINT @sql
	--run it
	EXEC sp_executesql @sql;
	SET @i = @i + 1;
END
GO


--Create the partition function: dailyPF
CREATE PARTITION FUNCTION [DateTimeRange_pf](DATETIME2(7)) AS RANGE RIGHT FOR VALUES 

(
N'2003-01-01T00:00:00.000', 
N'2004-01-01T00:00:00.000', 
N'2005-01-01T00:00:00.000', 
N'2006-01-01T00:00:00.000', 
N'2007-01-01T00:00:00.000', 
N'2008-01-01T00:00:00.000', 
N'2009-01-01T00:00:00.000', 
N'2010-01-01T00:00:00.000', 
N'2011-01-01T00:00:00.000', 
N'2012-01-01T00:00:00.000', 
N'2013-01-01T00:00:00.000', 
N'2014-01-01T00:00:00.000', 
N'2015-01-01T00:00:00.000', 
N'2016-01-01T00:00:00.000', 
N'2017-01-01T00:00:00.000', 
N'2018-01-01T00:00:00.000',
N'2019-01-01T00:00:00.000',
N'2020-01-01T00:00:00.000', 
N'2021-01-01T00:00:00.000', 
N'2022-01-01T00:00:00.000',
N'2023-01-01T00:00:00.000', 
N'2024-01-01T00:00:00.000', 
N'2025-01-01T00:00:00.000'
   )
GO

CREATE PARTITION FUNCTION [IntRange_pf](INT) AS RANGE RIGHT FOR VALUES 
(
20030101, 
20040101, 
20050101, 
20060101, 
20070101, 
20080101, 
20090101, 
20100101, 
20110101, 
20120101, 
20130101, 
20140101, 
20150101, 
20160101, 
20170101, 
20180101, 
20190101, 
20200101, 
20210101, 
20220101, 
20230101, 
20240101,
20250101
)
GO

 

 -- Check functions 
SELECT name,type_desc, fanout, boundary_value_on_right, create_date 
FROM sys.partition_functions;
GO



--******************
--5. CREATE THE PARTITION SCHEME
--This maps the filegroups to the partition function.
--******************

--CREATE SCHEMA
	CREATE PARTITION SCHEME DateTimeScheme_ps
	AS PARTITION DateTimeRange_pf
	TO (
	
	   FG2002,FG2003,FG2004,FG2005,FG2006,
	   FG2007,FG2008,FG2009,FG2010,FG2011,
	   FG2012,FG2013,FG2014,FG2015,FG2016,
	   FG2017,FG2018,FG2019,FG2020,FG2021,
	   FG2022,FG2023,FG2024,FG2025
	   
	   )


	   	CREATE PARTITION SCHEME IntScheme_ps
	AS PARTITION [IntRange_pf]
	TO (
	
	   FG2002,FG2003,FG2004,FG2005,FG2006,
	   FG2007,FG2008,FG2009,FG2010,FG2011,
	   FG2012,FG2013,FG2014,FG2015,FG2016,
	   FG2017,FG2018,FG2019,FG2020,FG2021,
	   FG2022,FG2023,FG2024,FG2025
	   
	   )

--Look at how this is mapped out now
SELECT *
FROM ph.FileGroupDetail

ORDER BY 1
GO

--******************
-- Test Partition Ranges
--******************

SELECT $PARTITION.DateTimeRange_pf('2015-01-01') 
SELECT $PARTITION.DateTimeRange_pf('2016-01-01') 
SELECT $PARTITION.DateTimeRange_pf('2017-01-01') 

SELECT $PARTITION.IntRange_pf(20150101) 
SELECT $PARTITION.IntRange_pf(20160101) 
SELECT $PARTITION.IntRange_pf(20170101) 



--******************
--6. CREATE OBJECTS ON THE PARTITION SCHEME
--******************

 USE [VulkanProd]

GO

CREATE CLUSTERED INDEX [ClusteredIndex] ON [dbo].[FactTableModifiedDate]
(
	[ModifiedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = ON, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [DateTimeScheme_ps](ModifiedDate)

GO


CREATE UNIQUE CLUSTERED INDEX [ClusteredIndexPeriode] ON [dbo].[FactTablePeriod]
(
	[Period] ASC,
	[SalesOrderID] ASC,
	[SalesOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
ON [IntScheme_ps]([Period])

GO


 
SELECT *
FROM ph.ObjectDetail
WHERE object_name='FactTablePeriod'
--WHERE object_name='FactTableModifiedDate'
order by partition_number;
GO





 



























































--******************
--8. SWITCHING IN NEW PARTITIONS...
--Like lightning.
--******************

--I want to load data for tomorrow and then switch it in.
--First, add a filegroup.
ALTER DATABASE VulkanProd ADD FILEGROUP DailyFG7

--Add a file for the filegroup.
DECLARE @path NVARCHAR(256), @i TINYINT=7, @sql NVARCHAR(4000);
SELECT TOP 1 @path=LEFT(physical_name,LEN(physical_name)-4) 
FROM sys.database_files WHERE name='VulkanProd';

WHILE @i = 7
BEGIN
	SET @sql=N'ALTER DATABASE VulkanProd ADD FILE (name=DailyF' + CAST(@i AS NCHAR(1))+', 
		 filename=''' +  @path + N'F'+ CAST(@i AS NCHAR(1))+'.ndf' + ''',
		 size=128MB, filegrowth=256MB) TO FILEGROUP DailyFG'+CAST(@i AS NCHAR(1))
	--show the command we're running
	RAISERROR (@sql,0,0)
	
	--run it
	EXEC sp_executesql @sql
	SET @i+=1
END



--Create a staging table on our new filegroup (dailyFG6)
--Why are we seeding the identity here?
--What would happen if we didn't?
CREATE TABLE OrdersDailyLoad (
	OrderDate DATETIME2(0) NOT NULL,
	OrderId int IDENTITY (10001,1) NOT NULL,
	OrderName nvarchar(256) NOT NULL
) on [DailyFG6]
GO


--Insert some records into our staging table
--Tomorrow=5000 rows
INSERT OrdersDailyLoad(OrderDate, OrderName) 
SELECT DATEADD(SECOND, t.N, 
	DATEADD(dd,1,CAST(SYSDATETIME() AS DATETIME2(0)))) AS OrderDate,
	CASE WHEN t.N % 3 = 0 THEN 'Bow and Arrow' WHEN t.N % 2 = 0 
		THEN 'First Aid Kit'  
		ELSE 'Pen' 
	END AS OrderName
FROM ph.tally AS t
WHERE N < = 5000
GO

--Create indexes on our staging table
ALTER TABLE OrdersDailyLoad
ADD CONSTRAINT PKOrdersDailyLoad
	PRIMARY KEY CLUSTERED(OrderDate,OrderId)
GO

--Create the aligned NC as well. It can have a different name.
CREATE NONCLUSTERED INDEX NCOrderIdOrdersDailyLoad ON OrdersDailyLoad(OrderId)
GO


--Create two check constraints on the staging table.
--This will ensure data fits in with the allowed range 
--for the partition we want to put it in
--Constraints WITH CHECK are required for switching in

--Create one constraint for the "low end"
DECLARE @tsql NVARCHAR(2000)=
'ALTER TABLE OrdersDailyLoad
WITH CHECK
ADD CONSTRAINT CKOrdersDailyLoad_LowEnd
CHECK (OrderDate >= ''' + 
	convert(CHAR(10),DATEADD(dd,1,CAST(SYSDATETIME() AS DATE))) + ''')'
--Display what we're running
RAISERROR (@tsql,0,0)
--Run it
EXEC sp_executesql @tsql;
GO

--Create one constraint for the "high end"
DECLARE @tsql NVARCHAR(2000)=
'ALTER TABLE OrdersDailyLoad
WITH CHECK
ADD CONSTRAINT CKOrdersDailyLoad_HighEnd
CHECK (OrderDate < ''' + 
	convert(CHAR(10),DATEADD(dd,2,CAST(SYSDATETIME() AS DATE))) + ''')'
--Display what we're running
RAISERROR (@tsql,0,0)
--Run it
EXEC sp_executesql @tsql;




--Homework: insert some rows into OrdersDaily itself for the day 
--you're loading into the staging table-- and see what happens to them.


--Set our new filegroup as 'Next used' in our partition scheme
--This is how you add it to the partition scheme
ALTER PARTITION SCHEME DailyPS
NEXT USED DailyFG7

--This means DailyFG7 will receive any additional partition of a 
--partitioned table or index as a result of an ALTER PARTITION 
--FUNCTION statement.

--Examine our partition function with assocated scheme, filegroups, 
--and boundary points
SELECT *
FROM ph.FileGroupDetail;
GO


--Add a new boundary point to our partition function. 
--We already have an empty partition -- there's no data right 
--now in Partition #6.
--But we always want to KEEP at least one empty partition at the high end, 
--so we're going to add another.
ALTER PARTITION FUNCTION DailyPF() 
SPLIT RANGE (DATEADD(dd,2,CAST(SYSDATETIME() AS DATE)))
GO


--If you don't add a filegroup to the partition scheme first with NEXT USED, 
--you'll get the error:
--Msg 7707, Level 16, State 1, Line 2
--The associated partition function 'DailyPF' generates more partitions 
--than there are file groups mentioned in the scheme 'DailyPS'.

--But note that you *CAN* use a FileGroup for  more than one partition
--To do this,  you just set an existing one with NEXT USED.



--Now check the partition function and object-- what's different?
SELECT *
FROM ph.FileGroupDetail

SELECT *
FROM ph.ObjectDetail
WHERE object_name IN ('OrdersDaily','OrdersDailyLoad')
ORDER BY object_name, partition_number



--******************
--Switch in!
--******************
ALTER TABLE OrdersDailyLoad
SWITCH TO OrdersDaily PARTITION 6














--Uh oh...
--We must disable (or drop) this non-aligned index to make switching work
ALTER INDEX NCOrderNameOrdersDailyNonAligned ON OrdersDaily DISABLE;
GO

--Switch in!
ALTER TABLE OrdersDailyLoad
SWITCH TO OrdersDaily PARTITION 6;
GO


-- Let's look at our partitioned table and loading table now...
-- Partition 6 should now have 5000 rows in it
-- Partition 1 and Partition 7 should be empty
SELECT *
FROM ph.ObjectDetail
WHERE object_name IN ('OrdersDaily','OrdersDailyLoad')
ORDER BY object_name, partition_number;
GO

--Let's go ahead and drop the staging table
DROP TABLE OrdersDailyLoad;
GO














--******************
--9. SWITCHING OUT OLD DATA
--******************
--I have four right partition boundaries currently
--I want to switch out my oldest data


--Look at how this is mapped out now. 
--We want to get rid of our oldest 1000 rows.
--Those are sitting in Partition 2 which is on DailyFG2
SELECT *
FROM ph.FileGroupDetail
ORDER BY partition_number;
GO


--Create a staging table to hold switched out data 
--PUT THIS ON THE SAME FILEGROUP YOU'RE SWITCHING OUT OF
CREATE TABLE OrdersDailyOut (
	OrderDate DATETIME2(0) NOT NULL,
	OrderId int IDENTITY NOT NULL,
	OrderName nvarchar(256) NOT NULL
) on [DailyFG2];
GO

--Create the primary key our switch out table
ALTER TABLE OrdersDailyOut
ADD CONSTRAINT PKOrdersDailyOut
	PRIMARY KEY CLUSTERED(OrderDate,OrderId);
GO

--Switch OUT!
RAISERROR ('Switching out.',0,0)
ALTER TABLE OrdersDaily
SWITCH PARTITION 2 TO OrdersDailyOut;
GO

--Look at our switch OUT table
--OrdersDailyOut should have 1000 rows
--Partition 1 and Parttiion 2 of ORdersDaily should have 0 rows
SELECT *
FROM ph.ObjectDetail
WHERE object_name IN ('OrdersDaily','OrdersDailyOut')
ORDER BY object_name DESC, partition_number;
GO



--Note: when switching out to an empty table, we needed to add the clustered index. 
--However, we did NOT need to add NCIs or a check constraint. (Whew!)


--We want to keep an empty partition on DailyFG1
--But we want to remove the empty partition on DailyFG2 (currently Partition 2)
--Programmatically find the boundary point to merge
--This is done so we don't have to hard code dates in the script
DECLARE @MergeBoundaryPoint DATETIME2(0), @msg NVARCHAR(2000);
SELECT @MergeBoundaryPoint = CAST(MIN(rv.value) AS DATETIME2(0))
FROM sys.partition_functions  pf
JOIN sys.partition_range_values rv ON pf.function_id=rv.function_id
where pf.name='DailyPF'

IF (
	SELECT COUNT(*)
	FROM dbo.OrdersDaily
	WHERE OrderDate < dateadd(DAY, 1, @MergeBoundaryPoint)
) =0
BEGIN
	SET @msg='No records found, merging boundary point ' 
		+ CAST(@MergeBoundaryPoint AS CHAR(10)) + '.'
	RAISERROR (@msg,0,0)
	ALTER PARTITION FUNCTION DailyPF ()
		MERGE RANGE ( @MergeBoundaryPoint )
END
ELSE
BEGIN
	SET @msg='ERROR: Records exist around boundary point ' 
		+ CAST(@MergeBoundaryPoint AS CHAR(10)) + '. Not merging.'
	RAISERROR (@msg,16,1)
END

--Homework: What would happen if we didn't have a 
--safety to make sure there were no records?


--Look at how this is mapped out after switch-out and merging boundary points.
--DailyFG1 should be present and have 0 rows.
--No partitions should be mapped to DailyFG2 --
--our boundary point merge got rid of it. (It was empty.)
SELECT *
FROM ph.FileGroupDetail;
GO


--Let's go ahead and drop the switch OUT table
--(Assuming we don't want to do anything with the rows we switched out!)
DROP TABLE OrdersDailyOut;
GO

--Admire our partitioned table after the SWITCHING is complete.
--We have kept one empty partition sandwiching each end 
--(this is minimum-- you probably want more in production!)
SELECT *
FROM ph.ObjectDetail
WHERE object_name IN ('OrdersDaily')
ORDER BY object_name DESC, partition_number;
GO
