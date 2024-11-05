Select * from [dbo].[SalesData]

------Retrieve the total sales for each product category-----

SELECT Product, SUM(Quantity * UnitPrice) AS Total_Sales

FROM SalesData

GROUP By Product



-----Find the number of sales transactions in each region-----

SELECT Region, COUNT(*) AS Total_Sales_Value

FROM SalesData

GROUP By Region



------Find the highest-selling product by total sales value----

SELECT TOP 1 Product, Sum(Quantity * UnitPrice) AS Total_Sales_Value

FROM SalesData

GROUP By Product

ORDER By Total_Sales_Value DESC



-------Calculate total revenue per product-----

SELECT Product, Sum(Quantity * UnitPrice) as Total_Revenue

FROM SalesData

GROUP By Product

ORDER By 2 DESC



------Calculate monthly sales totals for the current year----

SELECT Month(OrderDate) AS month, sum (quantity * unitprice) AS monthly_sales_Total
From salesdata

where year(orderdate)= year(getdate())

Group By(orderdate) order by month



-----Find the top 5 customers by total purchase amount-----

SELECT TOP 5 Customer_Id, Sum(Quantity * UnitPrice) AS Total_Purchase_Amount

FROM SalesData

GROUP By Customer_Id

ORDER By 2 DESC



------Calculate the percentage of total sales contributed by each region----

SELECT Region,

	Round((Sum(Quantity * UnitPrice) / (SELECT SUM(CAST(Quantity * UnitPrice AS FLOAT)) FROM SalesData) * 100), 1) AS Percentage_Of_Total_Sales

FROM SalesData

GROUP By Region

---------Identify the product with no sales
SELECT DISTINCT Product from Salesdata
where product NOT IN(select DISTINCT Product from salesdata where Orderdate >=DATEADD(QUARTER, -1, GETDATE()))