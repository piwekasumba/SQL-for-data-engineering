CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price INTEGER,
    created_date DATE
);

INSERT INTO products (product_name, price, created_date)
VALUES
('Laptop', 1200, '2025-01-10'),
('Keyboard', 100, '2025-02-05'),
('Mouse', 50, '2025-02-15'),
('Monitor', 300, '2025-03-01');

SELECT price,
price * 0.15 AS tax_amount
FROM products;

SELECT price,
ROUND(price * 1.15) AS price_with_tax
FROM products;

SELECT product_name,
created_date,
CURRENT_DATE - created_date AS days_since_created
FROM products;

SELECT CURRENT_TIME;

SELECT CURRENT_TIMESTAMP;

SELECT CONCAT(product_name, ' Product') AS product_label
FROM products;

SELECT TRIM('   SQL Data Engineering   ');

SELECT UPPER(product_name) AS upper_case_name
FROM products;

SELECT LOWER(product_name) AS lower_case_name
FROM products;

SELECT SUBSTRING(product_name FROM 1 FOR 3)
FROM products;




