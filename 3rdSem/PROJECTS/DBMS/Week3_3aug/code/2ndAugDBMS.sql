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






-- -- INSERTING INVALID PHONE NUMBER
-- DELIMITER //
-- CREATE PROCEDURE PhoneError()
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SELECT 'Phone number check failed' AS ErrorOutput;
--     END;
--     INSERT INTO Employee(emp_id,emp_firstname,emp_lastname,email,phn_no,salary,hiring_date,gender,dept_id) VALUES
--     (6,'Sayantan','Bharati','sayantanbharatitest@gmail.com',98765432160,50000.25,CURDATE(),'M',1);
-- END //
-- CALL PhoneError();


