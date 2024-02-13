select 
Department
--,avg(salary) AS Average_Salary
--,count(Employee_ID) as no_of_employee 
from tbl002_emp
where Gender='Female'
Group by Department



select Gender
,avg(salary) as Average_Salary
,sum(salary) as Total_Salary
from tbl002_emp
Group by Gender
