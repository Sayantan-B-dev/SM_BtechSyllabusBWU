drop database if exists _31Aug;
create database _31Aug;
use _31Aug;


-- create students and departments table and insert 3 records in each
create table Students(
    student_id  int primary key,
    student_name varchar(100) unique not null,
    std_dept_name varchar(100)
);

create table Departments(
    dept_id int primary key,
    dept_name varchar(100) unique not null
);

insert into Students values 
(1,"Ahin Paul","CSE"),
(2,"Palash Kirtaniya","CSE-AI"),
(3,"Ahina Sen","CSE-DS"),
(4,"Kalyan Mondal",null);

insert into Departments values
(100,"CSE"),
(101,"CSE-AI"),
(102,"CSE-DS"),
(103,"CSE-CS");

-- check all records in student and departments table
select * from Students;
select * from Departments;

-- Q1. display each student's name together with their department id in which student is enrolled
select student_name,dept_id 
from Students s
inner join Departments d
where s.std_dept_name=d.dept_name;

-- Q2. display the names of students who belong to the department 101
select student_name 
from Students s
inner join Departments d
where s.std_dept_name=d.dept_name and d.dept_id=101;

-- Q3. display all students and their department id , including students who have not been assigned a department
select s.*,d.dept_id 
from Students s
left join Departments d
on s.std_dept_name=d.dept_name;

-- Q4. use a euqi join to display that student name and department
select * 
from Students s,Departments d
where s.std_dept_name=d.dept_name;

-- Q5. display all info from student whos dept id is 102 using euqi join
select s.student_name,d.dept_id
from Students s,Departments d
where s.std_dept_name=d.dept_name and d.dept_id=102;   

-- Q6. diplay the dept id along with the student name including department with no students 
select d.dept_id ,s.student_name
from Students s
right join Departments d
on s.std_dept_name=d.dept_name;

-- Q7. display every student name and dept id including unmatched column
select Students.student_name, Departments.dept_id
from Students
cross join Departments;

-- SELECT Students.student_name, Departments.dept_id 
-- FROM Students 
-- LEFT JOIN Departments ON Students.std_dept_name = Departments.dept_name

-- UNION

-- SELECT Students.student_name, Departments.dept_id 
-- FROM Students 
-- RIGHT JOIN Departments ON Students.std_dept_name = Departments.dept_name;