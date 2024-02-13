CREATE DATABASE <DATABASE_NAME>;
CREATE DATABASE my_first_db_in_sql;

--- Create Table ---

CREATE SCHEMA hr_management;

CREATE TABLE [hr_management].[employee_detail](
	[Employee_ID] [int] NOT NULL,
	[Employee_Name] [varchar](100) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[Department] [varchar](100) NOT NULL,
	[Gender] [varchar](100) NOT NULL,
	[Salary] [int] NOT NULL
) ON [PRIMARY]
;



CREATE TABLE quote (txt varchar(100))
insert into quote values( 'I will make you a offer you cannot refuse-Godfather'),
        ('Winter is coming-Games of thrones'), ('why didi katapa killed the prince - Bahubali')

--- Find the auther name

SELECT txt, right(txt, datalength(txt) - CHARINDEX('-',txt)) as movie_name from quote;


CREATE TABLE alphanumeric(
	prefix VARCHAR(2),
	suffix int
);

INSERT INTO alphanumeric (prefix, suffix)
values('US', 22),('IND',88);


select CONCAT(prefix, REPLICATE('0',(12 - (len(prefix)+len(suffix)))), suffix)
--,(len(prefix)+len(suffix))
from alphanumeric;
update alphanumeric set suffix = 1234 where prefix = 'US';

-- FIRST DAY OF CURRENT MONTH

SELECT DATEADD(y, 1, EOMONTH(getdate(),-1));



SELECT EOMONTH(day_of_sale), SUM


--- Drop database ---

-- DROP DATABASE my_first_db_in_sql;