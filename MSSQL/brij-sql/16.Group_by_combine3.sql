/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Country]
,Department
      ,avg([Salary]) as Countrywise_avg_salary
  FROM [vrinda].[dbo].[tbl002_emp]
  Group by Country,Department