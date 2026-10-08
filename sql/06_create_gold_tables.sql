USE TechMart_DWH;
GO

/* =========================================================
   1. CREATE GOLD SCHEMA
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM sys.schemas
    WHERE name = 'Gold'
)
BEGIN
    EXEC('CREATE SCHEMA Gold');
END;
GO


/* =========================================================
   2. CREATE DIM DATE
   ========================================================= */

IF OBJECT_ID('Gold.DimDate', 'U') IS NULL
BEGIN
    CREATE TABLE Gold.DimDate
    (
        DateKey INT PRIMARY KEY,
        FullDate DATE NOT NULL,
        DayNumber INT,
        DayName NVARCHAR(20),
        MonthNumber INT,
        MonthName NVARCHAR(20),
        QuarterNumber INT,
        YearNumber INT
    );
END;
GO


/* =========================================================
   3. POPULATE DIM DATE
   ========================================================= */

IF NOT EXISTS
(
    SELECT 1
    FROM Gold.DimDate
)
BEGIN
    DECLARE @StartDate DATE = '2026-01-01';
    DECLARE @EndDate DATE = '2026-12-31';

    WHILE @StartDate <= @EndDate
    BEGIN
        INSERT INTO Gold.DimDate
        (
            DateKey,
            FullDate,
            DayNumber,
            DayName,
            MonthNumber,
            MonthName,
            QuarterNumber,
            YearNumber
        )
        VALUES
        (
            CONVERT(INT, CONVERT(CHAR(8), @StartDate, 112)),
            @StartDate,
            DAY(@StartDate),
            DATENAME(WEEKDAY, @StartDate),
            MONTH(@StartDate),
            DATENAME(MONTH, @StartDate),
            DATEPART(QUARTER, @StartDate),
            YEAR(@StartDate)
        );

        SET @StartDate = DATEADD(DAY, 1, @StartDate);
    END;
END;
GO


/* =========================================================
   4. CREATE DIM CUSTOMER
   ========================================================= */

IF OBJECT_ID('Gold.DimCustomer', 'U') IS NULL
BEGIN
    CREATE TABLE Gold.DimCustomer
    (
        CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
        CustomerID INT NOT NULL,
        CustomerName NVARCHAR(100),
        Phone NVARCHAR(50),
        Email NVARCHAR(100),
        City NVARCHAR(100),
        Branch NVARCHAR(20)
    );
END;
GO


/* =========================================================
   5. CREATE DIM EMPLOYEE
   ========================================================= */

IF OBJECT_ID('Gold.DimEmployee', 'U') IS NULL
BEGIN
    CREATE TABLE Gold.DimEmployee
    (
        EmployeeKey INT IDENTITY(1,1) PRIMARY KEY,
        EmployeeID INT NOT NULL,
        EmployeeName NVARCHAR(100),
        JobTitle NVARCHAR(100),
        Phone NVARCHAR(50),
        Email NVARCHAR(100),
        Branch NVARCHAR(20)
    );
END;
GO


/* =========================================================
   6. CREATE DIM PRODUCT
   ========================================================= */

IF OBJECT_ID('Gold.DimProduct', 'U') IS NULL
BEGIN
    CREATE TABLE Gold.DimProduct
    (
        ProductKey INT IDENTITY(1,1) PRIMARY KEY,
        ProductID INT NOT NULL,
        ProductName NVARCHAR(100),
        Category NVARCHAR(100),
        Brand NVARCHAR(100),
        UnitPrice DECIMAL(18,2),
        Branch NVARCHAR(20)
    );
END;
GO


/* =========================================================
   7. CREATE FACT SALES
   ========================================================= */

IF OBJECT_ID('Gold.FactSales', 'U') IS NULL
BEGIN
    CREATE TABLE Gold.FactSales
    (
        SalesKey INT IDENTITY(1,1) PRIMARY KEY,

        OrderID INT NOT NULL,
        OrderDetailID INT NOT NULL,

        CustomerKey INT NOT NULL,
        EmployeeKey INT NOT NULL,
        ProductKey INT NOT NULL,
        DateKey INT NOT NULL,

        Quantity INT NOT NULL,
        UnitPrice DECIMAL(18,2) NOT NULL,
        SalesAmount DECIMAL(18,2) NOT NULL,

        OrderStatus NVARCHAR(50),
        Branch NVARCHAR(20)
    );
END;
GO


