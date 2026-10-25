
CREATE DATABASE sales_analytics;

USE sales_analytics;
CREATE TABLE orders (
    `Row ID` INT,
    `Order ID` VARCHAR(30),
    `Order Date` VARCHAR(30),
    `Ship Date` VARCHAR(30),
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(30),
    `Customer Name` VARCHAR(100),
    `Segment` VARCHAR(30),
    `Country/Region` VARCHAR(100),
    `City` VARCHAR(100),
    `State/Province` VARCHAR(100),
    `Postal Code` VARCHAR(20),
    `Region` VARCHAR(30),
    `Product ID` VARCHAR(30),
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(255),
    `Sales` DECIMAL(12,2),
    `Quantity` INT,
    `Discount` DECIMAL(6,4),
    `Profit` DECIMAL(12,2)
);
SHOW TABLES;


SELECT COUNT(*) AS total_rows
FROM orders;

SELECT *
FROM orders
LIMIT 5;
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold,
    COUNT(DISTINCT `Order ID`) AS total_orders
FROM orders;


SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS sales_year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY sales_year, sales_month;


SELECT `Order Date`
FROM orders
LIMIT 10;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%c/%e/%Y')) AS sales_year,
    MONTH(STR_TO_DATE(`Order Date`, '%c/%e/%Y')) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY
    YEAR(STR_TO_DATE(`Order Date`, '%c/%e/%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%c/%e/%Y'))
ORDER BY sales_year, sales_month;

SELECT
    `Order Date`,
    LENGTH(`Order Date`) AS date_length,
    HEX(`Order Date`) AS date_hex
FROM orders
LIMIT 10;

SELECT
    `Order Date`,
    STR_TO_DATE(`Order Date`, '%m/%d/%Y') AS format_1,
    STR_TO_DATE(`Order Date`, '%c/%e/%Y') AS format_2,
    STR_TO_DATE(`Order Date`, '%Y-%m-%d') AS format_3
FROM orders
LIMIT 10;

SELECT
    `Order Date`,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS converted_date
FROM orders
LIMIT 10;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y'))
ORDER BY sales_year, sales_month;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY sales_year, sales_month
ORDER BY total_sales DESC
LIMIT 5;

SELECT
    `Order Date`,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS converted_date
FROM orders
LIMIT 10;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_year,
    MONTH(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year,
    sales_month;
    
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold,
    ROUND(
        100.0 * SUM(Profit) / NULLIF(SUM(Sales), 0),
        2
    ) AS profit_margin_pct
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;

SELECT
    MIN(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS first_order_date,
    MAX(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS last_order_date,
    COUNT(*) AS total_records
FROM orders;

SELECT
    YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS sales_year,
    COUNT(*) AS total_records,
    MIN(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS first_date,
    MAX(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS last_date
FROM orders
GROUP BY sales_year
ORDER BY sales_year;


SELECT
    COUNT(*) AS future_dated_records,
    MIN(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS first_future_date,
    MAX(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS last_future_date
FROM orders
WHERE STR_TO_DATE(`Order Date`, '%d-%m-%Y') > CURDATE();