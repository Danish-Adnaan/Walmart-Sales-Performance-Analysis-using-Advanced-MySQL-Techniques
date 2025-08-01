use internshala_project;
select distinct(city) from walmart_sales;

/*Task 6: Monthly Sales Distribution by Gender (6 Marks)
 Walmart wants to understand the sales distribution between male and female customers on a monthly basis.*/

WITH SalesWithMonth AS (
    SELECT Gender, DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS SaleMonth, Round(SUM(Total),2) AS TotalSales
    FROM walmart_sales GROUP BY Gender, SaleMonth)
SELECT SaleMonth, Gender, TotalSales
FROM SalesWithMonth
ORDER BY SaleMonth, Gender;
