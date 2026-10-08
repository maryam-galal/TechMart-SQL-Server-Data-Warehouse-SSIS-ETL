USE TechMart_DWH;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'Staging'
)
BEGIN
    EXEC('CREATE SCHEMA Staging');
END;
GO

/* =========================================================
   STAGING LAYER
   ALEXANDRIA + CAIRO
   ========================================================= */

CREATE TABLE Staging.Sap_TechMart_ALEX_Customers
(
    CustomerID INT,
    CustomerName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    City NVARCHAR(100),
    RegistrationDate DATE
);
GO
CREATE TABLE Staging.Sap_TechMart_CAIRO_Customers
(
    CustomerID INT,
    CustomerName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    City NVARCHAR(100),
    RegistrationDate DATE
);
GO
CREATE TABLE Staging.Sap_TechMart_ALEX_Employees
(
    EmployeeID INT,
    EmployeeName NVARCHAR(100),
    JobTitle NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);
GO
CREATE TABLE Staging.Sap_TechMart_CAIRO_Employees
(
    EmployeeID INT,
    EmployeeName NVARCHAR(100),
    JobTitle NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);
GO
CREATE TABLE Staging.Sap_TechMart_ALEX_Products
(
    ProductID INT,
    ProductName NVARCHAR(100),
    Category NVARCHAR(100),
    Brand NVARCHAR(100),
    UnitPrice DECIMAL(18,2),
    StockQuantity INT
);
GO
CREATE TABLE Staging.Sap_TechMart_CAIRO_Products
(
    ProductID INT,
    ProductName NVARCHAR(100),
    Category NVARCHAR(100),
    Brand NVARCHAR(100),
    UnitPrice DECIMAL(18,2),
    StockQuantity INT
);
GO
CREATE TABLE Staging.Sap_TechMart_ALEX_Orders
(
    OrderID INT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME,
    OrderStatus NVARCHAR(50)
);
GO
CREATE TABLE Staging.Sap_TechMart_CAIRO_Orders
(
    OrderID INT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME,
    OrderStatus NVARCHAR(50)
);
GO
CREATE TABLE Staging.Sap_TechMart_ALEX_OrderDetails
(
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(18,2)
);
GO
CREATE TABLE Staging.Sap_TechMart_CAIRO_OrderDetails
(
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(18,2)
);
GO