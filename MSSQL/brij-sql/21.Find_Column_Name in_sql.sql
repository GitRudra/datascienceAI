--USE PVRDWH
SELECT t.name AS table_name,
SCHEMA_NAME(schema_id) AS schema_name,
c.name AS column_name
FROM sys.tables AS t
INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
WHERE c.name LIKE '%weekly%'
ORDER BY schema_name, table_name desc;



/*

for view name
USE PVR_DATASETS
Select * FROM sys.tables as t
WHERE t.name LIKE '%client%'
*/