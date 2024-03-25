-- 1. List out employees with their department names.

select e.*, d.Name
from
    EMPLOYEE e
LEFT JOIN
    DEPARTMENT d
ON (e.DEPARTMENT_ID = d.Department_Id)
;

-- 2. Display employees with their designations.
select e.*, j.Designation
from
    EMPLOYEE e
LEFT JOIN
    JOB j
ON (e.JOB_ID = j.Job_ID)
;

-- 3. Display the employees with their department names and regional groups.
select e.*, d.Name , d.Location_Id, l.City As Region
from
    EMPLOYEE e
LEFT JOIN
    DEPARTMENT d
ON (e.DEPARTMENT_ID = d.Department_Id)
LEFT JOIN
    [Location] l
ON d.Location_Id = l.Location_ID

-- 4. How many employees are working in different departments? Displaywithdepartment names.
select d.Name, count(e.EMPLOYEE_ID) AS EMP_COUNT
from
    EMPLOYEE e
LEFT JOIN
    DEPARTMENT d
ON (e.DEPARTMENT_ID = d.Department_Id)
GROUP BY d.Name
;

-- 5. How many employees are working in the sales department?

select count(*), d.Name
from EMPLOYEE e
LEFT OUTER JOIN DEPARTMENT d ON (e.DEPARTMENT_ID = d.Department_Id)
where d.Name  =  'Sales'
GROUP BY d.Name


-- 6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending order.
select d.Name, count(e.EMPLOYEE_ID) AS EMP_COUNT
from
    EMPLOYEE e
LEFT JOIN
    DEPARTMENT d
ON (e.DEPARTMENT_ID = d.Department_Id)
 GROUP BY d.Name
 HAVING COUNT(*) >= 5
;

-- 7. How many jobs are there in the organization? Display with designations.
select j.Designation, count(*) No_of_Jobs from
EMPLOYEE e
INNER JOIN DEPARTMENT d ON (e.DEPARTMENT_ID = d.Department_Id)
INNER JOIN JOB j ON (e.JOB_ID =  j.Job_ID)
GROUP BY j.Designation
;

-- 8. How many employees are working in "New York"?
select count(*) No_of_Employee from
EMPLOYEE e
INNER JOIN DEPARTMENT d ON (e.DEPARTMENT_ID = d.Department_Id)
INNER JOIN [Location] l ON (d.Location_Id = l.Location_ID)
where l.City = 'New York'


-- 9. Display the employee details with salary grades. Use conditional statement to create a grade column.
select
*,
CASE
    WHEN SALARY >=0 AND SALARY < 1000 THEN 'D'
    WHEN SALARY >=1000 AND SALARY < 2000 THEN 'C'
    WHEN SALARY >= 2000 AND SALARY < 3000 THEN 'B'
    ELSE 'A'
END AS GRADE
from EMPLOYEE e


-- 10. List out the number of employees grade wise. Use conditional statement to create a grade column.

select GRADE, count(*) AS Employee_no
from
(
    select
    e.EMPLOYEE_ID,
    CASE
        WHEN SALARY >=0 AND SALARY < 1000 THEN 'D'
        WHEN SALARY >=1000 AND SALARY < 2000 THEN 'C'
        WHEN SALARY >= 2000 AND SALARY < 3000 THEN 'B'
        ELSE 'A'
    END AS GRADE
    from EMPLOYEE e
) m
GROUP BY GRADE;


-- 11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
select GRADE, count(*) AS Employee_no
from
(
    select
    e.EMPLOYEE_ID,
    CASE
        WHEN SALARY >=0 AND SALARY < 1000 THEN 'D'
        WHEN SALARY >=1000 AND SALARY < 2000 THEN 'C'
        WHEN SALARY >= 2000 AND SALARY < 3000 THEN 'B'
        ELSE 'A'
    END AS GRADE
    from EMPLOYEE e
    where SALARY BETWEEN 2000 AND 5000
) m
GROUP BY GRADE;

-- 12. Display all employees in sales or operation departments.
select e.EMPLOYEE_ID, e.FIRST_NAME, e.LAST_NAME, d.Name
from EMPLOYEE e
LEFT OUTER JOIN DEPARTMENT d ON (e.DEPARTMENT_ID = d.Department_Id)
AND d.Name  =  'Sales' OR d.Name = 'Operations'
