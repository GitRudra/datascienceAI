/*
 Add column Loss Decimal(10,2) in sales table and update the loss as 10% of weekly sales with negative percentage
*/


alter table sales add loss DECIMAL(10,2);

select * from sales ;

update sales set loss =  Weekly_sales * -.1;

select * from sales ;