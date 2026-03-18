-- Create roles/users
CREATE ROLE analyst LOGIN PASSWORD 'AnalystPass123';
CREATE ROLE engineer LOGIN PASSWORD 'EngineerPass123';

-- Optionally, create a read-only role
CREATE ROLE read_only;

-- Grant CONNECT privileges on the database
GRANT CONNECT ON DATABASE your_database_name TO analyst, engineer;

-- Grant usage on public schema
GRANT USAGE ON SCHEMA public TO analyst, engineer;

-- Grant table-specific privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE products TO engineer;
GRANT SELECT ON TABLE products TO analyst;

-- Grant read-only role privileges
GRANT read_only TO analyst;

-- Revoke delete permission from analyst if mistakenly granted
REVOKE DELETE ON TABLE products FROM analyst;

-- Revoke role from user
REVOKE read_only FROM analyst;

-- Switch to engineer user (example)
SET ROLE engineer;

-- Engineer can insert
INSERT INTO products (product_name, category, price)
VALUES ('Headphones', 'Electronics', 120.00);

-- Switch back to default
RESET ROLE;

-- Attempt to delete as analyst (should fail if permission revoked)
SET ROLE analyst;
DELETE FROM products WHERE product_name='Headphones';
RESET ROLE;

