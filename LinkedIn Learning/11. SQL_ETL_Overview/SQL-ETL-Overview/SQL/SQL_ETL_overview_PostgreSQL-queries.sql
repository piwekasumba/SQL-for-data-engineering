CREATE TABLE raw_sales (
    sale_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    price NUMERIC(10,2),
    sale_date DATE
);

INSERT INTO raw_sales (customer_name, product_name, price, sale_date)
VALUES
('Alice', 'Laptop', 1200.00, '2025-01-10'),
('Bob', 'Keyboard', 150.00, '2025-01-11'),
('Alice', 'Mouse', 75.00, '2025-01-12'),
('John', 'Monitor', 600.00, '2025-01-13');

SELECT
    customer_name,
    product_name,
    price,
    price * 1.15 AS price_with_tax,
    sale_date
FROM raw_sales;

CREATE TABLE sales_clean AS
SELECT
    customer_name,
    product_name,
    price,
    price * 1.15 AS price_with_tax,
    sale_date
FROM raw_sales;



