-- Total records
SELECT COUNT(*) AS Total_Record
FROM salesdata;

-- Rename Columns 
ALTER TABLE salesdata RENAME COLUMN `Product Name` TO ProductName;

-- Identify products
SELECT DISTINCT ProductName
FROM salesdata;

-- Identify categories
SELECT DISTINCT Category
FROM salesdata;

-- Identify regions
SELECT DISTINCT Region
FROM salesdata;

-- Understand date range
SELECT
	MIN(`Order Date`) AS First_Order,
    max(`Order Date`) AS Last_Order
FROM salesdata;



