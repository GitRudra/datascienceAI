-- 1. List out the distinct jobs in sales and accounting departments.
select DISTINCT j.Designation
from EMPLOYEE e INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
INNER JOIN JOB j ON e.JOB_ID = j.Job_ID
WHERE  d.Name IN ('Accounting','Sales');


-- 2. List out all the jobs in sales and accounting departments.
select j.Designation
from EMPLOYEE e INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
INNER JOIN JOB j ON e.JOB_ID = j.Job_ID
WHERE  d.Name IN ('Accounting','Sales')


-- 3. List out the common jobs in research and accounting departments in ascending order

select j.Designation
from EMPLOYEE e INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
INNER JOIN JOB j ON e.JOB_ID = j.Job_ID
WHERE  d.Name = 'Accounting'

UNION

select j.Designation
from EMPLOYEE e INNER JOIN DEPARTMENT d ON e.DEPARTMENT_ID = d.Department_Id
INNER JOIN JOB j ON e.JOB_ID = j.Job_ID
WHERE  d.Name = 'Research';
