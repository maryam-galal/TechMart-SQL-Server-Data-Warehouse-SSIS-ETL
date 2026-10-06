# TechMart — SQL Server Data Warehouse & SSIS ETL

An end-to-end **on-premises Data Warehousing and ETL project** built using **Microsoft SQL Server, SQL Server Integration Services (SSIS), SQL Server Agent, and Power BI**.

The project demonstrates how data can be extracted from multiple source databases, transformed through a **Medallion Architecture**, loaded incrementally into a data warehouse, and finally exposed through analytical views and Power BI dashboards.

---

## Project Overview

The goal of this project was to build a complete data pipeline for **TechMart**, integrating data from multiple source systems into a centralized data warehouse.

The pipeline follows a three-layer Medallion Architecture:

```text
                         SOURCE SYSTEMS
                              │
                ┌─────────────┴─────────────┐
                │                           │
        ┌───────────────┐           ┌───────────────┐
        │ Cairo Database│           │ Alexandria DB │
        └───────┬───────┘           └───────┬───────┘
                │                           │
                └─────────────┬─────────────┘
                              ▼
                    ┌───────────────────┐
                    │      BRONZE       │
                    │    Raw Data       │
                    │                   │
                    │ Source → Bronze   │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │      STAGING      │
                    │                   │
                    │ Clean & Validate  │
                    │ • Trim / Normalize│
                    │ • Data Validation │
                    │ • Reject Invalid  │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │      SILVER       │
                    │                   │
                    │ Integrated &      │
                    │ Transformed Data  │
                    │                   │
                    │ MERGE / UPSERT     │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │       GOLD        │
                    │                   │
                    │ Analytical Views  │
                    │ & Business KPIs   │
                    └─────────┬─────────┘
                              │
                              ▼
                         ┌──────────┐
                         │ POWER BI │
                         │ Reports  │
                         │ Dashboards│
                         └──────────┘
```

---

## Technologies Used

- **Microsoft SQL Server**
- **SQL Server Integration Services (SSIS)**
- **SQL Server Agent**
- **T-SQL**
- **Stored Procedures**
- **Medallion Architecture**
- **ETL / Data Warehousing**
- **Incremental Loading**
- **Dimensional Modeling**
- **Power BI**

---

## Architecture

### 1. Source Layer

The project uses two source databases representing different business locations:

- Cairo
- Alexandria

The source systems contain business data such as:

- Customers
- Employees
- Products
- Orders
- Order Details

The two sources are integrated into a centralized data warehouse.

---

### 2. Bronze Layer

The Bronze layer stores the incoming data with minimal transformation.

Separate Bronze tables are maintained for the different source systems.

Examples:

```text
bronze.TechMart_Cairo_Customers
bronze.TechMart_Cairo_Employees
bronze.TechMart_Cairo_Products
bronze.TechMart_Cairo_Orders
bronze.TechMart_Cairo_OrderDetails

bronze.TechMart_Alex_Customers
bronze.TechMart_Alex_Employees
bronze.TechMart_Alex_Products
bronze.TechMart_Alex_Orders
bronze.TechMart_Alex_OrderDetails
```

The Bronze layer provides a staging area where source data can be loaded before further transformation.

---

### 3. Silver Layer

The Silver layer contains cleaned and transformed data.

Data from the different source systems is integrated and prepared for analytical processing.

Typical transformations include:

- Data cleaning
- Standardization
- Combining data from multiple sources
- Handling updated records
- Applying business rules
- Preparing data for the Gold layer

---

### 4. Gold Layer

The Gold layer contains business-ready data designed for reporting and analysis.

Analytical views are created on top of the processed warehouse data to answer business questions and provide Power BI with reporting-ready datasets.

---

## ETL Pipeline

The ETL process was implemented using **SQL Server Integration Services (SSIS)**.

The SSIS package contains both a **Control Flow** and multiple **Data Flow Tasks**.

### Control Flow

The overall Control Flow is organized to execute the pipeline in the required order.

A simplified workflow is:

