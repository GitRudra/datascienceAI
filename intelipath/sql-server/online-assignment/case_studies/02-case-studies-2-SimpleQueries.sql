-- 1. List all the employee details.
Select * from EMPLOYEE;

-- 2. List all the department details.
select * from DEPARTMENT;

-- 3. List all job details.
select * from JOB;

-- 4. List all the locations.
select * from LOCATION;

-- 5. List out the First Name, Last Name, Salary, Commission for allEmployees.
Select FIRST_NAME, LAST_NAME, SALARY, COMM from EMPLOYEE;

-- 6. List out the Employee ID, Last Name, Department ID for all employeesandalias
--   Employee ID as "ID of the Employee", Last Name as "Name of theEmployee", Department ID as "Dep_id".

select
EMPLOYEE_ID AS "ID OF THE EMPLOYEE",
LAST_NAME AS "Name of the Employee",
DEPARTMENT_ID AS Dep_id
from  EMPLOYEE


-- 7. List out the annual salary of the employees with their names only
select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS EMPLOYEE_NAME , SALARY from  EMPLOYEE;
