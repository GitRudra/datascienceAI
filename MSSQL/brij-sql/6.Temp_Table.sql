
CREATE TABLE #Avg_F(start_of_Month date, Avg_Sale DECIMAL(18,2), Avg_Profit DECIMAL(18,2))

INSERT INTO #Avg_F(start_of_Month,Avg_Sale,Avg_Profit) 
select dateadd(dd,1,eomonth([Date_of_Sales],-1)) as start_of_Month
      ,avg([Weekly_sales]) as Avg_Sale
       ,avg([Profit]) as Avg_Profit
	   from sales
group by dateadd(dd,1,eomonth([Date_of_Sales],-1))
SELECT * FROM #Avg_F

