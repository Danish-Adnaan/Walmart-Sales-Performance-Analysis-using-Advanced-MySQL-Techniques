use internshala_project;
select distinct(city) from walmart_sales;

/* Task 5: Most Popular Payment Method by City (6 Marks)
 Walmart needs to determine the most popular payment method in each city to tailor marketing strategies.*/
 
 WITH PaymentCount AS (
    SELECT City, Payment, COUNT(*) AS PaymentCount
    FROM walmart_sales GROUP BY City, Payment),
RankedPayments AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY City ORDER BY PaymentCount DESC) AS rn
    FROM PaymentCount)
SELECT City, Payment AS Most_Popular_Payment, PaymentCount
FROM RankedPayments WHERE rn = 1 ORDER BY city, PaymentCount desc;
