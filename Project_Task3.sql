use internshala_project;
select * from walmart_sales;

/* Task 3: Analyzing Customer Segmentation Based on Spending (6 Marks)
 Walmart wants to segment customers based on their average spending behavior. Classify customers into three
 tiers: High, Medium, and Low spenders based on their total purchase amounts.*/


WITH CustomerAvgSpending AS (
    SELECT `Customer ID`, ROUND(AVG(Total), 2) AS AvgSpent FROM walmart_sales GROUP BY `Customer ID`),
OverallAvg AS (
SELECT ROUND(AVG(AvgSpent), 2) AS OverallAvgSpent FROM CustomerAvgSpending)
SELECT c.`Customer ID`, c.AvgSpent,
    CASE 
        WHEN c.AvgSpent >= o.OverallAvgSpent + 25 THEN 'High'
        WHEN c.AvgSpent <= o.OverallAvgSpent - 25 THEN 'Low'
        ELSE 'Medium'
    END AS SpendingCategory
FROM CustomerAvgSpending c
CROSS JOIN OverallAvg o
ORDER BY AvgSpent DESC;
