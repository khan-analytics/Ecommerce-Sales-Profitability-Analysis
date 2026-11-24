-- Which are the top 5 products by total revenue?
SELECT
	ProductName,
    SUM(Sales) AS Total_Revenue
FROM salesdata
GROUP BY ProductName
ORDER BY Total_Revenue DESC
LIMIT 5;
-- Which are the bottom 5 products by revenue?
SELECT
	ProductName,
    SUM(Sales) AS Total_Revenue
FROM salesdata
GROUP BY ProductName
ORDER BY Total_Revenue
LIMIT 5;
-- Which 5 products generate the highest profit?
SELECT
	ProductName,
    SUM(Profit) AS Total_Profit
FROM salesdata
GROUP BY ProductName
ORDER BY Total_Profit DESC
LIMIT 5;

-- Which products generate the lowest profit?
-- Which products have the highest sales quantity?
-- Which products have high sales but low profit?
-- Which products generate negative total profit?
-- Which products have a profit margin above 20%?
-- What percentage of total revenue does each product contribute?
-- Which products contribute to the top 80% of total revenue?