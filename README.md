# vulkan
Vulkan

VULKAN handles the distribution of very large databases, between sql servers. This can be distribution of data to other test and development servers. The distribution can be full or partial, being certain groupings of data, or certain parts of data, such as by year. 
The usage of partial distribution of data, demands a level of preparation of the database, such as grouping data in filegroups and/or slicing data using partitions. 
The system then uses a combination of configurations tables and BIML code, to generate SSIS packages that run the actual distribution with SQL JOBS.
The VULKAN framework can be used in all SQL Servers and utilizes techniques such as partial recovery and merge and switching partition techniques.
The presentation will cover a detailed VULKAN setup/demo, and touch on BIML and advanced partitioning techniques. 
A base demo framework will be available for download.
Suited audience is Data warehouse and BI developer with some SQL DBA knowledge and SQL DBA’s
