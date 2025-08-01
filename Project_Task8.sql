use internshala_project;
select * from walmart_sales;

/* Task 8: Identifying Repeat Customers (6 Marks)
 Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30 days).*/

WITH CustomerDates AS (
    SELECT `Customer ID`, STR_TO_DATE(Date, '%d-%m-%Y') AS PurchaseDate, ROW_NUMBER() OVER (PARTITION BY `Customer ID` ORDER BY STR_TO_DATE(Date, '%d-%m-%Y')) AS rn
    FROM walmart_sales),
RepeatPurchaseCheck AS (
SELECT a.`Customer ID`, a.PurchaseDate AS CurrentPurchase, b.PurchaseDate AS PreviousPurchase, DATEDIFF(a.PurchaseDate, b.PurchaseDate) AS DaysBetween
    FROM CustomerDates a
    JOIN CustomerDates b 
      ON a.`Customer ID` = b.`Customer ID`
     AND a.rn = b.rn + 1)
SELECT DISTINCT `Customer ID` 
FROM RepeatPurchaseCheck WHERE DaysBetween <= 30;
