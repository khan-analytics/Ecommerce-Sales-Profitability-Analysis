USE ecommerce_sales_db;
SELECT * FROM salesdata LIMIT 10;
SELECT * FROM processed_data LIMIT 10;

DESCRIBE processed_data;

ALTER TABLE processed_data
-- MODIFY COLUMN Order_Date DATE,
MODIFY COLUMN Product_Name VARCHAR(255),
MODIFY COLUMN Category VARCHAR(100),
MODIFY COLUMN Region VARCHAR(100),
MODIFY COLUMN Quantity INT,
MODIFY COLUMN Sales DECIMAL(10,2),
MODIFY COLUMN Profit DECIMAL(10,2),
MODIFY COLUMN `Year` SMALLINT,
MODIFY COLUMN `Month` INT,
MODIFY COLUMN Month_Name VARCHAR(15),
MODIFY COLUMN `Quarter` VARCHAR(2),
MODIFY COLUMN `Year_Month` CHAR(7);

### A. Overall Sales Performance
-- 1. What are the total sales, total profit, and total quantity sold during the entire period?
SELECT
	SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit,
    SUM(quantity) AS Total_Quantity
FROM processed_data;

-- 2. How many transactions were recorded each year?
SELECT
	Year,
	COUNT(*) AS Total_Transaction
FROM processed_data
GROUP BY `Year`;
-- 3. What is the average sales value per transaction?
SELECT
	AVG(sales) AS Avg_Sales_Value
FROM processed_data;
SELECT
    SUM(sales) / COUNT(*) AS avg_sales_per_transaction
FROM processed_data;
-- 4. What is the overall profit margin of the business?
SELECT
	ROUND((SUM(profit)/SUM(sales))*100,2) AS Profit_Margin
FROM processed_data;

### B. Monthly Sales Trend
-- 5. What are the total sales for each month?
SELECT
	Month_Name,
    SUM(Sales) AS Total_Sales
FROM processed_data
GROUP BY Month_Name
ORDER BY Total_Sales DESC;


-- 6. Which month generated the highest sales?
SELECT
	Month_Name,
    Year,
    SUM(Sales) AS Total_Sales
FROM processed_data
GROUP BY Month_Name, Year
ORDER BY Total_Sales DESC
LIMIT 1;
-- 7. Which month generated the lowest sales?
SELECT
	Month_Name,
    Year,
    SUM(Sales) AS Total_Sales
FROM processed_data
GROUP BY Month_Name, Year
ORDER BY Total_Sales
LIMIT 1;
-- 8. How do monthly sales change from one month to the next?
-- FORMULA - MOM Growth% = (Current Month Sales - Privious Month Sales/ Privious Month Sales) * 100
WITH monthly_sales AS (
	SELECT
		`Year`,
		`Month`,
		SUM(Sales) AS Total_Sales
	FROM processed_data
	GROUP BY `Year`,`Month`
)
SELECT
	`Year`,
	`Month`,
	Total_Sales,
    LAG(Total_Sales) OVER(ORDER BY `Year`, `Month`) AS Previous_Month_Sales,
    ROUND(((Total_Sales - LAG(Total_Sales) OVER(ORDER BY `Year`, `Month`)) / LAG(Total_Sales) OVER(ORDER BY `Year`, `Month`)) * 100,2) AS mom_growth_pct
FROM monthly_sales;
    
-- 9. Are there any months where sales consistently increase or decrease across the three years?
WITH monthly_sales AS(
SELECT
	Month,
	Month_Name,
	Year,
	SUM(Sales) AS total_sales
FROM processed_data
GROUP BY Month, Month_Name, Year
),
sales_trend AS (
SELECT
	Month,
	Month_Name,
	Year,
	total_sales,
	LAG(total_sales) OVER (PARTITION BY Month ORDER BY Year) AS prev_year_sales
FROM monthly_sales
)
SELECT
    Month,
    Month_Name,
    MIN(total_sales) AS min_sales,
    MAX(total_sales) AS max_sales,
    CASE
        WHEN COUNT(CASE WHEN total_sales > prev_year_sales THEN 1 END) = COUNT(prev_year_sales)
            THEN 'Consistently Increasing'
        WHEN COUNT(CASE WHEN total_sales < prev_year_sales THEN 1 END) = COUNT(prev_year_sales)
            THEN 'Consistently Decreasing'
        ELSE 'No Consistent Trend'
    END AS trend
