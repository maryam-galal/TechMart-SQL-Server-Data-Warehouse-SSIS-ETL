/* =========================================================
   TECHMART DATA WAREHOUSE PROJECT
   SOURCE DATABASES

   Databases:
       1. TechMart_Alex
       2. TechMart_Cairo

   Each database contains:
       - Customers
       - Employees
       - Products
       - Orders
       - OrderDetails
   ========================================================= */


/* =========================================================
   1. CREATE SOURCE DATABASES
   ========================================================= */

IF DB_ID('TechMart_Alex') IS NULL
BEGIN
    CREATE DATABASE TechMart_Alex;
END;
GO

IF DB_ID('TechMart_Cairo') IS NULL
BEGIN
    CREATE DATABASE TechMart_Cairo;
END;
GO


/* =========================================================
   2. CREATE ALEXANDRIA SOURCE DATABASE TABLES
   ========================================================= */

USE TechMart_Alex;
GO


/* -------------------------
   Customers
   ------------------------- */

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    RegistrationDate DATE
);
GO


/* -------------------------
   Employees
   ------------------------- */

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
GO


/* -------------------------
   Products
   ------------------------- */

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT
);
GO


/* -------------------------
   Orders
   ------------------------- */

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(30),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO


/* -------------------------
   OrderDetails
   ------------------------- */

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
GO


/* =========================================================
   3. INSERT ALEXANDRIA CUSTOMERS
   ========================================================= */

INSERT INTO Customers
(
    CustomerID,
    CustomerName,
    Phone,
    Email,
    City,
    RegistrationDate
)
VALUES
(1, 'Ahmed Ali',
    '01010000001',
    'ahmed@gmail.com',
    'Alexandria',
    '2026-01-10'),

(2, 'Mohamed Hassan',
    '01010000002',
    'mohamed@gmail.com',
    'Alexandria',
    '2026-01-15'),

(3, 'Omar Mahmoud',
    '01010000003',
    'omar@gmail.com',
    'Alexandria',
    '2026-02-01'),

(4, 'Youssef Adel',
    '01010000004',
    'youssef@gmail.com',
    'Alexandria',
    '2026-02-10');
GO


/* =========================================================
   4. INSERT ALEXANDRIA EMPLOYEES
   ========================================================= */

INSERT INTO Employees
(
    EmployeeID,
    EmployeeName,
    JobTitle,
    Phone,
    Email
)
VALUES
(1, 'Mostafa Ahmed',
    'Sales Representative',
    '01110000001',
    'mostafa@techmart.com'),

(2, 'Amr Khaled',
    'Sales Representative',
    '01110000002',
    'amr@techmart.com'),

(3, 'Hany Samir',
    'Branch Manager',
    '01110000003',
    'hany@techmart.com');
GO


/* =========================================================
   5. INSERT ALEXANDRIA PRODUCTS
   ========================================================= */

INSERT INTO Products
(
    ProductID,
    ProductName,
    Category,
    Brand,
    UnitPrice,
    StockQuantity
)
VALUES
(1, 'iPhone 15',
    'Smartphones',
    'Apple',
    45000,
    20),

(2, 'Samsung Galaxy S24',
    'Smartphones',
    'Samsung',
    35000,
    25),

(3, 'MacBook Air M3',
    'Laptops',
    'Apple',
    65000,
    10),

(4, 'Dell Latitude 5540',
    'Laptops',
    'Dell',
    42000,
    15),

(5, 'AirPods Pro',
    'Accessories',
    'Apple',
    10000,
    30),

(6, 'Logitech Mouse',
    'Accessories',
    'Logitech',
    1500,
    50);
GO


/* =========================================================
   6. INSERT ALEXANDRIA ORDERS
   ========================================================= */

INSERT INTO Orders
(
    OrderID,
    CustomerID,
    EmployeeID,
    OrderDate,
    OrderStatus
)
VALUES
(1, 1, 1, '2026-09-01 10:30:00', 'Completed'),

(2, 2, 2, '2026-09-02 12:15:00', 'Completed'),

(3, 3, 1, '2026-09-03 14:20:00', 'Completed'),

(4, 4, 3, '2026-09-05 16:00:00', 'Pending');
GO


/* =========================================================
   7. INSERT ALEXANDRIA ORDER DETAILS
   ========================================================= */

