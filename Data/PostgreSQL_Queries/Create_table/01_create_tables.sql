-- Customers Table 
-- SQL-for-Data-Engineering: PostgreSQL Implementation Project
-- This project is based on the LinkedIn Learning course "Complete Guide to SQL for Data Engineering: from Beginner to Advanced".
-- It demonstrates practical SQL skills including data querying, joins, functions, and data manipulation.
-- The work reflects hands-on implementation in PostgreSQL, covering real-world data engineering concepts.
-- Key areas include data extraction, transformation logic, and analytical querying.
-- The goal is to showcase job-ready SQL and data engineering skills through practical application.

CREATE TABLE customers (
customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
date_of_birth DATE,
gender CHAR(1),
address VARCHAR(100),
city VARCHAR(50),
state VARCHAR(50),
zip_code VARCHAR(10)
);

-- PolicyTypes Table 

CREATE Table PolicyTypes (
PolicyTypeID SERIAL PRIMARY KEY,
PolicyTypeName VARCHAR (50),
Description TEXT 
);

-- Policies Table

CREATE TABLE Policies (
policy_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
customer_id INT NOT NULL,
policy_number VARCHAR(50) UNIQUE NOT NULL,
policy_type VARCHAR(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE,
premium_amount DECIMAL(10,2) NOT NULL,
coverage_amount DECIMAL(12,2) NOT NULL,
policy_status VARCHAR(20) DEFAULT 'Active' 
CHECK (policy_status IN ('Active', 'Expired', 'Cancelled')),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE
);

-- Create Claims Table

CREATE TABLE CLAIMS (
Claim_ID SERIAL PRIMARY KEY,
Policy_ID INT,
Customer_ID INT,
Claim_Date DATE,
Claim_Amount DECIMAL (10,2),
Claim_Description TEXT,
Claim_Status VARCHAR (20),


FOREIGN KEY (Policy_ID) REFERENCES Policies (Policy_ID),
FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID)
);


-- Create Orders Table 

CREATE TABLE Orders (
Order_ID SERIAL PRIMARY KEY,
Customer_ID INT,
Order_Date DATE,
Product_Name VARCHAR (100),
Quantity INT,
Unit_Price DECIMAL (10,2),
Total_Amount DECIMAL (10,2),

FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID)
);