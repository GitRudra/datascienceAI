-- 1. Display the employees list who got the maximum salary

select * from EMPLOYEE where SALARY = (select MAX(SALARY) from EMPLOYEE)

-- 2. Display the employees who are working in the sales department.
select * from EMPLOYEE where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENT where Name = 'Sales')

-- 3. Display the employees who are working as 'Clerk'.

select * from EMPLOYEE where JOB_ID = (select JOB_ID from JOB where Designation = 'Clerk');

-- 4. Display the list of employees who are living in "New York".

select
*
from EMPLOYEE
where DEPARTMENT_ID IN (
    select DEPARTMENT_ID
    from DEPARTMENT
    where Location_Id  in (
        select Location_Id from [Location] where City = 'New York'
        )
);

-- 5. Find out the number of employees working in the sales department.
select COUNT(*) from EMPLOYEE where DEPARTMENT_ID = (select DEPARTMENT_ID from DEPARTMENT where Name = 'Sales')

-- 6. Update the salaries of employees who are working as clerks on the basis of 10%.
update EMPLOYEE SET SALARY = SALARY+(SALARY * 10/100) where JOB_ID  =  (select JOB_ID from JOB where Designation = 'CLERK');

-- 7. Delete the employees who are working in the accounting department.

BEGIN TRAN deleteEmployee
select * from EMPLOYEE where DEPARTMENT_ID  =  (Select DEPARTMENt_ID from DEPARTMENT where Name = 'Accounting');
delete from EMPLOYEE where DEPARTMENT_ID  = (Select DEPARTMENt_ID from DEPARTMENT where Name = 'Accounting');
select * from EMPLOYEE where DEPARTMENT_ID  =  (Select DEPARTMENt_ID from DEPARTMENT where Name = 'Accounting');
ROLLBACK TRAN deleteEmployee


-- 8. Display the second highest salary drawing employee details.
select * from (
    select
    *,
    DENSE_RANK() OVER(ORDER BY SALARY desc) AS Salary_Rank
    from EMPLOYEE
) e
where e.Salary_Rank = 2

-- 9. Display the nth highest salary drawing employee details.

create function find_employee_by_salary_rank(@rank int)
RETURNS TABLE
AS
RETURN
    select * from (
    select
    *,
    DENSE_RANK() OVER(ORDER BY SALARY desc) AS Salary_Rank
    from EMPLOYEE
    ) e
    where e.Salary_Rank = @rank

select * from dbo.find_employee_by_salary_rank(3);


-- 10. List out the employees who earn more than every employee in department 30.

select
*
from Employee
where SALARY >= ( select max(SALARY) from EMPLOYEE where DEPARTMENT_ID = 30)
AND DEPARTMENT_ID =  30

-- 11. List out the employees who earn more than the lowest salary in department.

select * from (
    select
    *,
    DENSE_RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY asc) AS Salary_Rank
    from EMPLOYEE
) e
where e.Salary_Rank > 1


-- 12. Find out which department has no employees.
select * from DEPARTMENT where Department_Id NOT IN (select DISTINCT Department_Id from EMPLOYEE);

-- 13. Find out the employees who earn greater than the average salary for their department.
select * from EMPLOYEE e
    where e. Salary > (select AVG(Salary) from EMPLOYEE x where e.DEPARTMENT_ID = x.DEPARTMENT_ID)

/*
select DEPARTMENT_ID, AVG(SALARY) from EMPLOYEE
GROUP BY DEPARTMENT_ID;

select EMPLOYEE_ID, SALARY, DEPARTMENT_ID from EMPLOYEE order by DEPARTMENT_ID

*/
