-- 1. List the product id, product name, unit price and category name of all products. 
-- Order by category name and within that, by product name. 
SELECT 
	ProductID
    , ProductName
    , UnitPrice
    , CategoryName
FROM 
	products
JOIN 
	categories ON products.CategoryID = categories.CategoryID
ORDER BY
	CategoryName
    , ProductName;
-- 2. List the product id, product name, unit price and supplier name of all products that cost more than $75.
-- Order by product name. 
SELECT
	ProductID
    , ProductName
    , UnitPrice
    , CompanyName AS "Supplier Name"
FROM 
	products
JOIN 
	suppliers ON products.SupplierID = suppliers.SupplierID
WHERE 
	UnitPrice > 75
ORDER BY
	ProductName;
-- 3. List the product id, product name, unit price, category name, and supplier name of every product.  
-- Order by product name. 
SELECT 
	ProductID
    , ProductName
    , UnitPrice
    , CategoryName 
    , CompanyName AS "Supplier Name"
FROM 
	products
JOIN 
	categories ON products.CategoryID = categories.CategoryID
JOIN 
	suppliers ON products.SupplierID = suppliers.SupplierID
ORDER BY
	ProductName;
-- 4. What is the product name(s) and categories of the most expensive products?  
-- HINT: Find the max price in a subquery and then use that in your more complex query that joins products with categories.
 SELECT 
	ProductName
    , CategoryName
    , UnitPrice
 FROM 
	products
JOIN 
	categories ON products.CategoryID = categories.CategoryID
WHERE
	UnitPrice = (SELECT MAX(UnitPrice) FROM products);
-- 5. List the order id, ship name, ship address, and shipping company name of every order that shipped to Germany. 
SELECT 
	OrderID
    , ShipName
    , ShipAddress
    , CompanyName AS "Shipping Company"
    , ShipCountry
FROM 
	orders
JOIN
	shippers ON shippers.ShipperID = orders.ShipVia
WHERE 
	ShipCountry = "Germany";
-- 6. List the order id, order date, ship name, ship address of all orders that ordered "Sasquatch Ale"?  
SELECT 
	orders.OrderID
    , OrderDate
    , ShipName
    , ShipAddress
    , ProductName
FROM 
	orders
JOIN
	`order details` od ON od.OrderID = orders.OrderID
JOIN 
	products ON products.ProductID = od.ProductID
WHERE
	ProductName = "Sasquatch Ale";