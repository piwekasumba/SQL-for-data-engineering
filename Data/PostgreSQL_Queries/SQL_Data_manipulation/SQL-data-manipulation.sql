-- SQL DATA ENGINEERING PIPELINE
-- LinkedIn Learning: Complete Guide to SQL for Data Engineering
-- POSTGRESQL 18 ERROR-FREE VERSION



-- DATA CLEANING STEP
-- Ensure numeric consistency in policies

UPDATE policies
SET premium_amount = ABS(premium_amount)
WHERE premium_amount < 0;



-- DATA QUALITY CHECK 1: Duplicate customer records

SELECT first_name,last_name,
COUNT(*) AS duplicate_count
FROM customers
GROUP BY first_name,last_name
HAVING COUNT(*) > 1;



-- DATA QUALITY CHECK 2: Orphan policies (no matching customer)

SELECT p.*
FROM policies p
LEFT JOIN customers c
ON p.customer_id = c.customer_id
WHERE c.customer_id IS NULL;



-- DATA QUALITY CHECK 3: Orphan claims (no matching policy)

SELECT cl.*
FROM claims cl
LEFT JOIN policies p
ON cl.policy_id = p.policy_id
WHERE p.policy_id IS NULL;



-- DATA TRANSFORMATION 1: Customer age calculation

SELECT customer_id,first_name,last_name,
DATE_PART('year',AGE(date_of_birth)) AS age
FROM customers;



-- DATA TRANSFORMATION 2: Aggregated claim value per policy

SELECT policy_id,SUM(claim_amount) AS total_claim_value
FROM claims
GROUP BY policy_id;



-- DATA TRANSFORMATION 3: Average policy value by category

SELECT policy_type,AVG(premium_amount) AS avg_premium_value
FROM policies
GROUP BY policy_type;



-- DATA INSIGHTS 1: Total policy records

SELECT COUNT(*) AS total_policy_records
FROM policies;



-- DATA INSIGHTS 2: Total claim value

SELECT SUM(claim_amount) AS total_claim_value
FROM claims;



-- DATA INSIGHTS 3: Policy distribution per customer

SELECT customer_id,COUNT(policy_id) AS policy_count
FROM policies
GROUP BY customer_id
ORDER BY policy_count DESC;



-- DATA ANALYSIS: Basic risk segmentation (data grouping logic)

SELECT customer_id,
SUM(claim_amount) AS total_claim_value,
CASE
WHEN SUM(claim_amount) > 5000 THEN 'HIGH'
WHEN SUM(claim_amount) BETWEEN 2000 AND 5000 THEN 'MEDIUM'
ELSE 'LOW'
END AS risk_segment
FROM claims
GROUP BY customer_id;