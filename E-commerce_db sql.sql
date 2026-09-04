-- =====================================================
-- Database: E-commerce_db
-- =====================================================

-- =====================================================
-- 1. CREATE TABLES
-- =====================================================

CREATE TABLE customers (
    customer_id     INTEGER,
    age             INTEGER,
    city            TEXT,
    signhup_date    DATE,
    customer_segment TEXT
);

CREATE TABLE orders (
    order_id        INTEGER,
    customer_id     INTEGER,
    order_date      DATE,
    product_id      INTEGER,
    quantity        NUMERIC,
    discount        NUMERIC,
    payment_method  TEXT,
    status          TEXT
);

CREATE TABLE products (
    product_id      INTEGER,
    product_name    TEXT,
    category        TEXT,
    unitprice       NUMERIC
);

CREATE TABLE payments (
    payment_id      INTEGER,
    order_id        INTEGER
);

-- =====================================================
-- 2. IMPORT DATA FROM CSV FILES
-- (Paths need to match your actual file locations)
-- =====================================================

\copy public.customers(customer_id, age, city, signhup_date, customer_segment) FROM 'C:/path/to/customers.csv' WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8', QUOTE '"', ESCAPE '"');

\copy public.orders(order_id, customer_id, order_date, product_id, quantity, discount, payment_method, status) FROM 'C:/path/to/orders.csv' WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8', QUOTE '"', ESCAPE '"');

\copy public.products(product_id, product_name, category, unitprice) FROM 'C:/path/to/products.csv' WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8', QUOTE '"', ESCAPE '"');

\copy public.payments(payment_id, order_id) FROM 'C:/path/to/payments.csv' WITH (FORMAT csv, DELIMITER ',', HEADER, ENCODING 'UTF8', QUOTE '"', ESCAPE '"');

-- =====================================================
-- 3. FIXES APPLIED DURING IMPORT
-- (quantity and unitprice were INTEGER but CSV had
-- decimal values like "4.0" and "18.0", so changed to NUMERIC)
-- =====================================================

ALTER TABLE orders ALTER COLUMN quantity TYPE NUMERIC;
ALTER TABLE products ALTER COLUMN unitprice TYPE NUMERIC;

-- =====================================================
-- 4. VERIFY DATA
-- =====================================================

SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM payments LIMIT 10;

-- =====================================================
-- 5. JOIN ALL TABLES TOGETHER
-- =====================================================

SELECT
    c.age, c.city, c.signhup_date, c.customer_segment,
    o.order_id, o.order_date, o.product_id, o.quantity,
    o.discount, o.payment_method, o.status,
    p.product_name, p.category, p.unitprice,
    pay.payment_id
FROM customers AS c
JOIN orders AS o
    ON c.customer_id = o.customer_id
JOIN products AS p
    ON o.product_id = p.product_id
JOIN payments AS pay
    ON o.order_id = pay.order_id;

