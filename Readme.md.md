# **Sales Performance \& Business Intelligence Dashboard**



**Project Overview**



This project analyzes sales data using MySQL, Excel, and Microsoft Power BI to identify business trends, evaluate regional performance, and understand product profitability.



The dashboard presents key performance indicators (KPIs) and interactive visualizations to support data-driven business decisions.



**Tools \& Technologies**



* Microsoft Excel — Data inspection and preparation
* MySQL — Data analysis using SQL queries
* Microsoft Power BI — Interactive dashboard and visualizations
* DAX — Measures and KPI calculations



**Business Objectives**



* Analyze overall sales, profit, orders, and units sold.
* Compare sales and profitability across regions.
* Identify the most and least profitable product categories.
* Explore monthly sales trends.
* Enable interactive analysis using region and category filters.



**Key Performance Indicators**



* Total Sales
* Total Profit
* Total Orders
* Units Sold
* Profit Margin



**SQL Analysis**



The SQL scripts cover:

* Sales analysis and KPI calculations
* Data quality checks
* Regional performance
* Category profitability
* Monthly sales trends



**Dashboard Features**



* KPI cards for key business metrics
* Monthly sales trend visualization
* Sales performance by region
* Profit analysis by category and sub-category
* Interactive region and category slicers



**Key Findings**



The West region generated the highest sales among the regions in the analyzed dataset.



Technology had the highest total profit among the three main product categories.



Furniture generated substantial sales but had a considerably lower profit margin than Technology, indicating an opportunity to investigate costs, discounts, and pricing.



**Data Quality Note**



The dataset contains order dates extending beyond the current reporting date. Future-dated records should be investigated before interpreting the full dataset as historical performance. The reported findings describe the dataset as analyzed and may change if those records are excluded.



**Project Structure**



Sales-Performance-BI-Dashboard/

├── Data/

├── Power BI/

├── SQL/

│   ├── 01\_sales\_analysis.sql

│   ├── 02\_data\_quality\_checks.sql

│   ├── 03\_regional\_performance.sql

│   ├── 04\_category\_profitability.sql

│   └── 05\_monthly\_sales\_trend.sql

├── Screenshots/

└── README.md



**How to Use**

Review the dataset in Excel.



Run the SQL scripts in MySQL Workbench after configuring the database and table.



Open the Power BI report to explore the dashboard.



Use the dashboard filters to investigate regional and category performance.





