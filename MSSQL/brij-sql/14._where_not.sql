/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Country]
,Department,
Employee_Name,
      salary
  FROM [vrinda].[dbo].[tbl002_emp]
  where not Department='Analytics'
  or not country='India'
 
   -- where  Country<>'Australia'
	  --where Country!='Australia'