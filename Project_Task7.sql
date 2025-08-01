use internshala_project;
select distinct(city) from walmart_sales;

/* Task 7: Best Product Line by Customer Type (6 Marks)
 Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).*/

WITH ProductPreference AS (
    SELECT `Customer type`, `Product line`, COUNT(*) AS TransactionCount
    FROM walmart_sales GROUP BY `Customer type`, `Product line`),
RankedProducts AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY `Customer type` ORDER BY TransactionCount DESC) AS RankByPreference
    FROM ProductPreference)
SELECT `Customer type`, `Product line` AS PreferredProductLine, TransactionCount
FROM RankedProducts WHERE RankByPreference = 1;