FROM sales_trend
GROUP BY Month, Month_Name
HAVING trend <> 'No Consistent Trend'
ORDER BY Month;


SELECT
    Month,
    Month_Name,

    SUM(CASE WHEN Year = 2022 THEN Sales END) AS Sales_2022,
    SUM(CASE WHEN Year = 2023 THEN Sales END) AS Sales_2023,
    SUM(CASE WHEN Year = 2024 THEN Sales END) AS Sales_2024,

    ROUND(
        (
            SUM(CASE WHEN Year = 2023 THEN Sales END)
            - SUM(CASE WHEN Year = 2022 THEN Sales END)
        ) * 100.0
        / SUM(CASE WHEN Year = 2022 THEN Sales END),
        2
    ) AS Growth_22_23_Pct,

    ROUND(
        (
            SUM(CASE WHEN Year = 2024 THEN Sales END)
            - SUM(CASE WHEN Year = 2023 THEN Sales END)
        ) * 100.0
        / SUM(CASE WHEN Year = 2023 THEN Sales END),
        2
    ) AS Growth_23_24_Pct,

    CASE
        WHEN SUM(CASE WHEN Year = 2022 THEN Sales END)
           < SUM(CASE WHEN Year = 2023 THEN Sales END)
         AND SUM(CASE WHEN Year = 2023 THEN Sales END)
           < SUM(CASE WHEN Year = 2024 THEN Sales END)
        THEN 'Increasing'

        WHEN SUM(CASE WHEN Year = 2022 THEN Sales END)
           > SUM(CASE WHEN Year = 2023 THEN Sales END)
         AND SUM(CASE WHEN Year = 2023 THEN Sales END)
           > SUM(CASE WHEN Year = 2024 THEN Sales END)
        THEN 'Decreasing'

        ELSE 'Mixed'
    END AS Trend

FROM processed_data
GROUP BY Month, Month_Name
ORDER BY Month;

### C. Monthly Profit Trend
-- 10. What is the total profit generated each month?
SELECT 
	YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
	SUM(Profit) AS Toal_Profit
FROM processed_data
GROUP BY Year, Month;

SELECT
    YEAR(Order_Date) AS Year,
    MONTHNAME(Order_Date) AS Month,
    SUM(Profit) OVER (PARTITION BY Year, Month) AS Total_Profit
FROM processed_data
ORDER BY YEAR(Order_Date), MONTHNAME(Order_Date);
-- 11. Which month generated the highest and lowest profit?
-- 12. Are there months where sales are high but profit is comparatively low?
-- 13. How does monthly profit margin change over time?

### D. Yearly Performance
-- 14. Which year generated the highest revenue?
-- 15. Which year generated the highest profit?
-- 16. What was the year-over-year sales growth?
-- 17. What was the year-over-year profit growth?
-- 18. Is profit growing at the same rate as sales?

### E. Quarterly Performance
-- 19. Which quarter generated the highest sales?
-- 20. Which quarter generated the highest profit?
-- 21. How does quarterly performance differ across 2022, 2023, and 2024?
-- 22. Which quarter has the lowest profit margin?

### F. Business Insights
-- 23. Identify the top three months based on sales.
-- 24. Identify the bottom three months based on sales.
-- 25. Find months where sales increased but profit decreased compared with the previous month.
-- 26. Identify months with a profit margin below the overall business margin.
-- 27. Which year showed the strongest overall business performance considering sales, profit, and profit margin?
