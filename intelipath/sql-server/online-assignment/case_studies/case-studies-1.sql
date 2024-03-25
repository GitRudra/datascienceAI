-- 1. Display the number of states present in the LocationTable

select count(State) total_state_count, count(distinct State) as distinct_state_count from Location;

-- 2. How many products are of regular type
select count(*) from Product where [Type] = 'Regular';

-- 3. How much spending has been done on marketing of product ID 1?
select SUM(Marketing) AS Total_Expense from Fact where ProductId = 1;

-- 4. What is the minimum sales of a product?

select TOP(1) p.ProductId, p.Product, Sum(Sales) total_sale
from Fact f
LEFT JOIN Product p ON (f.ProductId = p.ProductId)
group by p.ProductId, p.Product
order by total_sale ASC


-- 5. Display the max Cost of Good Sold (COGS)
select max(COGS) as max_cost from Fact;

-- 6. Display the details of the product where product type is coffee.
select * from Product where Product_Type = 'Coffee';

-- 7. Display the details where total expenses are greater than 40.

select p.ProductId, p.Product,f.Total_Expenses
from Fact f
LEFT JOIN Product p ON (f.ProductId = p.ProductId)
where f.Total_Expenses > 40;

-- 8. What is the average sales in area code 719?

select
l.Area_Code, l.State,
AVG(f.Sales) AS Avg_Sales
from
Fact f
Left Join Location l
ON (f.Area_Code  =  l.Area_Code)
where f.Area_Code = 719
GROUP BY l.Area_Code, l.State
;

-- 9. Find out the total profit generated by Colorado state
select
l.State, SUM(f.Profit) AS Total_Profit
from
Fact f
Left Join Location l
ON (f.Area_Code  =  l.Area_Code)
where l.State = 'Colorado'
GROUP BY l.State
;

-- 10. Display the average inventory for each product ID.

select p.ProductId, p.Product,AVG(Inventory) AS Avg_Inventory
from Fact f
LEFT JOIN Product p ON (f.ProductId = p.ProductId)
GROUP BY p.ProductId, p.Product
ORDER by ProductId
;

-- 11. Display state in a sequential order in a Location Table.

select * from Location
order by State
;

-- 12. Display the average budget of the Product where the average budget margin should be greater than 100.

select
ProductId,
AVG(Budget_margin) AS Avg_Budget_Margin
from
Fact
GROUP BY ProductId
HAVING AVG(Budget_margin) > 100
;


-- 13. What is the total sales done on date 2010-01-01?

select Sum(Sales) as Total_Sale from Fact
where Date = '2010-01-01'

-- 14. Display the average total expense of each product ID on an individual date.

select
Date, ProductId, AVG(Total_Expenses) as Avg_Total_Expense
from Fact
GROUP BY Date, ProductId
order by ProductId, Date
;

-- 15. Display the table with the following attributes such as date, product ID,product_type, product, sales, profit, state, area_code.

select
Date, f.ProductId, p.Product_Type, p.Product, f.Sales, f.Profit, l.[State], f.Area_Code
from Fact f
LEFT OUTER JOIN Product p
ON (f.ProductId = p.ProductId)
LEFT OUTER JOIN [Location] l
ON (f.Area_Code = l.Area_Code);

-- 16. Display the rank without any gap to show the sales wise rank.
select
Sales, DENSE_RANK() OVER(ORDER BY Sales DESC) AS Sales_Rank
from fact
;

-- 17. Find the state wise profit and sales.

select
l.[State], Sum(f.Profit) AS Profit, Sum(f.Sales) As Sales
from Fact f
LEFT JOIN [Location] l
ON (f.Area_Code = l.Area_Code)
GROUP BY l.[State]
ORDER BY l.[State]
;


-- 18. Find the state wise profit and sales along with the product name.

select
l.[State], p.Product, Sum(f.Profit) AS Profit, Sum(f.Sales) As Sales
from Fact f
LEFT JOIN [Location] l
ON (f.Area_Code = l.Area_Code)
LEFT JOIN Product p
ON (f.ProductId = p.ProductId)
GROUP BY l.[State], p.Product
ORDER BY l.[State], p.Product
;

