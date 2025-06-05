-- 1. Add a new supplier. 
INSERT INTO suppliers (
	SupplierID
    , CompanyName
    , ContactName
    , ContactTitle
    , Address
    , City
    , Region
    , PostalCode
    , Country
    , Phone
    , Fax 
    , HomePage
) VALUES (
    30
    , "Nuevo Sabor A.G."
    , "Alondra Gamez"
    , "Owner"
    , "Av. Revolución 123"
    , "Mexico City"
    , NULL
    , "01234"
    , "Mexico"
    , "+52-55-1234-5678"
    , NULL
    , NULL
);
-- 2. Add a new product provided by that supplier 
INSERT INTO products (
    ProductName,
    SupplierID,
    CategoryID,
    QuantityPerUnit,
    UnitPrice,
    UnitsInStock,
    UnitsOnOrder,
    ReorderLevel,
    Discontinued
) VALUES (
    "Tamarindo Soda"
    , 30              
    , 1               
    , "24 bottles x 350ml"
    , 12.50
    , 100
    , 0
    , 10
    , 0           
);
-- 3. List all products and their suppliers. 
SELECT 
	ProductID
    , ProductName
    , CompanyName AS SupplierName
FROM 
	products
JOIN 
	suppliers ON products.SupplierID = suppliers.SupplierID 
ORDER BY 
	ProductName;
-- 4. Raise the price of your new product by 15%. 
UPDATE 
	products
SET 
	UnitPrice = UnitPrice * 1.15
WHERE 
	ProductName = "Tamarindo Soda";
-- 5. List the products and prices of all products from that supplier. 
SELECT 
	ProductName 
    , UnitPrice 
    , SupplierID
FROM 
	products
WHERE 
	SupplierID = 30;
-- 6. Delete the new product.
DELETE FROM 
	products
WHERE
	SupplierID = 30;
-- 7. Delete the new supplier. 
DELETE FROM 
	suppliers
WHERE
	SupplierID = 30;
-- 8. List all products.  
SELECT 
	ProductName AS Products
FROM 
	products;
-- 9. List all suppliers. 
SELECT 
	CompanyName AS Suppliers
FROM 
	suppliers;