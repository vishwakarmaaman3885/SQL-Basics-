                                     -- SQL Joins
-- Note : Create the following dummy tables in MySQL Workbench using CREATE FUNCTION-
      

create database SQL_ASS;
use SQL_ASS;

-- Table 1: Customers

create table Customers(
CustomerID int primary key, CustomerName varchar(50), City varchar(50));

insert into Customers(CustomerID, CustomerName, City)
values
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Nancy Miller', 'Houston'),
(5, 'Robert White', 'Miami');

select *
from customers;


--Table 2: Orders

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount INT
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);

select *
from orders;


-- Table 3: Payments

CREATE TABLE Payments (
    PaymentID VARCHAR(10) PRIMARY KEY,
    CustomerID INT,
    PaymentDate DATE,
    Amount INT
);

INSERT INTO Payments (PaymentID, CustomerID, PaymentDate, Amount)
VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

SELECT * FROM Payments;


-- Table 4: Employees

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID)
VALUES
(1, 'Alex Green', NULL),
(2, 'Brian Lee', 1),
(3, 'Carol Ray', 1),
(4, 'David Kim', 2),
(5, 'Eva Smith', 2);

SELECT * FROM Employees;


-- Question 1. Retrieve all customers who have placed at least one order.
-- Solution-

SELECT DISTINCT c.CustomerID, c.CustomerName, City 
FROM Customers c
INNER JOIN Orders o
  ON c.CustomerID = o.CustomerID;





-- Question 2. Retrieve all customers and their orders, including customers who have not placed any orders.
-- Solution

SELECT *
FROM Customers as c
left JOIN Orders as  o
ON c.CustomerID = o.CustomerID;


-- Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown 
-- customers.
-- Solution-

SELECT *
FROM Customers as c
right JOIN Orders as  o
ON c.CustomerID = o.CustomerID;


-- Question 4. Display all customers and orders, whether matched or not.
-- Solution-

-- SQL WORKBENCH NOT SUPPORT FULL OUTERNJOIN 
-- I CAN GO WITH- LEFT JOIN + UNION + RIGHT JOIN.

-- Customers with or without orders
-- Orders with or without customers

SELECT *
FROM Customers c
LEFT JOIN Orders o
  ON c.CustomerID = o.CustomerID

UNION

SELECT *
FROM Customers c
RIGHT JOIN Orders o
  ON c.CustomerID = o.CustomerID;
  
  
  
  -- Question 5. Find customers who have not placed any orders.
 --  Solution-
 
 
 SELECT c.CustomerID, c.CustomerName, City
FROM Customers c
LEFT JOIN Orders o
  ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;



-- Question 6. Retrieve customers who made payments but did not place any orders.
-- Solution-

select DISTINCT c.CustomerID, c.CustomerName, City 
from customers as c
inner join payments as p 
on c.CustomerID = p.CustomerID
left join  orders as o
on c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- Question 7. Generate a list of all possible combinations between Customers and Orders.
-- Solution


select *
from customers as c
cross join orders as o;


-- Question 8. Show all customers along with order and payment amounts in one table.
-- Solution-

SELECT c.CustomerID, c.CustomerName, c.City,
o.OrderID, o.Amount AS OrderAmount,
p.PaymentID, p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders  as o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments as p ON c.CustomerID = p.CustomerID;


-- Question 9. Retrieve all customers who have both placed orders and made payments.
-- Solution-

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders as o ON c.CustomerID = o.CustomerID
INNER JOIN Payments as p ON c.CustomerID = p.CustomerID;













