select 
Department
,Gender
,avg(salary) as Average_Salary
,sum(Salary) As Total_Salary
,count(Employee_ID) as Number_of_employee

from tbl002_emp
Group by Department
,Gender
order by 1

