use internshala_project;
select * from walmart_sales;

/*Task 4: Detecting Anomalies in Sales Transactions (6 Marks)
Walmart suspects that some transactions have unusually high or low sales compared to the average for the
 product line. Identify these anomalies.*/
 WITH ProductLineAvg AS (
    SELECT `Product line`, AVG(Total) AS AvgTotal FROM walmart_sales GROUP BY `Product line`)
SELECT ws.`Invoice ID`, ws.`Product line`, ws.Total, pla.AvgTotal,
    CASE 
        WHEN ws.Total > 1.5 * pla.AvgTotal THEN 'High Anomaly'
        WHEN ws.Total < 0.5 * pla.AvgTotal THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS AnomalyFlag
FROM walmart_sales ws
JOIN ProductLineAvg pla
  ON ws.`Product line` = pla.`Product line`
WHERE 
    ws.Total > 2.50 * pla.AvgTotal OR ws.Total < 0.1 * pla.AvgTotal;