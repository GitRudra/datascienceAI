SELECT  'Sales_new' as Table_Name,[Store]
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [vrinda].[dbo].[sales_new]
  union all
  SELECT  'Sales',[Store]
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [vrinda].[dbo].[sales]