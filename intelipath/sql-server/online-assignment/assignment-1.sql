-- Step 1 : 
CREATE DATABASE Assignment;

CREATE TABLE Salesman (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);


select * from Salesman;

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (104, 'Danny', 100, 'Texas', 22),
    (105, 'Lia', 65, 'New Jersey', 30);

CREATE TABLE Customer (
    SalesmanId INT,
    CustomerId INT,
    CustomerName VARCHAR(255),
    PurchaseAmount INT,
    );

INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
    (101, 2345, 'Andrew', 550),
    (103, 1575, 'Lucky', 4500),
    (104, 2345, 'Andrew', 4000),
    (107, 3747, 'Remona', 2700),
    (110, 4004, 'Julia', 4545);

-- Orders table Creation
CREATE TABLE Orders (OrderId int, CustomerId int, SalesmanId int, Orderdate Date, Amount money);

-- Orders table record insertion

INSERT INTO Orders Values 
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)
;


------------------------------Question 1---------------------------------------
--- Insert a new record in your Orders table.

INSERT INTO Orders Values 
(5002,3747,107,'2024-01-21',550)
;

/*
------------------------------Question 2---------------------------------------
Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.

*/ 

-- Add primary key constraints for SalesmanId column
-- Step 1: Make SalesmanId column not null
alter table Salesman alter column SalesmanId INT NOT NULL;
GO
-- Step2 : Add primary key constraints
alter table Salesman add CONSTRAINT PK_SALESMAN_SALESMANID PRIMARY KEY (SalesmanId);

-- Add default conastraints for city column

alter table Salesman add constraint DC_SALESMAN_CITY default 'Delhi' For City;


-- Add Foreign key constraint for SalesmanId column in Customer table

-- Add new entry for saleman table as id 107 and 110 is not present in the base table so 
-- FK constaints will fail.

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
    (107, 'Rohit', 50, 'Delhi', 37),
    (110, 'Vishal', 75, 'Bangalore', 25)
;

-- Now add FK constraints
alter table Customer 
add constraint FK_CUSTOMER_SALESMANID 
foreign key (SalesmanId) References Salesman(SalesmanId);

-- Not null constraints on customer name
alter table Customer
alter column CustomerName VARCHAR(255) not null 
;
------------------------------Question 3---------------------------------------
-- etch the data where the Customer’s name is ending with ‘N’ also get the purchase
-- amount value greater than 500.


select * from Customer
where CustomerName like '%N'
AND PurchaseAmount > 500;


/*
------------------------------Question 4---------------------------------------
Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.
*/

CREATE TABLE Salesman_old (
    SalesmanId INT,
    Name VARCHAR(255),
    Commission DECIMAL(10, 2),
    City VARCHAR(255),
    Age INT
);

INSERT INTO Salesman_old (SalesmanId, Name, Commission, City, Age)
VALUES
    (101, 'Joe', 50, 'California', 17),
    (102, 'Simon', 75, 'Texas', 25),
    (103, 'Jessie', 105, 'Florida', 35),
    (111, 'Deshmukh', 65, 'Mumbai', 22),
    (112,'Rajaram', 65, 'Hyderaabad', 37)
    (113,'Sumit', 65, 'Kolkata', 47)
;

-- select * from Salesman_old;

-- Unique SalesmanId
select * FROM Salesman
union
select * FROM Salesman_old
;

-- Duplicate SalesmanId

select * FROM Salesman
union all
select * FROM Salesman_old
;

------------------------------Question 5---------------------------------------

/*
Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 1500 to 3000.
*/

select 
o.OrderDate,
s.Name,
c.CustomerName,
s.Commission,
s.city as City
from Orders o
INNER JOIN  Salesman s
ON o.SalesmanId = s.SalesmanId
INNER JOIN Customer c 
ON o.CustomerId = c.CustomerId
where c.PurchaseAmount between 500 and 1500
;

------------------------------Question 6---------------------------------------

--Using right join fetch all the results from Salesman and Orders table.

select 
*
from Orders o
RIGHT JOIN Salesman s 
ON s.SalesmanId = o.SalesmanId
;