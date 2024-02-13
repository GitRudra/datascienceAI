-- 1. Avg Salary of every department

select  
Department, 
AVG(Salary) AS Avg_Salary
from tbl001_emp
group by Department;

--- 2. Today's date
select cast(getdate() as DATE);

--- 3. What is the day of last year same date
select datename(dw,dateadd(yy, -1, getdate()));


--- 4. Add three months to today's date
select dateadd(mm, 3, getdate());

--- 5. First 5 character from text string

SELECT SUBSTRING('intelipath', 1, 5);

--- 6. MAX and MIN Salary

select  
MAX(Salary) as Max_Salary, 
MIN(Salary) AS Min_Salary
from tbl001_emp;

--- 8. Financial Year

select 
date_of_sales,
IIF( MONTH(date_of_sales) <= 3,
    CONCAT('FY '
            ,RIGHT(year( dateadd(yy, -1, date_of_sales)), 2)
            ,'-'
            ,RIGHT(year(date_of_sales), 2)
    ) ,
    CONCAT('FY '
            ,RIGHT(year( date_of_sales), 2)
            ,'-'
            ,RIGHT(year(dateadd(yy, 1, date_of_sales)), 2)
    )) AS FY_YY_YY,
IIF( MONTH(date_of_sales) <= 3,
    CONCAT( year( dateadd(yy, -1, date_of_sales))
            ,'-'
            ,RIGHT(year(date_of_sales), 2)
    ) ,
    CONCAT( year( date_of_sales)
            ,'-'
            ,RIGHT(year(dateadd(yy, 1, date_of_sales)), 2)
    )) AS FY_YYYY_YY
from date_details;


-- Convert the Financial month to calendar month by subtracting 3 months from the date.


--- 9.Alphanumeric 

select CONCAT(prefix, REPLICATE('0',(12 - (len(prefix)+len(suffix)))), suffix)
from alphanumeric;

