-- Check missing values
SELECT
	COUNT(*) AS Total_Records,
    SUM(`Order Date` IS NULL) AS Missing_Dates,
    SUM(ProductName IS NULL) AS Missing_Product_Name,
    SUM(Category IS NULL) AS Missing_Category,
    SUM(Region IS NULL) AS Missing_Region,
    SUM(Quantity IS NULL) AS Missing_Quantity,
    SUM(Sales IS NULL) AS Missing_Sales,
    SUM(Profit IS NULL) AS Missing_Profit
FROM salesdata;

-- Check duplicate records
SELECT
    `Order Date`,
    ProductName,
    Category,
    Region,
    Quantity,
    Sales,
    Profit,
    COUNT(*) AS duplicate_count
FROM salesdata
GROUP BY
    `Order Date`,
    ProductName,
    Category,
    Region,
    Quantity,
    Sales,
    Profit
HAVING COUNT(*) > 1;