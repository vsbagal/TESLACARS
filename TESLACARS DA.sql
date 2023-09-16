/*Moderate Problem Statements:
1. Retrieve the total number of customers in the database.*/
SELECT * FROM Customers;

-- 2. List all product names and their corresponding unit prices.
SELECT * FROM Products;

-- 3. Calculate the total revenue generated from each product.
SELECT
    p.ProductName, SUM(o.Quantity * (1 - o.Discount) * p.UnitPrice) AS TotalRevenue
FROM
    Products p
JOIN
    Orders o ON p.ProductID = o.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalRevenue DESC;

-- 4. Find the top 5 customers who made the highest total purchases.
SELECT
    c.FirstName,
    c.LastName,
    SUM(o.Quantity * (1 - o.Discount) * pr.UnitPrice) AS TotalPurchases
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products pr ON pr.ProductID = o.ProductID
GROUP BY
    c.FirstName, c.LastName
ORDER BY
    TotalPurchases DESC
LIMIT 5;

-- 5. Calculate the average quantity of products ordered.
SELECT AVG(Quantity) AS AverageQuantity FROM Orders;

-- 6. List all orders made in the year 2022.
SELECT OrderDate, CustomerID, YEAR(OrderDate) FROM ORDERS
WHERE 
	YEAR(OrderDate) = '2022';

-- 7. Calculate the total discount given across all orders.
SELECT
    SUM(Discount) AS TotalDiscount
FROM
    Orders;

-- 8. Count the number of orders placed by each customer.
SELECT 
	CustomerID, COUNT(Quantity) OrderByCustomer
FROM
	Orders
GROUP BY 
	CustomerID;
    
-- 9. Calculate the total revenue for each year.
SELECT
    YEAR(OrderDate) AS OrderYear,
    SUM(Quantity * (1 - Discount) * UnitPrice) AS TotalRevenue
FROM
    Orders
JOIN
    Products ON Orders.ProductID = Products.ProductID
GROUP BY
    OrderYear
ORDER BY
    OrderYear;

-- 10. List the names of employees hired in 2021 and their positions.
SELECT 
	YEAR(HireDate) AS HireYear, FirstName, LastName 
FROM 
	Employees
WHERE 
	YEAR(HireDate) = '2021';

-- 11. Calculate the average salary of employees hired in the last two years.
SELECT
    AVG(Salary) AS AverageSalaryLastTwoYears
FROM
    Employees
WHERE
	YEAR(HireDate) >= YEAR(CURRENT_DATE) -2;
    
-- 12. Retrieve the orders with a discount higher than 10%.
SELECT * FROM ORDERS 
WHERE 
	Discount > '0.10'
ORDER BY
	Discount DESC;

-- 13. Calculate the total revenue and average revenue per order.
SELECT
    SUM(Quantity * (1 - Discount) * UnitPrice) AS TotalRevenue,
    AVG(Quantity * (1 - Discount) * UnitPrice) AS AverageRevenuePerOrder
FROM
    Orders
JOIN
    Products ON Orders.ProductID = Products.ProductID;

-- 14. Find the products that were never ordered.
SELECT
    p.ProductName
FROM
	Products p
LEFT JOIN 
	Orders o ON p.ProductID = o.ProductID
WHERE
    o.OrderID IS NULL;

-- 15. List the names of employees who have a salary above the average salary.
SELECT EmployeeID, FirstName, LastName 
FROM 
	Employees
WHERE 
	Salary > (SELECT AVG(Salary) FROM Employees);
    
-- 16. Calculate the total revenue for each product.
SELECT
    p.ProductName,
    SUM(o.Quantity * (1 - o.Discount) * pr.UnitPrice) AS TotalRevenue
FROM
    Products p
JOIN
    Orders o ON p.ProductID = o.ProductID
JOIN
    Products pr ON pr.ProductID = o.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalRevenue DESC;

-- 17. Retrieve the orders placed by customers with the last name 'Smith'.
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.OrderDate
FROM
    Orders o
JOIN
    Customers c ON o.CustomerID = c.CustomerID
WHERE
    c.LastName = 'Smith';

-- 18. Calculate the average discount applied to orders.
SELECT AVG(Discount)*100 AS AvgDiscount FROM Orders;

-- 19. Find the top 5 employees with the highest salaries.
SELECT * FROM Employees
ORDER BY Salary DESC LIMIT 5;

-- 20. List the products ordered by each customer.
SELECT c.FirstName,c.LastName,p.ProductName,o.Quantity
FROM Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products p ON o.ProductID = p.ProductID
ORDER BY
    c.LastName, c.FirstName, p.ProductName;

/*Advanced Problem Statements:
21. Calculate the total revenue for each quarter of the year.*/
SELECT
    YEAR(OrderDate) AS OrderYear,
    CONCAT(QUARTER(OrderDate),' ', 'QTR') AS Quarter,
    SUM(Quantity * (1 - Discount) * UnitPrice) AS TotalRevenue
FROM
    Orders
JOIN
    Products ON Orders.ProductID = Products.ProductID
GROUP BY
    OrderYear, Quarter
