use internshala_project;
select * from walmart_sales;

/* Task 10: Analyzing Sales Trends by Day of the Week (6 Marks)
 Walmart wants to analyze the sales patterns to determine which day of the week brings the highest sales.*/
 
 SELECT 
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS DayOfWeek,
    ROUND(SUM(Total), 2) AS TotalSales
FROM walmart_sales
GROUP BY DayOfWeek
ORDER BY TotalSales DESC;