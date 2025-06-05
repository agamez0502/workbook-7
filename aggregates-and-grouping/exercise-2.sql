-- 1. How many suppliers are there? Use a query! 
-- 29
SELECT 
	COUNT(*) AS "Total Suppliers"
FROM 
	suppliers;
-- 2. What is the sum of all the employee's salaries? 
-- 20362.929931640625
SELECT
	SUM(Salary) AS "Total Salary"
FROM 
	employees;
-- 3. What is the price of the cheapest item that Northwind sells? 
-- 2.5000
SELECT 
	MIN(UnitPrice) AS "Cheapest Item"
FROM 
	products;
-- 4. What is the average price of items that Northwind sells?  
-- 28.86636364
SELECT 
	AVG(UnitPrice) AS "Average Item Price"
FROM 
	products;
-- 5. What is the price of the most expensive item that Northwind sells? 
-- 263.5000
SELECT 
	MAX(UnitPrice) AS "Most Expensive Item"
FROM 
	products;
-- 6. What is the supplier ID of each supplier and the number of items they supply? 
-- You can answer this query by only looking at the Products table. 
SELECT 
	SupplierID
    , count(*) AS "Number of Items Supplied"
FROM 
	products
GROUP BY 
	SupplierID;
-- 7. What is the category ID of each category and the average price of each item in the category? 
-- You can answer this query by only looking at the Products table. 
SELECT 
	CategoryID
    , AVG(UnitPrice) AS "Average Item Price"
FROM 
	products
GROUP BY 
	CategoryID;
-- 8. For suppliers that provide at least 5 items to Northwind, what is the supplier ID of each supplier and the number of items they supply? 
-- You can answer this query by only looking at the Products table. 
SELECT 
	SupplierID
    , count(*) AS NumberofItemsSupplied
FROM 
	products 
GROUP BY 
	SupplierID
HAVING 
	NumberofItemsSupplied >= 5;
-- 9. List the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). 
-- Sort the results in descending order by value. If two or more have the same value, order by product name. 
SELECT 
	ProductID
    , ProductName
    , (UnitPrice * UnitsInStock) AS InventoryValue
FROM 
	products
ORDER BY 
	InventoryValue DESC
    , ProductName;