-- 19. If there is an increase in sales of 5%, calculate the increasedsales.
WITH
Daily_Total_Sales AS(
    select Date, ProductId, SUM(Sales) As Total_Sales
    from Fact
    GROUP BY Date, ProductId
),
Daily_Total_Sales_With_Next_Day AS(
    SELECT
    Date, ProductId, Total_Sales, LEAD(Total_Sales) OVER (PARTITION BY ProductId ORDER BY Date ) AS Next_Day_Total_sale
    FROM Daily_Total_Sales
),
Daily_Sale_Increase_percent AS(
    SELECT
    Date, ProductId, Total_Sales,Next_Day_Total_sale,
    (Next_Day_Total_sale - Total_Sales) AS Increased_Sale,
    IIF(Next_Day_Total_sale IS NULL, 0, (Next_Day_Total_sale -  Total_Sales)*100/Total_Sales ) AS Percent_Increase
    FROM Daily_Total_Sales_With_Next_Day
)
Select
Date, ProductId, Total_Sales,Next_Day_Total_sale,Increased_Sale,Percent_Increase
FROM Daily_Sale_Increase_percent
where Percent_Increase > 5
;

-- 20. Find the maximum profit along with the product ID and producttype.
select f.ProductId, p.Product_Type, MAX(f.Profit) AS Max_Profit
from Fact f
LEFT Join Product p
ON f.ProductId = p.ProductId
GROUP BY f.ProductId, p.Product_Type
;

-- 21. Create a stored procedure to fetch the result according to the product type from Product Table.

CREATE PROCEDURE displayProductByType(
    @productType Varchar(256) = NULL
)
AS
BEGIN
    select * from Product where Product_Type = @productType;
END
GO

EXEC displayProductByType 'Coffee'

-- 22. Write a query by creating a condition in which if the total expenses is less than 60 then it is a profit or else loss.

select Date, ProductId, Total_Expenses, IIF(Total_Expenses < 60 , 'Yes', 'No') AS Is_Profitable
from Fact;

-- 23. Give the total weekly sales value with the date and product ID details. Use
-- roll-up to pull the data in hierarchical order.

SELECT Date, ProductID, SUM(Sales) AS total_weekly_sales
FROM Fact
GROUP BY ROLLUP(Date, ProductID);

--24. Apply union and intersection operator on the tables which consist of
-- attribute area code.

SELECT Area_Code FROM Fact
UNION
SELECT Area_Code FROM Location;

SELECT Area_Code FROM Fact
INTERSECT
SELECT Area_Code FROM Location;

-- 25. Create a user-defined function for the product table to fetch a particular
--    product type based upon the user’s preference.
CREATE FUNCTION udfGetProductDetailsByType(@productType varchar(256))
RETURNS TABLE AS
    RETURN  select * from Product where Product_Type = @productType;

select * from udfGetProductDetailsByType('Coffee')

-- 26. Change the product type from coffee to tea where product ID is 1 and undo it.
BEGIN TRAN updateProductType
select * from Product where Product_Type = 'Coffee' AND ProductId = 1;
update Product set Product_Type = 'Tea' where Product_Type = 'Coffee' AND ProductId = 1;
select * from Product where Product_Type = 'Coffee' AND ProductId = 1;
select * from Product where Product_Type = 'Tea' AND ProductId = 1;
ROLLBACK TRAN updateProductType

-- 27. Display the date, product ID and sales where total expenses are between 100 to 200.
select Date, ProductId,Sales from Fact where Total_Expenses BETWEEN 100 AND 200 ;

-- 28. Delete the records in the Product Table for regular type.
BEGIN TRAN deleteProductType
select * from Product where Type = 'Regular';
select * from Fact where ProductId In (Select ProductId from Product where Type = 'Regular');

delete from fact where ProductId In (Select ProductId from Product where Type = 'Regular')
delete from Product where Type = 'Regular';

select * from Fact where ProductId In (Select ProductId from Product where Type = 'Regular');
select * from Product where Type = 'Regular';

ROLLBACK TRAN deleteProductType


-- 29. Display the ASCII value of the fifth character from the column Product

SELECT ASCII(SUBSTRING(Product, 5, 1))  from Product;
