
DROP DATABASE IF EXISTS 28sep;
CREATE DATABASE IF NOT EXISTS 28sep;
USE 28sep;


create table department(
  d_id int primary key,
  d_name varchar(10)
);

create table employee(
  e_id int primary key,
  e_name varchar(50),
  email varchar(100),
  salary decimal(10,2),
  d_id int,
  foreign key (d_id) references department(d_id)
);

insert into department values
(1,"CSE"),
(2,"CSE-AI"),
(3,"CSE-DS"),
(4,"CSE-CS"),
(5,"BCA");

insert into employee values
(1,"A","A@gmail.com",10000.25,1),
(2,"B","B@gmail.com",20000.05,4),
(3,"C","C@gmail.com",25000.75,2),
(4,"D","D@gmail.com",25000.45,3),
(5,"E","E@gmail.com",16000.23,1),
(6,"F","F@gmail.com",37000.25,1),
(7,"G","G@gmail.com",26000.05,4),
(8,"H","H@gmail.com",34000.75,3),
(9,"I","I@gmail.com",23000.45,2),
(10,"J","J@gmail.com",17000.23,2);

-- select * from department;
-- select * from employee;

-- 1. find employees who earn more than the average salary of their department
select * from employee e where salary > (
  select AVG(salary) from employee where d_id=e.d_id
);

-- 2. list employees who are the highest paid in their respective departments
select * from employee e where salary = (
  select MAX(salary) from employee where d_id=e.d_id
);

-- 3. display departments with more than 2 employees
select d_id,count(*) from employee group by d_id having count(*) > 2;

-- 4. list employees whose salary is above the overall average but not the highest in their department
select * from employee e where salary > (
  select avg(salary) from employee
)
and salary < (
  select MAX(salary) from employee where d_id=e.d_id
);

-- 5. find employees who do not belong to departmnents having any employee with salary less than 20000
select * from employee e where e.d_id not in (
  select d_id from employee where salary < 20000
);