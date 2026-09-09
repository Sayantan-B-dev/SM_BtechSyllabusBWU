-- ============================================
-- ASSIGNMENT 8: EMPLOYEE MANAGEMENT SYSTEM
-- IN, BETWEEN, LIKE, ORDER BY, GROUP BY, HAVING
-- AND AGGREGATE FUNCTIONS
-- ============================================

DROP DATABASE IF EXISTS 14sep;
CREATE DATABASE IF NOT EXISTS 14sep;
USE 14sep;


-- Main Schema
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone CHAR(10),
    Salary DECIMAL(10, 2),
    Gender CHAR(1),
    DepartmentID INT
);


-- Insert Records
INSERT INTO Employees VALUES
(101, 'Amit', 'Verma', 'amit.v@example.com', '9876543210', 55000.00, 'M', 1),
(102, 'Priya', 'Mehra', 'priya.m@example.com', '9123456789', 65000.00, 'F', 2),
(103, 'Ravi', 'Singh', 'ravi.s@example.com', '9988776655', 40000.00, 'M', 1),
(104, 'Sneha', 'Roy', 'sneha.r@example.com', '9876501234', 75000.00, 'F', 3),
(105, 'Anil', 'Kumar', 'anil.k@example.com', '9812345678', 30000.00, 'M', 2);


-- 1. Using IN Clause
-- Select employees from Department 1 and 3.
SELECT *
FROM Employees
WHERE DepartmentID IN (1, 3);


-- 2. Using BETWEEN Clause
-- Select employees with salary between ₹40,000 and ₹70,000.
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 70000;


-- 3. Using LIKE Clause
-- Select employees whose first name starts with 'A'.
SELECT *
FROM Employees
WHERE FirstName LIKE 'A%';


-- 4. Using ORDER BY Clause
-- Sort employees by salary in ascending order.
SELECT *
FROM Employees
ORDER BY Salary ASC;


-- 5. Using GROUP BY Clause
-- Get total number of employees per department.
SELECT DepartmentID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID;


-- 6. Using HAVING Clause
-- Get departments with more than 1 employee.
SELECT DepartmentID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 1;


-- 7. Find the total number of employees in the department.
SELECT COUNT(*) AS TotalEmployees
FROM Employees;


-- 8. Find the total salary of all employees.
SELECT SUM(Salary) AS TotalSalary
FROM Employees;


-- 9. Find the average salary of all employees.
SELECT AVG(Salary) AS AverageSalary
FROM Employees;


-- 10. Find the highest salary of the employee.
SELECT MAX(Salary) AS HighestSalary
FROM Employees;


-- 11. Find the lowest salary of the employee.
SELECT MIN(Salary) AS LowestSalary
FROM Employees;


-- 12. Find the number of employees in each department.
SELECT DepartmentID, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY DepartmentID;


-- 13. Find the average salary of employees in each department.
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;


-- 14. Find the total salary paid by each department.
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;


-- 15. Count the number of male and female employees.
SELECT Gender, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Gender;


-- 16. Find the average salary of male and female employees.
SELECT Gender, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Gender;