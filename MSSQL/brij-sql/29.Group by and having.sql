select Department
,avg(salary) as Average_Salary
,count(*) as No_of_employees
from tbl002_emp
--where Gender='Male'
Group by Department
having avg(Salary)<50000

--Group by Department having average salary of More than 50k
--avg salary department
--50k



