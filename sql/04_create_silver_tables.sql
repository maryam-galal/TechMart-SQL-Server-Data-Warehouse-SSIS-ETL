USE [TechMark_DWH]
GO
-- FIRST: Creating Alex tables in Silver Layer 
CREATE TABLE Silver.Sap_TechMart_ALEX_Customers
(
    CustomerID INT   PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    RegistrationDate DATE
);
GO
CREATE TABLE Silver.Sap_TechMart_ALEX_Employees
(
    EmployeeID INT   PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
GO
CREATE TABLE Silver.Sap_TechMart_ALEX_Products
(
    ProductID INT   PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT
);
GO
CREATE TABLE Silver.Sap_TechMart_ALEX_Orders
(
    OrderID INT   PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(30),
);
GO
CREATE TABLE Silver.Sap_TechMart_ALEX_OrderDetails
(
    OrderDetailID INT   PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
);
GO
  
-- SECOND: Creating CAIRO tables in Silver Layer 
CREATE TABLE Silver.Sap_TechMart_CAIRO_Customers
(
    CustomerID INT   PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100),
    City VARCHAR(50),
    RegistrationDate DATE
);
GO
CREATE TABLE Silver.Sap_TechMart_CAIRO_Employees
(
    EmployeeID INT   PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
GO
CREATE TABLE Silver.Sap_TechMart_CAIRO_Products
(
    ProductID INT   PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    StockQuantity INT
);
GO
CREATE TABLE Silver.Sap_TechMart_CAIRO_Orders
(
    OrderID INT   PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderStatus VARCHAR(30),
);
GO
CREATE TABLE Silver.Sap_TechMart_CAIRO_OrderDetails
(
    OrderDetailID INT   PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
);
