-- Query 4: Identify Underperforming Regions Using HAVING
-- Finds regions where total profit is below threshold

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT "Order ID") AS Total_Orders,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin_Pct
FROM superstore
GROUP BY Region
HAVING Total_Profit < 50000
ORDER BY Total_Profit ASC;
