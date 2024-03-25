------------------------------Question 1 ---------------------------------------
/*
    Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick
Chicken Bites’.
*/

DROP FUNCTION stuff_burger;
GO

CREATE FUNCTION stuff_burger(@burger varchar(256) , @stuffing varchar(256))
RETURNS varchar(256) AS 
BEGIN
    RETURN  CONCAT(Left(@burger,CHARINDEX(' ', @burger)-1),' ', @stuffing, ' ',  RIGHT(@burger, CHARINDEX(' ',@burger)-1));
END;

GO
select dbo.stuff_burger('Quick Bites', 'chicken');


/*

CREATE FUNCTION get_resturant_by_rating (
	@rating DECIMAL(9,6)
)
RETURNS TABLE AS
RETURN
	SELECT RestaurantName, CuisinesType
	FROM Jomato j
	WHERE j.Rating > @rating
;
GO
select * from get_resturant_by_rating(4.0);
GO
DROP FUNCTION IF EXISTS get_resturant_by_rating
GO

*/


------------------------------Question 2---------------------------------------
/*

Use the function to display the restaurant name and cuisine type which has the
maximum number of rating.

*/

CREATE FUNCTION get_resturant_for_max_rating ()
RETURNS TABLE AS
RETURN
    WITH MAXRATING AS(
    select MAX(Rating) AS MAX_RATING from Jomato
    )
	SELECT RestaurantName, CuisinesType
	from Jomato 
    INNER JOIN MAXRATING
    ON Rating = MAXRATING.MAX_RATING
;
GO
select * from get_resturant_for_max_rating();
GO
DROP FUNCTION IF EXISTS get_resturant_for_max_rating


------------------------------Question 3---------------------------------------

/*

Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating

*/

--Note: The question is ambiguous in Excelent and Good case

alter table Jomato add RatingStatus varchar(100);

UPDATE Jomato 
set RatingStatus =  CASE 
                        WHEN Rating >= 4 THEN 'Excelent'
                        WHEN Rating>=3.5 AND Rating <4 THEN 'Good'
                        WHEN Rating>=3 AND Rating <3.5 THEN 'Average'
                        ELSE 'BAD'
                    END;

------------------------------Question 4---------------------------------------
/*
Find the Ceil, floor and absolute values of the rating column and display the current date
and separately display the year, month_name and day
*/

SELECT 
-- Rating, 
FLOOR(Rating) AS RatingFloor, 
CEILING(Rating) AS CelingFloor, 
ABS(Rating) RatingAbs,
GETDATE() AS CurrentDate,
DATENAME(year, GETDATE()) AS CurrentYear,
DATENAME(month, GETDATE()) AS CurrentMonth,
DATENAME(day, GETDATE()) AS CurrentDay
From Jomato
;

------------------------------Question 5---------------------------------------

-- Display the restaurant type and total average cost using rollup
SELECT RestaurantType, SUM(AverageCost) 
From Jomato
GROUP BY RestaurantType;



------------------------------Question 5---------------------------------------