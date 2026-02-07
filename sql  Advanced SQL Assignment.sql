
                                 --  Advanced SQL
							--     Assignment Questions

-- Dataset (Use for Q6–Q9)

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert data into Products
INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data into Sales
INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

select *
from products;

select *
from sales;


-- Q6. Write a CTE to calculate the total revenue for each product 
-- (Revenues = Price × Quantity), and return only products where  revenue > 3000.

-- Solution-

WITH ProductRevenue AS (SELECT 
p.ProductID,p.ProductName,SUM(p.Price * s.Quantity) AS total_revenue
FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName)
SELECT ProductID, ProductName, total_revenue
FROM ProductRevenue
WHERE total_revenue > 3000;




-- Q7. Create a view named  vw_CategorySummary 
-- that shows: Category, TotalProducts, AveragePrice.

-- Solution:-

CREATE VIEW vw_CategorySummary AS
SELECT Category,COUNT(ProductID) AS TotalProducts,
AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;



-- Q8. Create an updatable view containing ProductID, ProductName, and Price.
-- Then update the price of ProductID = 1 using the view.
-- Solution-

CREATE VIEW vw_ProductInfo AS
SELECT ProductID, ProductName, Price
FROM Products;

UPDATE vw_ProductInfo
SET Price = 1500
WHERE ProductID = 1;

SELECT * FROM Products;



-- Q9. Create a stored procedure that accepts a category name and returns all products belonging to that 
-- category.
-- Solution-


DELIMITER $$

CREATE PROCEDURE GetProductsByCategory(IN categoryName VARCHAR(50))
BEGIN
    SELECT ProductID, ProductName, Price
    FROM Products
    WHERE Category = categoryName;
END $$

DELIMITER ;


CALL GetProductsByCategory('Electronics');



-- Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new 
-- table ProductArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt 
-- timestamp.

-- Solution:-

CREATE TABLE ProductArchive (ProductID INT,ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2),
DeletedAt TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER ArchiveDeletedProducts
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
INSERT INTO ProductArchive (ProductID, ProductName, Category, Price, DeletedAt)
VALUES (OLD.ProductID, OLD.ProductName, OLD.Category, OLD.Price, NOW());
END $$

DELIMITER ;


DELETE FROM Sales WHERE ProductID = 2;
DELETE FROM Products WHERE ProductID = 2;























