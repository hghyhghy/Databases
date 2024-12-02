

# drop  table  course,enrollment,student;
create  table employee(

    eid int primary key ,
    name varchar(30),
    did int,
    salary decimal(10,2)
);

create  table  department (

    did int primary key ,
    dname varchar(30)
);

insert into  employee(eid, name, did, salary) VALUES
                                                  (1, 'Alice', 101, 60000.00),
(2, 'Bob', 102, 55000.00),
(3, 'Charlie', 103, 70000.00),
(4, 'David', 101, 52000.00),
(5, 'Eve', NULL, 48000.00);

insert into department(did, dname) VALUES

                                       (101, 'HR'),
(102, 'Engineering'),
(103, 'Marketing'),
(104, 'Sales');


select employee.name,department.dname
from employee
join department on employee.did=department.did;

select  employee.name,department.dname
from employee
right join  department on employee.did =department.did;

select  employee.name,employee.salary
from employee
where  salary > 60000;

select  department.dname,count(employee.eid) as empid
from department
left join employee on department.did=employee.did
group by department.dname ;

select  department.dname,avg(employee.salary) as esal
from department
left join employee on department.did = employee.did
group by department.dname ;

select  employee.name
from employee
where  did is null;