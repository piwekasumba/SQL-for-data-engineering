INSERT INTO Customers (first_name, last_name, date_of_birth, gender, address, city, state, zip_code)
VALUES
('John', 'Doe', '1990-05-14', 'M', '12 Oak Street', 'Johannesburg', 'Gauteng', '2000'),
('Sarah', 'Smith', '1988-09-22', 'F', '45 Pine Road', 'Cape Town', 'Western Cape', '8001'),
('Michael', 'Brown', '1995-03-10', 'M', '78 Maple Ave', 'Durban', 'KwaZulu-Natal', '4001'),
('Emily', 'Davis', '1992-11-05', 'F', '33 River Street', 'Pretoria', 'Gauteng', '0001'),
('David', 'Miller', '1985-07-19', 'M', '90 Hill Lane', 'Bloemfontein', 'Free State', '9301');

INSERT INTO PolicyTypes (PolicyTypeName, Description)
VALUES
('Health', 'Medical insurance covering hospital and treatment costs'),
('Auto', 'Vehicle insurance covering accidents and damage'),
('Home', 'Property insurance for house and contents'),
('Life', 'Life insurance providing beneficiary payout'),
('Travel', 'Insurance covering travel risks and cancellations');

INSERT INTO Policies (
customer_id, policy_number, policy_type,
start_date, end_date,
premium_amount, coverage_amount, policy_status
) 
VALUES
(1, 'POL1001', 'Health', '2023-01-01', '2024-01-01', 1200.00, 50000.00, 'Active'),
(2, 'POL1002', 'Auto', '2022-06-15', '2023-06-15', 800.00, 30000.00, 'Expired'),
(3, 'POL1003', 'Home', '2023-03-10', NULL, 1500.00, 100000.00, 'Active'),
(4, 'POL1004', 'Life', '2021-08-20', '2022-08-20', 2000.00, 200000.00, 'Expired'),
(5, 'POL1005', 'Auto', '2023-09-01', NULL, 950.00, 45000.00, 'Active');

INSERT INTO Orders (
Customer_ID, Order_Date,
Product_Name, Quantity,
Unit_Price, Total_Amount
)
VALUES
(1, '2023-02-10', 'Laptop', 1, 12000.00, 12000.00),
(2, '2023-03-12', 'Headphones', 2, 1500.00, 3000.00),
(3, '2023-04-18', 'Office Chair', 1, 3200.00, 3200.00),
(4, '2023-05-22', 'Desk Lamp', 3, 800.00, 2400.00),
(5, '2023-06-30', 'Mouse', 2, 500.00, 1000.00),
(1, '2023-07-15', 'Keyboard', 1, 900.00, 900.00);

INSERT INTO CLAIMS (
Policy_ID, Customer_ID,
Claim_Date, Claim_Amount,
Claim_Description, Claim_Status
) 
VALUES
(1, 1, '2023-06-10', 2500.00, 'Car accident damage repair', 'Approved'),
(2, 2, '2023-07-15', 1200.00, 'Medical claim submission', 'Pending'),
(3, 3, '2023-08-05', 5000.00, 'House fire damage claim', 'Rejected'),
(1, 1, '2023-09-01', 1800.00, 'Hospital treatment claim', 'Approved'),
(5, 5, '2023-09-10', 3000.00, 'Vehicle accident claim', 'Pending');

