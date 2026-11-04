
-- ASSIGNMENT VII: EMPLOYEE MANAGEMENT SYSTEM
-- WHERE CLAUSE WITH LOGICAL OPERATORS


DROP DATABASE IF EXISTS 7sep;
CREATE DATABASE IF NOT EXISTS 7sep;
USE 7sep;


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


-- 1. Display all employees whose salary is greater than ₹50,000.
SELECT *
FROM Employees
WHERE Salary > 50000;


-- 2. Display male employees who belong to Department 1.
SELECT *
FROM Employees
WHERE Gender = 'M'
  AND DepartmentID = 1;


-- 3. Display employees who belong to either Department 1 or Department 2.
SELECT *
FROM Employees
WHERE DepartmentID = 1
   OR DepartmentID = 2;


-- 4. Display employees who do not belong to Department 3.
SELECT *
FROM Employees
WHERE NOT DepartmentID = 3;


-- 5. Display female employees who are not in Department 2
--    and whose salary is greater than ₹60,000.
SELECT *
FROM Employees
WHERE Gender = 'F'
  AND NOT DepartmentID = 2
  AND Salary > 60000;


-- 6. Display employees whose salary is between ₹40,000 and ₹70,000.
SELECT *
FROM Employees
WHERE Salary BETWEEN 40000 AND 70000;


-- 7. Display female employees from Department 2 or Department 3.
SELECT *
FROM Employees
WHERE Gender = 'F'
  AND (DepartmentID = 2 OR DepartmentID = 3);


-- 8. Display male employees whose salary is less than ₹50,000.
SELECT *
FROM Employees
WHERE Gender = 'M'
  AND Salary < 50000;


-- 9. Display employees who are not male and belong to Department 3.
SELECT *
FROM Employees
WHERE NOT Gender = 'M'
  AND DepartmentID = 3;


-- 10. Using AND, OR, and NOT, display employees who belong to
--     Department 1 or Department 2, are not female,
--     and have a salary greater than ₹30,000.
SELECT *
FROM Employees
WHERE (DepartmentID = 1 OR DepartmentID = 2)
  AND NOT Gender = 'F'
  AND Salary > 30000;