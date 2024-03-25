/*

Task 1 : Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.

*/
CREATE PROCEDURE displayResturant
AS
BEGIN
    select RestaurantName, RestaurantType, CuisinesType from Jomato where TableBooking = 'No';
END
GO


/*

Task 2 : Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.

*/

BEGIN TRAN updatecuisine
select * from Jomato where CuisinesType = 'Cafe';
update Jomato set CuisinesType = 'Cafe' where CuisinesType = 'Cafeteria';
select * from Jomato where CuisinesType like 'Cafe%';
ROLLBACK TRAN updatecuisine


/*

Task 3: Generate a row number column and find the top 5 areas with the highest rating of
restaurants.

*/

SELECT TOP 5 * FROM 
(
    select TOP(1) with TIES 
    Rating,Area,   ROW_NUMBER() OVER (Partition by Area ORDER BY Rating desc) AS RatingRank
    from Jomato
    ORDER BY  
    ROW_NUMBER()OVER(PARTITION  BY Area ORDER BY Rating desc)
) AS T
order by Rating desc;


/*

Task 4: Use the while loop to display the 1 to 50.

*/

DECLARE @counter INT
SET @counter=0
WHILE (@counter<100)
BEGIN
SET @counter=@counter+1
PRINT @counter
END



/*

Task 5: Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants

*/

CREATE VIEW Top_Rating as 
SELECT TOP 5 * FROM 
(
    select TOP(1) with TIES 
    Rating,Area,   ROW_NUMBER() OVER (Partition by Area ORDER BY Rating desc) AS RatingRank
    from Jomato
    ORDER BY  
    ROW_NUMBER()OVER(PARTITION  BY Area ORDER BY Rating desc)
) AS T
order by Rating desc;



/*

Task 6: Write a trigger that sends an email notification to the restaurant owner whenever a new
record is inserted.

*/

CREATE TRIGGER TRG_SEND_EMAIL_TO_OWNER
ON Jomato
AFTER INSERT
AS
BEGIN
    DECLARE @insertedOrderId INT
    SELECT insertedOrderId = INSERTED.OrderId from INSERTED;

    declare @body  VARCHAR(MAX ) = 'New order created. Order Id :' + CAST(@insertedOrderId AS VARCHAR(500))
    EXEC msdb.dbo.sp_send_dbmail
            @profile_name = 'New Order Created'
           ,@recipients = 'INSERTED@gmail.com'
           ,@subject = 'New Customer Record'
           ,@body = @body
           ,@importance ='HIGH'
END