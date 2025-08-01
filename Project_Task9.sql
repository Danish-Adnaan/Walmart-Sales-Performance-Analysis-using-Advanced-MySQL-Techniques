use internshala_project;
select * from walmart_sales;

/* Task 9: Finding Top 5 Customers by Sales Volume (6 Marks)
 Walmart wants to reward its top 5 customers who have generated the most sales Revenue.*/
 
 SELECT 
    `Customer ID`, ROUND(SUM(Total), 2) AS TotalRevenue
FROM walmart_sales
GROUP BY `Customer ID`
ORDER BY TotalRevenue DESC
LIMIT 5;