INSERT INTO OrderDetails
(
    OrderDetailID,
    OrderID,
    ProductID,
    Quantity,
    UnitPrice
)
VALUES
(1, 1, 1, 1, 45000),

(2, 1, 5, 1, 10000),

(3, 2, 2, 1, 35000),

(4, 2, 6, 2, 1500),

(5, 3, 3, 1, 65000),

(6, 4, 4, 1, 42000);
GO


/* =========================================================
   8. CREATE CAIRO SOURCE DATABASE TABLES
   ========================================================= */

USE TechMart_Cairo;
GO


/* -------------------------
   Customers
   ------------------------- */

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    RegistrationDate DATE
);
GO


/* -------------------------
   Employees
   ------------------------- */

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
GO


/* -------------------------
   Products
   ------------------------- */

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT
);
GO


/* -------------------------
   Orders
   ------------------------- */

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(30),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO


/* -------------------------
   OrderDetails
   ------------------------- */

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
GO


/* =========================================================
   9. INSERT CAIRO CUSTOMERS
   ========================================================= */

INSERT INTO Customers
(
    CustomerID,
    CustomerName,
    Phone,
    Email,
    City,
    RegistrationDate
)
VALUES
(1, 'Karim Samir',
    '01020000001',
    'karim@gmail.com',
    'Cairo',
    '2026-01-05'),

(2, 'Sara Mohamed',
    '01020000002',
    'sara@gmail.com',
    'Cairo',
    '2026-01-20'),

(3, 'Mariam Ali',
    '01020000003',
    'mariam@gmail.com',
    'Cairo',
    '2026-02-05'),

(4, 'Khaled Ahmed',
    '01020000004',
    'khaled@gmail.com',
    'Cairo',
    '2026-02-20');
GO


/* =========================================================
   10. INSERT CAIRO EMPLOYEES
   ========================================================= */

INSERT INTO Employees
(
    EmployeeID,
    EmployeeName,
    JobTitle,
    Phone,
    Email
)
VALUES
(1, 'Sara Hassan',
    'Sales Representative',
    '01120000001',
    'sara@techmart.com'),

(2, 'Mariam Mohamed',
    'Sales Representative',
    '01120000002',
    'mariam@techmart.com'),

(3, 'Ahmed Khaled',
    'Branch Manager',
    '01120000003',
    'ahmed@techmart.com');
GO


/* =========================================================
   11. INSERT CAIRO PRODUCTS
   ========================================================= */

INSERT INTO Products
(
    ProductID,
    ProductName,
    Category,
    Brand,
    UnitPrice,
    StockQuantity
)
VALUES
(1, 'iPhone 15',
    'Smartphones',
    'Apple',
    45000,
    15),

(2, 'Samsung Galaxy S24',
    'Smartphones',
    'Samsung',
    35000,
    30),

(3, 'MacBook Air M3',
    'Laptops',
    'Apple',
    65000,
    8),

(4, 'HP Laptop 15',
    'Laptops',
    'HP',
    30000,
    20),

(5, 'AirPods Pro',
    'Accessories',
    'Apple',
    10000,
    25),

(6, 'Samsung Galaxy Buds',
    'Accessories',
    'Samsung',
    5000,
    35);
GO


/* =========================================================
   12. INSERT CAIRO ORDERS
   ========================================================= */

INSERT INTO Orders
(
    OrderID,
    CustomerID,
    EmployeeID,
    OrderDate,
    OrderStatus
)
VALUES
(1, 1, 1, '2026-09-01 09:30:00', 'Completed'),

(2, 2, 2, '2026-09-02 11:45:00', 'Completed'),

(3, 3, 1, '2026-09-04 13:20:00', 'Completed'),

(4, 4, 3, '2026-09-06 15:30:00', 'Cancelled');
GO


/* =========================================================
   13. INSERT CAIRO ORDER DETAILS
   ========================================================= */

INSERT INTO OrderDetails
(
    OrderDetailID,
    OrderID,
    ProductID,
    Quantity,
    UnitPrice
)
VALUES
(1, 1, 1, 1, 45000),

(2, 1, 6, 1, 5000),

(3, 2, 2, 2, 35000),

(4, 3, 3, 1, 65000),

(5, 3, 5, 1, 10000),

(6, 4, 4, 1, 30000);
GO


/* =========================================================
   14. VERIFY THE SOURCE DATA
   ========================================================= */

USE TechMart_Alex;
GO

SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
GO


USE TechMart_Cairo;
GO

SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
GO

