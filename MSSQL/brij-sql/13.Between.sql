SELECT  [Store]
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [vrinda].[dbo].[sales]
  where Weekly_sales between 10000 and 12000