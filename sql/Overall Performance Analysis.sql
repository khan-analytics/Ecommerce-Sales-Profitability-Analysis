-- Total transactions
SELECT COUNT(*) AS Total_Trasaction FROM salesdata;

-- average transaction value?
-- SELECT AVG(*) AS Total_Trasaction FROM salesdata;

-- What is the total sales revenue?
SELECT SUM(Sales) AS Total_Revenue FROM salesdata;

-- What is the total profit?
SELECT SUM(Profit) AS Total_Revenue FROM salesdata;

-- What is the total Quantity?
SELECT SUM(Quantity) AS Total_Revenue FROM salesdata;


