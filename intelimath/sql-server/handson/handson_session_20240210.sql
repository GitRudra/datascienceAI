/*


Create table Customer (Customer_id int, First_name Varchar(25), Last_Name varchar(30),
Email varchar(50), Address varchar(30), City Varchar(30), State Varchar(30), Zip int)

insert into Customer values (1,'Sana','B','sana@gmail.com','Jayanagar','Bangalore','Karnataka',5877),
(2, 'Apurva','Wankade','apurva@yahoo.com','5th Cross','Pune','Mumbai',6894),
(3,'Gautham','Sinha','gautham@yahoo.com','New City','San Jose','CA',12868),
(4,'Prabhu','V','prabhu@gmail.com','4th Cross','Chennai','TamilNadu',6958),
(5,'Bob','Barly','bob@hotmail.com','3rd Street','Texas','CA',84985);

create table Orders (order_id int, order_date date, amount int, customer_id int)

--insert
insert into Orders (order_id, order_date, amount, customer_id)
values (101, '2021-07-04',2450, 1),
		(201, '2018-09-13',5670,3),
		(301,'2020-02-02',2000,5),
		(401,'2019-01-05',3500,6),
		(501,'2021-06-03',300,7)



*/

select * from Customer where First_name like 'G%' and CITY