ORDER BY
    OrderYear, Quarter;

-- 22. Retrieve the customers who have not placed any orders.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.CustomerID IS NULL;

-- 23. Calculate the average salary change for employees who changed positions.
-- Limited Data

-- 24. List the products that have never been ordered and the reason why.
-- Limited Data

-- 25. Find the customers who made the highest purchase in each year.
SELECT
    YEAR(OrderDate) AS OrderYear,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    MAX(o.Quantity * (1 - o.Discount) * pr.UnitPrice) AS HighestPurchase
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products pr ON pr.ProductID = o.ProductID
GROUP BY
    OrderYear, c.CustomerID, c.FirstName, c.LastName
ORDER BY HighestPurchase DESC;

-- 26. Calculate the percentage of total revenue generated by each product.
SELECT
    p.ProductName,
    SUM(o.Quantity * (1 - o.Discount) * pr.UnitPrice) AS ProductRevenue,
    (SUM(o.Quantity * (1 - o.Discount) * pr.UnitPrice) / 
    SUM(SUM(o.Quantity * (1 - o.Discount) * pr.UnitPrice)) OVER()) * 100 AS RevenuePercentage
FROM
    Products p
JOIN
    Orders o ON p.ProductID = o.ProductID
JOIN
    Products pr ON pr.ProductID = o.ProductID
GROUP BY
    p.ProductName
ORDER BY
    ProductRevenue DESC;

-- 27. List the employees who have never changed positions.
-- limited data

-- 28. Calculate the cumulative salary expense for each department over time.


-- 29. Find the customers who placed orders in consecutive months.


-- 30. Calculate the average salary of employees for each type of position.
SELECT AVG(Salary)AS AverageSalary, Position 
FROM Employees
GROUP BY Position
ORDER BY AverageSalary DESC;

-- 31. List the employees who changed positions more than once.
-- limited Data

-- 32. Calculate the standard deviation of salaries within each department.


-- 33. Find the customer who made the highest purchase in a single order.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    MAX(o.Quantity * (1 - o.Discount) * pr.UnitPrice) AS HighestPurchase
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    Products pr ON pr.ProductID = o.ProductID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName, o.OrderID
ORDER BY
    HighestPurchase DESC
LIMIT 1;

-- 34. Calculate the average number of products ordered in each year.
SELECT
    YEAR(OrderDate) AS OrderYear,
    AVG(Quantity) AS AverageProductsOrdered
FROM
    Orders
GROUP BY
    OrderYear
ORDER BY
    OrderYear;

-- 35. List the employees whose salary has increased by more than 20%.
-- Limited Data

-- 36. Find the customers who placed orders for all available products.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.FirstName, c.LastName
HAVING
    COUNT(DISTINCT o.ProductID) = (SELECT COUNT(*) FROM Products);

-- 37. Calculate the total revenue for each product, including and excluding discounts.
SELECT 
	ProductName, SUM((o.Quantity *(1-o.Discount) * p.UnitPrice)) AS TotalRevenueIncludingDiscount,
	SUM((o.Quantity * p.UnitPrice)) AS TotalRevenueExcludingDiscount
FROM
	Orders o 
JOIN
	Products p ON o.ProductID = p.ProductID
GROUP BY 
	ProductName;

-- 38. List the employees who have been with the company for more than 2 years.
SELECT * FROM
    Employees
WHERE
    DATEDIFF(NOW(), HireDate) > 730;

-- 	 
SELECT MAX(Salary), SUM(Salary), Position FROM Employees
GROUP BY Position


-- 40. Find the employees whose salary is above the 90th percentile.
SELECT
   *
FROM (
    SELECT
        e.*,
        PERCENT_RANK() OVER (ORDER BY e.Salary) AS Percentile
    FROM Employees e
) AS SalaryPercentiles
WHERE
    Percentile >= 0.9;

-- 41. Calculate the average salary change for employees in each year.
-- Limited Data

-- 42. List the products that have been ordered by at least 3 different customers.
SELECT
    p.ProductName,
    COUNT(DISTINCT o.CustomerID) AS NumberOfCustomers
FROM
    Products p
JOIN
    Orders o ON p.ProductID = o.ProductID
GROUP BY
    p.ProductName
HAVING
    COUNT(DISTINCT o.CustomerID) >= 3
ORDER BY
    NumberOfCustomers DESC;

-- 43. Find the employees who have held the same position for more than 3 years.
SELECT FirstName, LastName, HireDate FROM Employees
WHERE HireDate > 1095;
-- Limited data

-- 44. Calculate the coefficient of variation of salaries within each department.


-- 45. List the orders placed by customers whose last name starts with 'J'.
SELECT c.FirstName, c.LastName, o.OrderID, o.CustomerID FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.LastName LIKE 'J%';

-- 46. Find the products that have been ordered by customers from at least two different countries.
-- Limited Data

-- 47. Calculate the total revenue for each product category within each year.

-- 48. List the employees who were hired in the same year as their supervisor.
-- Limited Data

-- 49. Find the customers who placed orders in three consecutive months.


-- 50. Calculate the average salary of employees who changed positions within the last year.
 -- Limited Data