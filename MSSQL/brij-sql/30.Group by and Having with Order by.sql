--1
select Department,
country
,avg(salary) as Average_Salary
from tbl002_emp
--2 
--where Country='India'
--3
Group by Department
,country
--4
having avg(Salary)>50000 and country='India'
--Department='Analytics'
--5
order by 2




