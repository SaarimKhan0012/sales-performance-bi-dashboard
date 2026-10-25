SE sales_analytics;

-- 1. Check total rows
SELECT COUNT(*) AS total_rows
FROM orders;

-- 2. Check missing values in important columns
SELECT
    SUM(CASE WHEN `Order ID` IS NULL OR TRIM(`Order ID`) = '' THEN 1 ELSE 0 END) AS missing_order_ids,
    SUM(CASE WHEN `Order Date` IS NULL OR TRIM(`Order Date`) = '' THEN 1 ELSE 0 END) AS missing_order_dates,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit
FROM orders;

-- 3. Check duplicate order IDs (orders may have multiple product rows)
SELECT
    `Order ID`,
    COUNT(*) AS row_count
FROM orders
GROUP BY `Order ID`
HAVING COUNT(*) > 1
ORDER BY row_count DESC
LIMIT 10;

-- 4. Check the date range
SELECT
    MIN(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS earliest_order_date,
    MAX(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS latest_order_date
FROM orders;

-- 5. Check future-dated orders
SELECT COUNT(*) AS future_dated_rows
FROM orders
WHERE STR_TO_DATE(`Order Date`, '%d-%m-%Y') > CURRENT_DATE();