-- Query 3: Order Classification Using CASE
-- Classifies each order as High, Medium, or Low value

SELECT 
    "Order ID",
    "Customer Name",
    Category,
    Region,
    ROUND(Sales, 2) AS Sales,
    ROUND(Profit, 2) AS Profit,
    CASE 
        WHEN Sales > 1000 THEN 'High Value'
        WHEN Sales BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Order_Type,
    CASE
        WHEN Profit > 0 THEN 'Profitable'
        ELSE 'Loss'
    END AS Profit_Status
FROM superstore
ORDER BY Sales DESC;
