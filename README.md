E-commerce Sales Analysis Dashboard

An end-to-end data analytics project — from raw CSV data to a PostgreSQL database to an interactive Power BI dashboard — analyzing e-commerce sales, customers, and product performance.

📌 Project Overview

This project analyzes an e-commerce dataset of ~49,200 orders (Jan 2024 – Jun 2026), covering customers, orders, products, and payments. The goal was to design a relational database, clean and import the raw data, write analytical SQL queries, and build a Power BI dashboard to surface business insights.

🛠️ Tools Used
PostgreSQL (via pgAdmin 4) — database design, data import, querying
Power BI — dashboard and data visualization
SQL — data cleaning, joins, aggregations
🗂️ Database Schema

The data is organized into 4 related tables:

customers — customer_id, age, city, signhup_date, customer_segment
orders — order_id, customer_id, order_date, product_id, quantity, discount, payment_method, status
products — product_id, product_name, category, unitprice
payments — payment_id, order_id

Relationships:

customers.customer_id → orders.customer_id
orders.product_id → products.product_id
orders.order_id → payments.order_id
🧹 Data Cleaning
Imported CSV data into PostgreSQL using \copy
Fixed data type mismatches: quantity and unitprice were originally INTEGER but the source data contained decimal values (e.g. 4.0, 18.0), so both were converted to NUMERIC
Verified joins across all 4 tables to ensure referential integrity
📊 Dashboard KPIs
*Total Revenue
*Total Orders
*Total Customers
*Cancellation / Return Rate

📈 Charts & Visuals
Total revenue by category
Total orders by category
orders by years and months
cancel/return rate 
total orders by payment method
sum of quantities by category

dashboard preview
<img width="1366" height="768" alt="Screenshot (74)" src="https://github.com/user-attachments/assets/f41f72a7-44eb-41d5-9c32-6b8bc19b3adf" />


