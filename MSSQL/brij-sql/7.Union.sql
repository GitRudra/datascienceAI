use vrinda
-- for all union , union all and other things column number should be same and datatype in same order
SELECT  [Store]
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [sales_new]
  union
  SELECT  [Store]
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [sales]