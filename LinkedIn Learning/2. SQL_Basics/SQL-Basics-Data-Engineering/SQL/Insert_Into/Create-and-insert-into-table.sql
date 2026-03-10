CREATE TABLE Customers (
Customer_id SERIAL PRIMARY KEY,
Name VARCHAR (100),
Country VARCHAR (50),
Age INTEGER
);


INSERT INTO Customers (Name, Country, Age)
VALUES 
('Alice', 'South Africa', 28),
('John', 'USA', 35),
('Maria', 'Brazil', 31),
('David', 'South Africa', 45)

