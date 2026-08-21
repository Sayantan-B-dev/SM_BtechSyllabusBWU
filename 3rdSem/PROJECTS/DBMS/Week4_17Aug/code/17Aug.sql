USE aug_17th;

CREATE TABLE Departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100) UNIQUE NOT NULL,
  dept_location VARCHAR(100)
);
CREATE TABLE Employees (
  emp_id INT PRIMARY KEY,
  emp_firstname VARCHAR(50) NOT NULL,
  emp_lastname VARCHAR(50) NOT NULL,
  emp_email VARCHAR(100) UNIQUE,
  phn_no CHAR(10),
  salary DECIMAL(10, 2) CHECK (Salary > 0),
  hiring_date DATE,
  gender CHAR(1) CHECK (Gender IN ('M', 'F')),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

DESC Departments;
DESC Employees;

INSERT INTO Departments VALUES 
(1,'CSE','Building V'),
(2,'CSE-AI/ML','Building VI'),
(3,'CSE-DS','Building VII');

INSERT INTO Employees VALUES 
(101,'Ram','Das','ram@gmail.com',9876543210,50000.25,CURDATE(),'M',1),
(102,'Sham','Roy','sham@gmail.com',9876883210,60000.25,CURDATE(),'M',2),
(103,'Kalyan','Biswas','kalyan@gmail.com',9899543210,86000.25,CURDATE(),'M',3),
(104,'Sayani','Paul','sayani@gmail.com',9876544210,38000.25,CURDATE(),'F',1),
(105,'Prem','Shau','prem@gmail.com',9866643210,25000.25,CURDATE(),'M',3);


-- 1. Display all records from the Employees table. 
SELECT * FROM Employees;
-- 2. Display only the FirstName and Salary of all employees. 
SELECT emp_firstname,salary FROM Employees;
-- 3. Display the details of employees whose salary is greater than 40,000.
SELECT * FROM Employees WHERE salary>40000;
-- 4. Update the salary of the employee with EmployeeID = 101 to 60,000. 
UPDATE Employees SET salary=60000 WHERE emp_id=101;
SELECT * FROM Employees;
-- 5. Update the salary to 65,000 and phone number to 9999999999 for the employee whose email is amit.verma@example.com.
UPDATE Employees SET emp_email='amit.verma@example.com' WHERE emp_id=101;
UPDATE Employees SET salary=65000,phn_no=9988776655 WHERE emp_email='amit.verma@example.com';
SELECT * FROM Employees;
-- 6. Delete the employee whose EmployeeID = 101. 
DELETE FROM Employees WHERE emp_id=101;
SELECT * FROM Employees;
-- 7. Delete all employees belonging to Department ID = 1.
DELETE FROM Employees WHERE dept_id=1;
SELECT * FROM Employees;
-- 10. Drop the CompanyDB database.(skipping)
-- 11. Add a new column named ManagerName (VARCHAR(100)) to the Departments +table. 
ALTER TABLE Departments ADD manager_name VARCHAR(100);
DESC Departments;
-- 12. Modify the Salary column in the Employees table to DECIMAL(12,2). 
ALTER TABLE Employees MODIFY salary DECIMAL(12,2);
DESC Employees;
-- 13. Rename the ManagerName column to HeadOfDepartment. 
ALTER TABLE Departments RENAME COLUMN manager_name To head_of_department;
DESC Departments;
-- 14. Drop the HeadOfDepartment column from the Departments table.
ALTER TABLE Departments DROP head_of_department;
DESC Departments;
-- 8. Remove all records from the Employees table using the TRUNCATE statement.
TRUNCATE TABLE Employees;
DESC Employees;
-- 9. Drop the Employees table. 
DROP TABLE Employees;