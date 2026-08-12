USE aug_10th;


CREATE TABLE Department(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(100) UNIQUE NOT NULL,
  dept_location VARCHAR(100)
  
);
CREATE TABLE Employee(
  emp_id INT PRIMARY KEY,
  emp_firstname VARCHAR(50) NOT NULL,
  emp_lastname VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phn_no BIGINT,
  salary DECIMAL(10,2) CHECK (salary>0),
  hiring_date DATE,
  gender CHAR(1) CHECK(gender in ('M','F')),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
);

DESC Department;
DESC Employee;







-- Q1. Inserting three departments and 5 employees
INSERT INTO Department(dept_id,dept_name,dept_location) VALUES
(1,'CSE','Kolkata'),
(2,'CSE-AI/ML','Barasat'),
(3,'CSE-DS','Madhyamgram');

INSERT INTO Employee(emp_id,emp_firstname,emp_lastname,email,phn_no,salary,hiring_date,gender,dept_id) VALUES
(1,'Sayantan','Bharati','sayantanbharati@gmail.com',9876543210,50000.25,CURDATE(),'M',1),
(2,'Anisha','Roy','anisharoy@gmail.com',9844443210,45000.25,CURDATE(),'F',2),
(3,'Amitabh','Bacchan','amitabhbacchan@gmail.com',9873333210,87000.25,CURDATE(),'M',2),
(4,'Einstine','Biswas','einsitebiswas@gmail.com',9873999210,24000.25,CURDATE(),'M',3),
(5,'Koyel','Bhattacharjee','koyel@gmail.com',9873003210,40000.25,CURDATE(),'F',3);

SELECT * FROM Department;
SELECT * FROM Employee;








-- Q2. updating salary from a employee from a specific department
UPDATE Employee 
SET salary=70000.35
WHERE emp_id=1 AND dept_id=(
  SELECT dept_id 
  FROM Department 
  WHERE dept_name='CSE'
);
SELECT * FROM Employee;








-- Q3. delete employee who earn less than 40000
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employee WHERE salary<40000;
SELECT * FROM Employee;
SET SQL_SAFE_UPDATES = 1;








-- Q4. addding a new comlumn to employee table and inserting data
ALTER TABLE Employee ADD emp_address VARCHAR(100) DEFAULT NULL;

INSERT INTO Employee(emp_id,emp_firstname,emp_lastname,email,phn_no,salary,hiring_date,gender,dept_id,emp_address) VALUES
(6,'Sayan','Bar','sayan@gmail.com',9844543210,50000.25,CURDATE(),'M',1,'Kolkata');

UPDATE Employee SET emp_address='Thakurnagar' WHERE emp_id=1;
UPDATE Employee SET emp_address='Barasat' WHERE emp_id=2;
UPDATE Employee SET emp_address='Kolkata' WHERE emp_id=3;
UPDATE Employee SET emp_address='Bidhannagar' WHERE emp_id=4;
UPDATE Employee SET emp_address='Kalighat' WHERE emp_id=5;

SELECT * FROM Employee;









-- Q5. truncate the departments table and observe the result (answers cannot truncate table with FOREIGN key coonstraint)
TRUNCATE TABLE Department;
DESC Department;
SELECT * FROM Department;