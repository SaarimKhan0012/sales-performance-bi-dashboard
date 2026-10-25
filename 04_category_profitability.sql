USE sales_analytics;

-- Category-wise sales and profitability
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(
        SUM(Profit) / NULLIF(SUM(Sales), 0) * 100,
        2
    ) AS profit_margin_pct,
    SUM(Quantity) AS units_sold
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;