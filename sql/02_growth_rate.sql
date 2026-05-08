-- Query 2: Month-over-Month Growth Rate (Using Subquery)
-- Compares each month's sales to the previous month

SELECT 
    t1.Year_Month,
    t1.Monthly_Sales,
    t2.Monthly_Sales AS Prev_Month_Sales,
    ROUND(t1.Monthly_Sales - t2.Monthly_Sales, 2) AS Sales_Variance,
    ROUND((t1.Monthly_Sales - t2.Monthly_Sales) / t2.Monthly_Sales * 100, 2) AS Growth_Percentage
FROM 
    (SELECT 
        SUBSTR("Order Date", 7, 4) || '-' || SUBSTR("Order Date", 1, 2) AS Year_Month,
        SUBSTR("Order Date", 7, 4) AS Year,
        SUBSTR("Order Date", 1, 2) AS Month,
        ROUND(SUM(Sales), 2) AS Monthly_Sales
     FROM superstore
     GROUP BY Year, Month) t1
JOIN 
    (SELECT 
        SUBSTR("Order Date", 7, 4) || '-' || SUBSTR("Order Date", 1, 2) AS Year_Month,
        SUBSTR("Order Date", 7, 4) AS Year,
        SUBSTR("Order Date", 1, 2) AS Month,
        ROUND(SUM(Sales), 2) AS Monthly_Sales
     FROM superstore
     GROUP BY Year, Month) t2
ON t1.Year = t2.Year AND CAST(t1.Month AS INTEGER) = CAST(t2.Month AS INTEGER) + 1
ORDER BY t1.Year, t1.Month;
