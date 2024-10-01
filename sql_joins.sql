-- Create a new database named 'my_database'
CREATE DATABASE Ecom;

-- Use the newly created database
USE Ecom;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT
);

-- Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(100),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);

-- Shippers Table
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    ShipperName VARCHAR(100),
    Phone VARCHAR(20)
);

-- Regions Table
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionDescription VARCHAR(100)
);

-- Territories Table
CREATE TABLE Territories (
    TerritoryID INT PRIMARY KEY,
    TerritoryDescription VARCHAR(100),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Regions(RegionID)
);


Select * from Territories;
Select * from Regions;
Select * from Shippers;
Select * from Employees;
Select * from Suppliers;
Select * from Products;
Select * from OrderDetails;
Select * from Customers;
Select * from Orders;
Select * from Categories;







INSERT INTO Regions (RegionID, RegionDescription) VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');


INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID) VALUES
(101, 'California', 1),
(102, 'New York', 1),
(201, 'Germany', 2),
(202, 'France', 2),
(301, 'China', 3),
(302, 'Japan', 3);



INSERT INTO Employees (EmployeeID, FirstName, LastName, Title, RegionID) VALUES
(1, 'John', 'Doe', 'Sales Manager', 1),
(2, 'Jane', 'Smith', 'Sales Representative', 1),
(3, 'Emily', 'Davis', 'Marketing Manager', 2),
(4, 'Michael', 'Brown', 'Sales Representative', 2),
(5, 'Sarah', 'Wilson', 'Sales Representative', 3),
(6, 'David', 'Taylor', 'Sales Manager', 3);



-- Modify Employees Table to add ManagerID
ALTER TABLE Employees ADD COLUMN ManagerID INT NULL,
ADD FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID);

-- Update ManagerID for employees
UPDATE Employees SET ManagerID = 1 WHERE EmployeeID IN (2, 6);
UPDATE Employees SET ManagerID = 3 WHERE EmployeeID IN (4, 5);

commit;


INSERT INTO Shippers (ShipperID, ShipperName, Phone) VALUES
(1, 'FastShip', '123-456-7890'),
(2, 'QuickDelivery', '234-567-8901'),
(3, 'GlobalExpress', '345-678-9012');


INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Country) VALUES
(1, 'Supplier A', 'Alice Johnson', 'USA'),
(2, 'Supplier B', 'Bob Lee', 'Germany'),
(3, 'Supplier C', 'Charlie Kim', 'China');


INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Electronics', 'Electronic devices and gadgets'),
(2, 'Furniture', 'Office and home furniture'),
(3, 'Clothing', 'Apparel for men and women');


INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, UnitPrice) VALUES
(1, 'Laptop', 1, 1, 1200.00),
(2, 'Smartphone', 1, 1, 800.00),
(3, 'Office Chair', 2, 2, 150.00),
(4, 'Desk', 2, 2, 300.00),
(5, 'T-Shirt', 3, 3, 20.00),
(6, 'Jeans', 3, 3, 40.00);


INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country) VALUES
(1, 'TechStore', 'Tom Hardy', 'USA'),
(2, 'HomeComfort', 'Helen Clark', 'Germany'),
(3, 'FashionHub', 'Frank Miller', 'China'),
(4, 'GadgetWorld', 'Gary White', 'USA'),
(5, 'FurniturePlus', 'Fiona Green', 'France');


INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) VALUES
(1001, 1, 2, '2024-01-15', 1),
(1002, 2, 4, '2024-02-20', 2),
(1003, 3, 5, '2024-03-05', 1),
(1004, 1, 2, '2024-04-10', 3),
(1005, 4, 2, '2024-05-22', 1),
(1006, 5, 6, '2024-06-18', 2);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(5001, 1001, 1, 2, 1200.00),
(5002, 1001, 3, 5, 150.00),
(5003, 1002, 2, 3, 800.00),
(5004, 1003, 5, 10, 20.00),
(5005, 1004, 4, 2, 300.00),
(5006, 1005, 6, 4, 40.00),
(5007, 1006, 1, 1, 1200.00),
(5008, 1006, 2, 2, 800.00);


Select * from Territories;
Select * from Regions;
Select * from Shippers;
Select * from Employees;
Select * from Suppliers;
Select * from Products;
Select * from OrderDetails;
Select * from Customers;
Select * from Orders;
Select * from Categories;

Select o.OrderID, c.CustomerName, o.OrderDate
from Orders o 
Inner join Customers c on o.CustomerID = c.CustomerID;


Select c.CustomerName, o.OrderID, o.OrderDate
from Orders o 
Left join Customers c on o.CustomerID = c.CustomerID;


Select s.ShipperName, o.OrderID, o.OrderDate
from Orders o 
Right join Shippers s on o.ShipperID = s.ShipperID;

Select c.CustomerName, s.ShipperName
from Customers c 
cross join Shippers s;