```text
Start
  │
  ▼
Truncate Bronze Tables
  │
  ▼
Load Cairo Data ──────┐
                      ├──► Merge / Transformation
Load Alexandria Data ─┘
                      │
                      ▼
                Silver Layer
                      │
                      ▼
                 Gold Views
```

The Control Flow uses tasks and containers to organize and control the execution of the ETL process.

---

## Data Flow

SSIS Data Flow Tasks are responsible for moving and transforming the data between the different layers.

The Data Flow process includes:

```text
Source Database
      │
      ▼
OLE DB Source
      │
      ▼
Transformations
      │
      ▼
Data Integration
      │
      ▼
SQL Server Destination
```

Data from both Cairo and Alexandria source systems is processed and loaded into the warehouse.

---

## Incremental Loading

Instead of reprocessing the entire dataset during every execution, the pipeline implements **incremental loading**.

New and updated records are identified using ingestion and update timestamps.

The general logic is:

```text
Source Data
    │
    ├── New Records
    │
    └── Updated Records
             │
             ▼
      Incremental Load
             │
             ▼
       Data Warehouse
```

This reduces unnecessary processing and allows the pipeline to focus on data that has changed since the previous load.

---

## Stored Procedures

Several stored procedures were created to support the ETL process.

### Truncate Procedure

A stored procedure is used to clear the required Bronze tables before a new staging load.

The procedure handles table dependencies by deleting data in the appropriate order.

Example:

```sql
EXEC dbo.truncate_proc;
```

### Merge Procedures

Merge logic is used to integrate data from the staging/source layer into the target warehouse tables.

The merge process handles:

- New records
- Existing records
- Updated records

This allows the warehouse to remain synchronized with the source systems.

---

## SSIS Deployment & Automation

After developing and testing the SSIS package in Visual Studio, the package was deployed to SQL Server.

The pipeline was then automated using **SQL Server Agent**.

The automated workflow is:

```text
SQL Server Agent Job
        │
        ▼
   SSIS Package
        │
        ▼
    ETL Pipeline
        │
        ▼
   Data Warehouse
```

This allows the ETL pipeline to execute on a scheduled basis without requiring manual execution.

---

## Power BI

A Power BI dashboard was created on top of the Gold-layer analytical views.

The dashboard provides a simple interface for exploring the processed warehouse data and converting it into business insights.

The overall solution therefore connects:

```text
SQL Server
     │
     ▼
    SSIS
     │
     ▼
Data Warehouse
     │
     ▼
 Gold Views
     │
     ▼
 Power BI
```

---

## Repository Structure

```text
TechMart-SQL-Server-Data-Warehouse-SSIS-ETL/
│
├── sql/
│   ├── 01_create_databases.sql
│   ├── 02_create_bronze_tables.sql
│   ├── 03_create_silver_tables.sql
│   ├── 04_create_gold_views.sql
│   ├── 05_stored_procedures.sql
│   └── 06_incremental_load.sql
│
├── ssis/
│   └── TechMart_ETL/
│       ├── Package.dtsx
│       └── ...
│
├── powerbi/
│   └── TechMart_Dashboard.pbix
│
├── docs/
│   ├── architecture.png
│   ├── ssis_control_flow.png
│   ├── ssis_data_flow.png
│   └── powerbi_dashboard.png
│
├── .gitignore
└── README.md
```

---

## Key Concepts Demonstrated

- ETL Pipeline Development
- Data Warehousing
- Medallion Architecture
- Bronze / Silver / Gold Layers
- SQL Server
- SSIS
- Control Flow & Data Flow
- Incremental Loading
- Stored Procedures
- Data Integration
- Data Transformation
- SQL Server Agent
- ETL Automation
- Power BI Reporting

---

## Project Outcome

This project provided hands-on experience in building a complete **on-premises data engineering solution**, from source-system integration and ETL development to warehouse modeling, incremental loading, pipeline automation, and business intelligence reporting.

It demonstrates how **SQL Server, SSIS, SQL Server Agent, and Power BI** can work together to build a maintainable end-to-end data platform.
