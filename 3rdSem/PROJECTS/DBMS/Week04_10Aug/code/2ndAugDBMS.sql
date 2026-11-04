-- Assignment III: Employee Management System – Table Creation with Data Types, Constraints, and Indexes
-- Constraints:
-- Departments Table where: 
-- •	* DepartmentID: Primary key
-- •	* DepartmentName: Unique and cannot be null
-- •	* Location: Optional text field

-- Employee table where 
-- •	EmployeeID: Primary key
-- •	Email: Unique constraint
-- •	Phone: Fixed 10-digit character
-- •	Salary: Decimal with 2 precision and must be > 0
-- •	HireDate: Default set to today’s date• Gender: Only 'M' or 'F' allowed
-- •	FOREIGN KEY: Links to Departments
-- Create Indices 
-- Index on LastName for faster search

DROP DATABASE aug_3rd;
CREATE DATABASE aug_3rd;
USE aug_3rd;

-- CREATING DEPARTMENT SCHEMA\
CREATE TABLE Department(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(30) UNIQUE NOT NULL,
  location VARCHAR(50)
);

-- CREATING EMPLOYEE SCHEMA
CREATE TABLE Employee(
  emp_id INT PRIMARY KEY,
  emp_firstname VARCHAR(30),
  emp_lastname VARCHAR(30),
  email VARCHAR(50) UNIQUE,
  phn_no BIGINT CHECK(phn_no >= 1000000000 AND phn_no <= 9999999999 ),
  salary DECIMAL(10,2) CHECK(salary>=0),
  hiring_date DATE,
  gender VARCHAR(10) CHECK(gender='M' or gender='F'),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- DESCRIBING TABLE TO CHECK THE OUTPUT 
desc Department;
desc Employee;

-- INSERTING INTO DEPARTMENT TABLE
INSERT INTO Department(dept_id,dept_name,location) VALUES
(1,'CSE','Kolkata'),
(2,'CSE-AI/ML','Barasat'),
(3,'CSE-DS','Madhyamgram');

-- SHOWING ALL ROWS FROM DEPARTMENT
SELECT * FROM Department;

-- INSERTING INTO EMPLOYEE TABLE

INSERT INTO Employee(emp_id,emp_firstname,emp_lastname,email,phn_no,salary,hiring_date,gender,dept_id) VALUES
(1,'Sayantan','Bharati','sayantanbharati@gmail.com',9876543210,50000.25,CURDATE(),'M',1),
(2,'Anisha','Roy','anisharoy@gmail.com',9844443210,45000.25,CURDATE()+1,'F',2),
(3,'Amitabh','Bacchan','amitabhbacchan@gmail.com',9873333210,87000.25,CURDATE()+2,'M',2),
(4,'Einsine','Biswas','einsitebiswas@gmail.com',9873999210,74000.25,CURDATE(),'M',3),
(5,'Koyel','Bhattacharjee','koyel@gmail.com',9873003210,40000.25,CURDATE(),'F',3);

-- SHOWING ALL ROWS FROM EMPLOYEE
SELECT * FROM Employee;

-- CREATING INDEX ON LAST NAME
CREATE INDEX idx_lastname 
ON Employee(emp_lastname);

-- SHOWING INDEX ON FOR EMPLOYEE TABLE
SHOW INDEX FROM Employee;





-- 1. Employee PRIMARY KEY violation
INSERT INTO Employee
(emp_id, emp_firstname, emp_lastname, email, phn_no, salary, hiring_date, gender, dept_id)
VALUES
(1, 'Rahul', 'Das', 'rahul@gmail.com', 9871111111, 30000.00, CURDATE(), 'M', 1);


-- 2. Department UNIQUE constraint violation
INSERT INTO Department
(dept_id, dept_name, location)
VALUES
(4, 'CSE', 'Howrah');


-- 3. Phone number CHECK constraint violation
-- Phone number has only 9 digits
INSERT INTO Employee
(emp_id, emp_firstname, emp_lastname, email, phn_no, salary, hiring_date, gender, dept_id)
VALUES
(6, 'Rahul', 'Das', 'rahul@gmail.com', 987654321, 30000.00, CURDATE(), 'M', 1);


-- 4. Salary less than 0
INSERT INTO Employee
(emp_id, emp_firstname, emp_lastname, email, phn_no, salary, hiring_date, gender, dept_id)
VALUES
(7, 'Ayan', 'Roy', 'ayan@gmail.com', 9871112222, -5000.00, CURDATE(), 'M', 1);


-- 5. Salary with wrong precision
INSERT INTO Employee
(emp_id, emp_firstname, emp_lastname, email, phn_no, salary, hiring_date, gender, dept_id)
VALUES
(8, 'Priya', 'Sen', 'priya@gmail.com', 9872223333, 35000.567, CURDATE(), 'F', 1);


-- 6. Wrong gender input
INSERT INTO Employee
(emp_id, emp_firstname, emp_lastname, email, phn_no, salary, hiring_date, gender, dept_id)
VALUES
(9, 'Arjun', 'Pal', 'arjun@gmail.com', 9873334444, 40000.00, CURDATE(), 'X', 1);

