show databases;
use Practice;

-- Step 1: Create the Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Step 2: Insert Data into the Tables
INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'Amit Sharma', 'Amit', 'India'),
(2, 'Priya Kumar', 'Priya', 'India'),
(3, 'Raj Patel', 'Raj', 'India');

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 50000.00),
(2, 'Smartphone', 20000.00),
(3, 'Tablet', 15000.00);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, 1, '2024-08-10', 1),
(2, 2, 2, '2024-08-11', 2),
(3, 3, 3, '2024-08-12', 3);

Select * 
from Orders;

-- Step 3: Perform a JOIN Operation
SELECT 
    Customers.CustomerName,
    Orders.OrderDate,
    Products.ProductName,
    Orders.Quantity,
    Products.Price,
    (Orders.Quantity * Products.Price) AS TotalPrice
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN 
    Products ON Orders.ProductID = Products.ProductID;

-- Step 4: Demonstrate a Subquery
-- Find all customers who have placed orders for products costing more than 20,000
SELECT 
    CustomerName 
FROM 
    Customers
WHERE 
    CustomerID IN (
        SELECT 
            Orders.CustomerID 
        FROM 
            Orders
        JOIN 
            Products ON Orders.ProductID = Products.ProductID
        WHERE 
            Products.Price > 20000 
    );
    
    SELECT 
    CustomerName 
FROM 
    Customers
WHERE 
    CustomerID = 1;
    
    
    SELECT CustomerName,
    (SELECT SUM(Orders.Quantity) 
     FROM Orders 
     WHERE Orders.CustomerID = Customers.CustomerID) AS TotalQuantity
FROM Customers;


SELECT CustomerName,
    (SELECT MAX(OrderDate) 
     FROM Orders 
     WHERE Orders.CustomerID = Customers.CustomerID) AS LastOrderDate
FROM Customers;
