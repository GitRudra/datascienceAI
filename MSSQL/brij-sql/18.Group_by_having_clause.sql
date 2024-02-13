/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Country]
,Department
      ,avg([Salary]) as Countrywise_avg_salary
  FROM [vrinda].[dbo].[tbl002_emp]
  Group by Country,Department
  having avg(salary)>40000
  order by 1