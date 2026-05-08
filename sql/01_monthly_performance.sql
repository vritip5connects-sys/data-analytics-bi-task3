-- Query 1: Monthly Performance Analysis
-- Shows total sales and profit grouped by year and month

SELECT 
    SUBSTR("Order Date", 7, 4) AS Year,
    SUBSTR("Order Date", 1, 2) AS Month,
    SUBSTR("Order Date", 7, 4) || '-' || SUBSTR("Order Date", 1, 2) AS Year_Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore
GROUP BY Year, Month
ORDER BY Year, Month;
