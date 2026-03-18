-- Incorrect query (missing comma)

SELECT product_name price
FROM products;

SELECT product_name, price
FROM products;

SELECT *
FROM products
WHERE price > 500
AND category = 'Furniture';

SELECT *
FROM products
WHERE price > 500
OR category = 'Furniture';

SELECT *
FROM products
WHERE price = NULL;

SELECT *
FROM products
WHERE price IS NULL;

SELECT product_name
FROM products
WHERE category = Electronics;

SELECT product_name
FROM products
WHERE category = 'Electronics';

