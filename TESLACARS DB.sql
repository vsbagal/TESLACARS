CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);
-- Insert sample customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES
    (1, 'John', 'Doe', 'john@example.com', '123-456-7890'),
    (2, 'Jane', 'Smith', 'jane@example.com', '987-654-3210'),
    (3, 'Michael', 'Brown', 'michael@example.com', '555-555-5555'),
    (4, 'Emily', 'Johnson', 'emily@example.com', '111-222-3333'),
    (5, 'David', 'Williams', 'david@example.com', '444-444-4444'),
    (6, 'Sophia', 'Miller', 'sophia@example.com', '666-777-8888'),
    (7, 'James', 'Jones', 'james@example.com', '999-000-1111'),
    (8, 'Olivia', 'Wilson', 'olivia@example.com', '222-333-4444'),
    (9, 'Liam', 'Anderson', 'liam@example.com', '555-555-5555'),
    (10, 'Ava', 'Thomas', 'ava@example.com', '111-222-3333'),
    (11, 'Ethan', 'Martinez', 'ethan@example.com', '333-444-5555'),
    (12, 'Isabella', 'Garcia', 'isabella@example.com', '777-888-9999'),
    (13, 'Noah', 'Lopez', 'noah@example.com', '444-555-6666'),
    (14, 'Emma', 'Hernandez', 'emma@example.com', '888-999-0000'),
    (15, 'Sophia', 'Lee', 'sophia@example.com', '555-666-7777'),
    (16, 'Mia', 'Rodriguez', 'mia@example.com', '666-777-8888'),
    (17, 'Liam', 'Gonzalez', 'liam@example.com', '111-222-3333'),
    (18, 'Oliver', 'Nelson', 'oliver@example.com', '444-555-6666'),
    (19, 'Ava', 'Smith', 'ava@example.com', '777-888-9999'),
    (20, 'Emma', 'Davis', 'emma@example.com', '555-666-7777');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    UnitPrice DECIMAL(10, 2)
);
-- Insert sample products
INSERT INTO Products (ProductID, ProductName, UnitPrice)
VALUES
    (1, 'Model 3', 40000),
    (2, 'Model Y', 45000),
    (3, 'Model S', 55000),
    (4, 'Model X', 50000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(4, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert sample orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID, Quantity, Discount)
VALUES
    (1001, 1, '2020-05-10', 1, 2, 0.1),
    (1002, 2, '2020-06-20', 2, 1, 0.05),
    (1003, 1, '2021-01-05', 3, 1, 0.2),
    (1004, 2, '2022-03-15', 4, 2, 0.15),
    (1005, 3, '2020-08-12', 1, 1, 0.1),
    (1006, 4, '2021-02-25', 2, 3, 0.05),
    (1007, 5, '2022-05-05', 3, 2, 0.1),
    (1008, 6, '2021-07-18', 4, 1, 0.05),
    (1009, 7, '2023-01-20', 1, 1, 0.2),
    (1010, 8, '2020-10-08', 2, 2, 0.15),
    (1011, 9, '2021-12-01', 3, 1, 0.1),
    (1012, 10, '2022-04-10', 4, 3, 0.05),
    (1013, 11, '2020-09-15', 1, 1, 0.1),
    (1014, 12, '2022-03-02', 2, 2, 0.05),
    (1015, 13, '2021-06-08', 3, 1, 0.1),
    (1016, 14, '2022-08-20', 4, 2, 0.15),
    (1017, 15, '2020-11-11', 1, 1, 0.2),
    (1018, 16, '2021-04-15', 2, 3, 0.1),
    (1019, 17, '2022-06-30', 3, 1, 0.05),
    (1020, 18, '2023-02-05', 4, 2, 0.1),
    (1021, 19, '2020-07-22', 1, 1, 0.15),
    (1022, 20, '2022-05-17', 2, 2, 0.05),
    (1023, 1, '2021-09-09', 3, 1, 0.1),
    (1024, 2, '2022-11-25', 4, 2, 0.15),
    (1025, 3, '2020-12-12', 1, 1, 0.2),
    (1026, 4, '2021-03-29', 2, 3, 0.1),
    (1027, 5, '2022-06-07', 3, 2, 0.05),
    (1028, 6, '2021-08-19', 4, 1, 0.1),
    (1029, 7, '2023-03-02', 1, 1, 0.15),
    (1030, 8, '2020-11-24', 2, 2, 0.05);
   
   -- Create table employees
    CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Insert values in employees
-- Insert sample employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, HireDate, Salary)
VALUES
    (1, 'Michael', 'Johnson', 'Sales Manager', '2020-01-15', 80000),
    (2, 'Emily', 'Brown', 'Sales Associate', '2021-02-20', 60000),
    (3, 'James', 'Smith', 'Finance Manager', '2019-03-10', 85000),
    (4, 'Sophia', 'Williams', 'Marketing Coordinator', '2022-06-05', 55000),
    (5, 'David', 'Miller', 'Sales Associate', '2020-08-18', 65000),
    (6, 'Oliver', 'Anderson', 'HR Specialist', '2021-09-25', 60000),
    (7, 'Isabella', 'Martinez', 'Sales Associate', '2021-07-03', 62000),
    (8, 'Ethan', 'Garcia', 'Sales Associate', '2022-04-15', 58000),
    (9, 'Emma', 'Lopez', 'Finance Analyst', '2023-01-30', 70000),
    (10, 'Mia', 'Hernandez', 'Sales Associate', '2022-09-12', 59000);
