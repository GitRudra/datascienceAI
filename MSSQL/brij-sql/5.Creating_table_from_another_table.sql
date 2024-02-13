--Created a new table using data (conditional data) from another table
select * 
into  sales_new -- Creat a new table 
from sales --using data  from another table
where Store<6--condition

