-- 1. create department table
create table dept (
    d_id int primary key,
    d_name varchar2(50) not null
);

-- 2. create employee table
create table emp (
    e_id int primary key,
    e_name varchar2(100) not null,
    d_id int,
    sal decimal(10,2),
    foreign key (d_id) references dept(d_id)
);

-- 3. insert department records
insert into dept values
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

-- 4. insert employee records
insert into emp values
(101, 'Sayan', 1, 60000),
(102, 'Sayani', 2, 45000),
(103, 'Ayan', 1, 55000),
(104, 'Souvik', 3, 70000),
(105, 'Sayan Roy', 4, 48000),
(106, 'Sayan Das', 1, 52000),
(107, 'Rohan', 2, 35000);

commit;

-- 5. pl/sql using %type
declare
    v_name emp.e_name%type;
begin
    select e_name into v_name from emp where e_id = 101;
    dbms_output.put_line('name: ' || v_name);
end;
/

-- 6. explicit cursor
declare
    cursor c_emp is select e_name from emp;
    v_name emp.e_name%type;
begin
    open c_emp;
    loop
        fetch c_emp into v_name;
        exit when c_emp%notfound;
        dbms_output.put_line('employee: ' || v_name);
    end loop;
    close c_emp;
end;
/

-- 7. exception handling using no_data_found
declare
    v_name emp.e_name%type;
begin
    select e_name into v_name from emp where e_id = 999;
    dbms_output.put_line('name: ' || v_name);
exception
    when no_data_found then
        dbms_output.put_line('employee not found');
end;
/

-- 8. create procedure to increase salary
create or replace procedure increase_salary(
    p_id int,
    p_amt decimal
)
as
begin
    update emp set sal = sal + p_amt where e_id = p_id;
    dbms_output.put_line('salary updated for id: ' || p_id);
end increase_salary;
/

-- 9. call the procedure
begin
    increase_salary(101, 2000);
end;
/

-- 10. save changes
commit;

-- 11. create function to get department name
create or replace function get_deptname(p_id int)
return varchar2
is
    v_dept dept.d_name%type;
begin
    select d.d_name into v_dept
    from emp e join dept d on e.d_id = d.d_id
    where e.e_id = p_id;
    return v_dept;
end get_deptname;
/

-- 12. call the function
declare
    v_dept varchar2(50);
begin
    v_dept := get_deptname(101);
    dbms_output.put_line('department: ' || v_dept);
end;
/