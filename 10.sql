create  table  employee(

    eid int primary key ,
    ename varchar(100),
    did int,
    salary decimal(10,2),
    joining date

);

create table  department(

    did int primary key ,
    dname varchar(100)
);

insert into employee(eid, ename, did, salary, joining) VALUES

                                                          (1, 'Alice', 101, 75000, '2020-03-15'),
(2, 'Bob', 102, 55000, '2021-06-20'),
(3, 'Charlie', 101, 85000, '2019-12-01'),
(4, 'David', 103, 45000, '2022-01-10'),
(5, 'Eve', 102, 60000, '2021-08-25');

insert into department(did, dname) VALUES
                                       (101, 'Engineering'),
(102, 'Human Resources'),
(103, 'Marketing');
#
select  * from employee;

select  avg(employee.salary) as avs from employee;

select  department.dname, count(employee.eid) as ecount
from employee
join department on employee.did=department.did
group by department.dname ;

select  employee.ename , upper(employee.ename) as uname
from employee;

select  department.dname, count(employee.eid) as ecount
from employee
join department
on employee.did=department.did
group by department.dname ;

select  employee.ename,concat(employee.ename, '-', department.dname) as fulldesc
from employee
join department
on employee.did = department.did;

select  employee.ename,employee.joining
from employee
where year(joining) = 2021;

select  employee.ename,employee.salary,employee.salary * 10 as esal
from employee;