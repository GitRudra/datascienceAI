-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select EMPLOYEE_ID, LAST_NAME from EMPLOYEE ORDER BY EMPLOYEE_ID;


-- 2. List out the Employee ID and Name in descending order based on salary.
select EMPLOYEE_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS Name, Salary from EMPLOYEE ORDER BY SALARY DESC;

-- 3. List out the employee details according to their Last Name in ascending-order.
select * from EMPLOYEE ORDER BY LAST_NAME;


-- 4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order
select * from EMPLOYEE ORDER BY LAST_NAME, DEPARTMENT_ID DESC;
