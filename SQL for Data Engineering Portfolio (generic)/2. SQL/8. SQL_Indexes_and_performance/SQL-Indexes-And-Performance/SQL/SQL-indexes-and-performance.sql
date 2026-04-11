CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 1200.00),
('Keyboard', 'Electronics', 150.00),
('Mouse', 'Electronics', 75.00),
('Desk', 'Furniture', 400.00),
('Office Chair', 'Furniture', 250.00),
('Monitor', 'Electronics', 600.00);

SELECT * FROM products;

SELECT product_name, category, price FROM products;

SELECT * FROM products
WHERE category = 'Electronics';

SELECT * FROM products
WHERE price > 500;

SELECT * FROM products
ORDER BY price DESC;

SELECT * FROM products
ORDER BY product_name ASC;

UPDATE products
SET price = 1300.00
WHERE product_name = 'Laptop';

UPDATE products
SET category = 'Office Equipment'
WHERE product_name = 'Desk';

DELETE FROM products
WHERE product_name = 'Mouse';

DELETE FROM products
WHERE price < 200;

SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

SELECT category, AVG(price) AS average_price
FROM products
GROUP BY category;

SELECT category, MAX(price) AS max_price
FROM products
GROUP BY category;

SELECT product_name, category, price,
       RANK() OVER (PARTITION BY category ORDER BY price DESC) AS price_rank
FROM products;

