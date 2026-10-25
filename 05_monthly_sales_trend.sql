USE sales_analytics;

-- Monthly sales and profit trend
SELECT
    DATE_FORMAT(
        STR_TO_DATE(`Order Date`, '%d-%m-%Y'),
        '%Y-%m'
    ) AS order_month,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS units_sold
FROM orders
WHERE STR_TO_DATE(`Order Date`, '%d-%m-%Y') IS NOT NULL
GROUP BY order_month
ORDER BY order_month;