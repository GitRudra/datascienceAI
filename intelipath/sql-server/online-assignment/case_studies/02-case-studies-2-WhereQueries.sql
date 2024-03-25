-- 1. List the details about "Smith".
select * from EMPLOYEE
where UPPER(LAST_NAME) = UPPER('SMITH')
;

-- 2. List out the employees who are working in department 20.
select * from EMPLOYEE where DEPARTMENT_ID =  20 ;


-- 3. List out the employees who are earning salaries between 3000 and 4500.
select * from EMPLOYEE where SALARY BETWEEN 3000 AND 4500;

-- 4. List out the employees who are working in department 10 or 20.
select * from EMPLOYEE where DEPARTMENT_ID = 10 OR DEPARTMENT_ID = 20;

-- 5. Find out the employees who are not working in department 10 or 30.

select * from EMPLOYEE where DEPARTMENT_ID  NOT IN (10, 30);

-- 6. List out the employees whose name starts with 'S'.

select * from EMPLOYEE where FIRST_NAME like 'S%' OR LAST_NAME like 'S%';


-- 7. List out the employees whose name starts with 'S' and ends with 'H'.

select * from EMPLOYEE where FIRST_NAME like 'S%H' OR LAST_NAME like 'S%H';

-- 8. List out the employees whose name length is 4 and start with 'S'.
select * from EMPLOYEE where (FIRST_NAME like 'S%' OR LAST_NAME like 'S%') AND len(FIRST_NAME) = 4;

-- 9. List out employees who are working in department 10 and draw salaries more than 3500.
select * from EMPLOYEE where DEPARTMENT_ID = 10 AND SALARY > 3500

-- 10. List out the employees who are not receiving commission.

select * from EMPLOYEE where COMM IS NULL;
