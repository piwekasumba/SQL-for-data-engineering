CREATE TABLE Customers (
Customer_id Serial Primary Key,
Name VARCHAR (100),
Country VARCHAR (50)
);

CREATE TABLE Orders (
Order_id SERIAL PRIMARY KEY,
Customer_id INTEGER,
Amount INTEGER
);

INSERT INTO customers (name, country)
VALUES
('Alice', 'South Africa'),
('John', 'USA'),
('Maria', 'Brazil'),
('David', 'South Africa');

INSERT INTO orders (customer_id, amount)
VALUES
(1, 500),
(1, 700),
(2, 300),
(3, 450);
03_inner_join.sql
SELECT customers.name, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
04_left_right_join.sql
SELECT customers.name, orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT customers.name, orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
05_full_outer_join.sql
SELECT customers.name, orders.amount
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
06_union_queries.sql
SELECT name FROM customers
WHERE country = 'South Africa'

UNION

SELECT name FROM customers
WHERE country = 'USA';
07_case_statement.sql
SELECT name,
CASE
    WHEN country = 'South Africa' THEN 'Local Customer'
    ELSE 'International Customer'
END AS customer_type
FROM customers;
08_group_by_queries.sql
SELECT customer_id,
SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

SELECT customer_id,
AVG(amount) AS average_order
FROM orders
GROUP BY customer_id;
09_having_clause.sql
SELECT customer_id,
SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 500;
docs/advanced_query_notes.md

Copy this:

# Advanced SQL Query Notes

JOINs allow data from multiple tables to be combined.

INNER JOIN
Returns matching rows from both tables.

LEFT JOIN
Returns all rows from the left table and matching rows from the right.

RIGHT JOIN
Returns all rows from the right table.

FULL OUTER JOIN
Returns all rows from both tables.

GROUP BY
Groups rows so aggregate functions can be applied.

Common aggregation functions:

SUM
AVG
COUNT
MAX
MIN

HAVING
Filters aggregated results after GROUP BY.
6️⃣ Git Commit Messages

Use these exact commits

feat: create tables for join examples
feat: insert sample data
feat: add inner join queries
feat: add left and right join queries
feat: add full outer join example
feat: add union queries
feat: add case statement example
feat: add group by aggregation queries
feat: add having clause filtering
docs: add advanced query notes
7️⃣ Why This Project Is Important

This project proves you know:

Joining multiple tables

Aggregating data

Writing analytical SQL queries

Transforming data with logic

These are core SQL skills used by data engineers and analysts daily.

✅ Your portfolio now has 5 SQL projects:

sql-data-engineering-intro

sql-introduction-for-data-engineering

sql-basics-data-engineering

sql-data-manipulation-postgresql

sql-advanced-data-querying


