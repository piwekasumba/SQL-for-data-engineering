-- These queries focus on practicing core SQL concepts such as SELECT,
-- JOIN, WHERE, and ORDER BY using PostgreSQL.

-- Purpose: Combine claims with customer information
-- Demonstrates basic JOIN between two tables

SELECT 
c.customer_id,
c.first_name,
c.last_name,
cl.claim_id,
cl.claim_date,
cl.claim_amount
FROM customers c
JOIN claims cl 
ON c.customer_id = cl.customer_id
ORDER BY cl.claim_date;

-- Purpose: Join claims and policies to see policy-related claim details
-- Demonstrates relationship between claims and policies

SELECT 
cl.claim_id,
cl.claim_date,
cl.claim_amount,
p.policy_number,
p.policy_type
FROM claims cl
JOIN policies p 
ON cl.policy_id = p.policy_id
ORDER BY cl.claim_amount DESC;

-- Purpose: Retrieve claims above a certain amount
-- Demonstrates use of WHERE for filtering

SELECT 
claim_id,
customer_id,
claim_amount,
claim_date
FROM claims
WHERE claim_amount > 1000
ORDER BY claim_amount DESC;

-- Purpose: Show policies that are still active (no end date)
-- Demonstrates filtering using WHERE

SELECT 
policy_id,
policy_number,
policy_type,
start_date,
end_date
FROM policies
WHERE end_date IS NULL;

-- Purpose: Display customer data in alphabetical order
-- Demonstrates ORDER BY for sorting

SELECT 
customer_id,
first_name,
last_name
FROM customers
ORDER BY last_name;

