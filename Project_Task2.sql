use internshala_project;
select * from walmart_sales;

/* Task 2: Finding the Most Profitable Product Line for Each Branch (6 Marks)
 Walmart needs to determine which product line contributes the highest profit to each branch.The profit margin
 should be calculated based on the difference between the gross income and cost of goods sold.*/

WITH ProductProfit AS (SELECT Branch, `Product line`,SUM(cogs - `gross income`) AS ProductLineProfit 
    FROM walmart_sales GROUP BY Branch, `Product line`),
RankedProfit AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY Branch ORDER BY ProductLineProfit DESC) AS ProfitRank
    FROM ProductProfit)
SELECT Branch, `Product line`, ProductLineProfit
FROM RankedProfit WHERE ProfitRank = 1 ORDER BY Branch;

