CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    sale_date DATE,
    amount INTEGER
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR (100)
);

INSERT INTO employees (name) VALUES
('Alice'),
('John'),
('Maria'),
('David');

INSERT INTO sales (employee_id, sale_date, amount) VALUES
(1, '2025-01-01', 500),
(1, '2025-01-05', 700),
(2, '2025-01-02', 300),
(3, '2025-01-03', 450),
(1, '2025-01-07', 600),
(2, '2025-01-08', 400);

-- RANK assigns rank with gaps
SELECT employee_id, amount,
RANK() OVER (PARTITION BY employee_id ORDER BY amount DESC) AS rank_amount
FROM sales;

-- DENSE_RANK assigns rank without gaps
SELECT employee_id, amount,
DENSE_RANK() OVER (PARTITION BY employee_id ORDER BY amount DESC) AS dense_rank_amount
FROM sales;

SELECT employee_id, amount,
ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY amount DESC) AS row_num
FROM sales;

SELECT employee_id, amount,
LAG(amount,1) OVER (PARTITION BY employee_id ORDER BY sale_date) AS previous_sale,
LEAD(amount,1) OVER (PARTITION BY employee_id ORDER BY sale_date) AS next_sale
FROM sales;

SELECT employee_id, sale_date, amount,
SUM(amount) OVER (PARTITION BY employee_id ORDER BY sale_date) AS running_total
FROM sales;

SELECT employee_id, sale_date, amount,
AVG(amount) OVER (PARTITION BY employee_id ORDER BY sale_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg
FROM sales;

