Select * from [dbo].[Customer data]

-----Retrieve total customer from each region----
SELECT Region, COUNT(CustomerID) AS TotalCustomers
FROM [dbo].[Customer data]
GROUP By Region

-------Most Popular Subscription Type 
SELECT SubscriptionType, COUNT(CustomerID) AS TotalCustomers

FROM [dbo].[Customer data]

Group By SubscriptionType

-------Customers who cancel subscription within 6months
SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd

FROM [dbo].[Customer data]

WHERE Canceled = 'TRUE'

AND DATEDIFF(day, SubscriptionEnd, SubscriptionStart) <=180;

--------calculate average subscription
SELECT AVG(DATEDIFF(month, SubscriptionEnd, SubscriptionStart)) AS AvgSubscriptionDuration

From [dbo].[Customer data]

----------customers with subscription for more than 12months
SELECT CustomerID, CustomerName, SubscriptionStart, SubscriptionEnd

FROM [dbo].[Customer data]

WHERE DATEDIFF(day, SubscriptionEnd, SubscriptionStart) >365;

---------Total revenue by subscription
Select subscriptiontype, sum(revenue) AS TotalRevenue
From [dbo].[Customer data]
GROUP By SubscriptionType

---------Top 3 regions by subscription
Select TOP 3 region, count(subscriptionend) AS cancellations
From [dbo].[Customer data]
WHERE subscriptionend IS NOT NULL
Group By region 

---------total number of active and canceled subscription
SELECT Canceled, COUNT(CustomerID) AS TotalSubscriptions
From [dbo].[Customer data]
GROUP By Canceled