-- =========================
-- Create Schema
-- =========================
CREATE SCHEMA IF NOT EXISTS little_lemon_sales;
USE little_lemon_sales;

-- =========================
-- Dimension Tables
-- =========================

CREATE TABLE DimCustomer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100),
);

CREATE TABLE DimLocation (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    CountryCode CHAR(2)
);

CREATE TABLE DimDate (
    DateID INT AUTO_INCREMENT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Day INT,
    Month INT,
    Year INT,
    Quarter INT,
    WeekdayName VARCHAR(10),
    IsWeekend BOOLEAN
);

CREATE TABLE DimCuisine (
    CuisineID INT AUTO_INCREMENT PRIMARY KEY,
    CuisineName VARCHAR(100) NOT NULL
);

CREATE TABLE DimMenuSet (
    MenuSetID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),   -- main dish
    StarterName VARCHAR(100),
    DessertName VARCHAR(100),
    Drink VARCHAR(100),
    Side VARCHAR(100),
    CuisineID INT,
    FOREIGN KEY (CuisineID) REFERENCES DimCuisine(CuisineID)
);

-- =========================
-- Fact Table
-- =========================

CREATE TABLE FactSales (
    FactID BIGINT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDateID INT NOT NULL,
    DeliveryDateID INT NOT NULL,
    MenuSetID INT NOT NULL,
    LocationID INT NOT NULL,

    Sales DECIMAL(10,2) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(10,2),
    DeliveryCost DECIMAL(10,2),
    Quantity INT NOT NULL,

    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (OrderDateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (DeliveryDateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (MenuSetID) REFERENCES DimMenuSet(MenuSetID),
    FOREIGN KEY (LocationID) REFERENCES DimLocation(LocationID)
);
