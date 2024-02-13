/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Country]
      ,sum([Salary]) as Countrywise_total_salary
  FROM [vrinda].[dbo].[tbl002_emp]
  Group by Country