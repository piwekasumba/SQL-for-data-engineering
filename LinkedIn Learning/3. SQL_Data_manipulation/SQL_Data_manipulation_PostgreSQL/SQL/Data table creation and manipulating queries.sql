-- =====================================
-- 01_create_tables.sql
-- =====================================

CREATE TABLE IF NOT EXISTS customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    age INTEGER
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    amount INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =====================================
-- 02_insert_data.sql
-- =====================================

INSERT INTO customers (name, country, age)
VALUES
('Alice', 'South Africa', 28),
('John', 'USA', 35),
('Maria', 'Brazil', 31),
('David', 'South Africa', 45);

INSERT INTO orders (customer_id, order_date, amount)
VALUES
(1, '2025-01-10', 500),
(2, '2025-01-12', 300),
(1, '2025-01-15', 700),
(3, '2025-01-18', 450);

-- =====================================
-- 03_select_queries.sql
-- =====================================

SELECT * FROM customers;

SELECT name, country
FROM customers;

SELECT * FROM orders;

-- =====================================
-- 04_filter_queries.sql
-- =====================================

SELECT *
FROM customers
WHERE country = 'South Africa';

SELECT *
FROM orders
WHERE amount > 400;

-- =====================================
-- 05_order_by_queries.sql
-- =====================================

SELECT *
FROM customers
ORDER BY age;

SELECT *
FROM orders
ORDER BY amount DESC;

-- =====================================
-- 06_and_or_conditions.sql
-- =====================================

SELECT *
FROM customers
WHERE country = 'South Africa'
AND age > 30;

SELECT *
FROM customers
WHERE country = 'South Africa'
OR country = 'USA';I can also show you one portfolio project that gets junior data engineers hired in South Africa using everything you learned so far.