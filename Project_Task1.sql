use internshala_project;
select * from walmart_sales;

/*Task 1: Identifying the Top Branch by Sales Growth Rate (6 Marks)
 Walmart wants to identify which branch has exhibited the highest sales growth over time. Analyze the total sales for each branch 
 and compare the growth rate across months to find the top performer.*/
 
WITH MonthlySales AS (
SELECT Branch, DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS SaleMonth, SUM(Total) AS MonthlyTotal
FROM walmart_sales GROUP BY Branch, SaleMonth order by Branch),
GrowthCalc AS (
    SELECT Branch, SaleMonth, MonthlyTotal,
        LAG(MonthlyTotal) OVER (PARTITION BY Branch ORDER BY SaleMonth) AS PrevMonthTotal
    FROM MonthlySales),
GrowthRate AS (
    SELECT Branch, SaleMonth, MonthlyTotal, PrevMonthTotal,
CASE 
    WHEN PrevMonthTotal IS NULL OR PrevMonthTotal = 0 THEN 0
    ELSE ROUND(((MonthlyTotal - PrevMonthTotal) / PrevMonthTotal) * 100, 2)
END AS Growth_Percent
    FROM GrowthCalc)
SELECT Branch, round(AVG(Growth_Percent),2) AS Avg_Growth_Percent 
FROM GrowthRate
GROUP BY Branch
ORDER BY Avg_Growth_Percent DESC
limit 1;