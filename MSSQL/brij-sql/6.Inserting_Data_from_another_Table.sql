--to Insert data from one table to another
insert into sales_new
SELECT  [Store]+15
      ,[Dept]
      ,[Date_of_Sales]
      ,[Weekly_sales]
      ,[isholiday]
      ,[profit]
      ,[loss]
  FROM [sales]
  where Store>5
