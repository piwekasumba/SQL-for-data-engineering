CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    amount INTEGER
);

INSERT INTO customers (name, country)
VALUES
('Alice', 'South Africa'),
('John', 'USA'),
('Maria', 'Brazil');

INSERT INTO orders (customer_id, amount)
VALUES
(1, 500),
(1, 700),
(2, 300),
(3, 450);

CREATE VIEW customer_orders AS
SELECT customers.name, orders.amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT * FROM customer_orders;

CREATE OR REPLACE PROCEDURE increase_order_amount()
LANGUAGE SQL
AS $$
UPDATE orders
SET amount = amount + 50;
$$;

CALL increase_order_amount();


