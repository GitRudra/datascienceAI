-- 1. How many employees are in different departments in the organization?
select DEPARTMENT_ID, COUNT(*) AS NO_OF_EMPLOYEE from EMPLOYEE
GROUP BY DEPARTMENT_ID;

-- 2. List out the department wise maximum salary, minimum salary and average salary of the employees.
select
e.DEPARTMENT_ID AS Department_Id,
d.Name AS Department_Name,
MAX(SALARY) AS Max_Salary,
MIN(SALARY) AS Min_Salary,
AVG(SALARY) AS Avg_Salary
from EMPLOYEE e
INNER JOIN  DEPARTMENT d
ON (e.DEPARTMENT_ID = d.Department_Id)
GROUP BY e.DEPARTMENT_ID, d.Name
;

-- 3. List out the job wise maximum salary, minimum salary and average salary of the employees.
select
e.JOB_ID AS Job_Id,
j.Designation AS JOb_Name,
MAX(SALARY) AS Max_Salary,
MIN(SALARY) AS Min_Salary,
AVG(SALARY) AS Avg_Salary
from EMPLOYEE e
INNER JOIN  JOB j
ON (e.JOB_ID = j.Job_ID)
GROUP BY e.JOB_ID, j.Designation
;

-- 4. List out the number of employees who joined each month in ascendingorder.

SELECT
    DATEPART(mm, HIRE_DATE) as hire_month,
    COUNT(*) As No_Of_Employee
FROM
   EMPLOYEE
GROUP BY DATEPART(mm, HIRE_DATE)
order by No_Of_Employee
;

-- 5. List out the number of employees for each month and year in ascending order based on the year and month.

SELECT
    DATEPART(yy, HIRE_DATE) as hire_year,
    DATEPART(mm, HIRE_DATE) as hire_month,
    COUNT(*) As No_Of_Employee
FROM
   EMPLOYEE
GROUP BY DATEPART(yy, HIRE_DATE), DATEPART(mm, HIRE_DATE)
order by hire_year, hire_month
;

-- 6. List out the Department ID having at least four employees.

select DEPARTMENT_ID, COUNT(*) AS NO_OF_Employee from EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) >= 4

-- 7. How many employees joined in the month of January?
select COUNT(*) from EMPLOYEE
where DATEPART(mm, HIRE_DATE) = 1;

-- 8. How many employees joined in the month of January or September?

select CONCAT(year(HIRE_DATE), '-',month(HIRE_DATE)) AS HIRE_MONTH_YEAR, COUNT(*) AS No_Of_Employee  from EMPLOYEE
where month(HIRE_DATE) IN (1,9)
group by CONCAT(year(HIRE_DATE), '-',month(HIRE_DATE))

-- 9. How many employees joined in 1985?

select year(HIRE_DATE) AS YEAR_OF_JOINING, COUNT(*) AS No_Of_Employee  from EMPLOYEE
where  year(HIRE_DATE) = 1985
group by year(HIRE_DATE)

-- 10. How many employees joined each month in 1985?

select month(HIRE_DATE) AS month_OF_JOINING, COUNT(*) AS No_Of_Employee  from EMPLOYEE
where  year(HIRE_DATE) = 1985
group by month(HIRE_DATE)

-- 11. How many employees joined in March 1985?

select COUNT(*) AS No_Of_Employee  from EMPLOYEE
where  year(HIRE_DATE) = 1985 AND month(HIRE_DATE) = 3

-- 12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?

select DEPARTMENT_ID, COUNT(*) AS No_Of_Employee  from EMPLOYEE
where  year(HIRE_DATE) = 1985 AND month(HIRE_DATE) = 4
group by DEPARTMENT_ID
HAVING COUNT(*) > 3
