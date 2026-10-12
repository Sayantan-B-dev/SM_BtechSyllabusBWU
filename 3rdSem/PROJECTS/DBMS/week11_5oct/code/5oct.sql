
DROP DATABASE IF EXISTS 5oct;
CREATE DATABASE IF NOT EXISTS 5oct;
USE 5oct;

-- 1. create department table
create table department(
  dept_id int primary key,
  dept_name varchar(50) not null
);


-- 2. create employee table
create table employee(
  emp_id int primary key,
  emp_name varchar(100) not null,
  dept_id int,
  salary decimal(10,2),
  foreign key (dept_id) references department(dept_id)
);


-- 3. insert values into department table
insert into department values 
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing');


-- 4. insert values into employee table
insert into employee values
(101,'A',1,60000),
(102,'B',1,45000),
(103,'C',1,55000),
(104,'D',3,70000),
(105,'E',4,48000),
(106,'F',1,52000),
(107,'G',2,35000);

-- select * from department;
-- select * from employee;


-- 5. create a view
create view employee_view as
select e.emp_id,e.emp_name,d.dept_name,e.salary
from employee e
inner join department d
where e.dept_id=d.dept_id;



-- 6. query the view
select * from employee_view;
-- employee earning more than 50000
select * from employee_view where salary>50000;


-- 7. update data
-- give 2000 raise to IT employee
update employee
set salary=salary+2000 
where dept_id = (
  select dept_id 
  from department 
  where dept_name ='IT'
);
-- check updated data
select * from employee_view;


-- 8. insert dat
-- insert a new employee into the base table
insert into employee values (111,'I',4,60000);
-- check the newly insterd employee
select * from employee_view where emp_id=111;


-- 9. create high earners view
create view high_earners as
select e.emp_id,e.emp_name,d.dept_name,e.salary
from employee e
join department d
on e.dept_id=d.dept_id
where e.salary>(
  select avg(e2.salary) 
  from employee e2 
  where e2.dept_id=e.dept_id
);
-- display high earners view
select * from high_earners;