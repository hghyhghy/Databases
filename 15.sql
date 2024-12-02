
create  table employee(

    eid int primary key ,
    ename varchar(30),
    did int
);

insert into employee(eid, ename, did) VALUES

                                          (1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'Diana', NULL),
(5, 'Eve', 104);

create table department(

    did int primary key ,
    dname varchar(30)
);


insert into department(did, dname) VALUES
                                       (101, 'HR'),
(102, 'Engineering'),
(103, 'Sales'),
(105, 'Marketing');


create table sales(

    eid int primary key ,
    salary decimal(10,2)
);

insert into sales(eid, salary) VALUES
                                   (1, 60000.00),
(2, 75000.00),
(3, 50000.00),
(5, 45000.00);

-- Retrieve Employee Names along with Department Names (INNER JOIN)
select  employee.ename,department.dname
from employee
inner  join  department
on employee.did=department.did;

-- Retrieve all Employees with their Department Names (LEFT JOIN)
select  employee.ename,department.dname
from employee
left join department
on employee.did=department.did;

-- Retrieve all Departments with their Employee Names (RIGHT JOIN)
select  employee.ename,department.dname
from employee
right join department
on employee.did=department.did;

-- Retrieve Employee Names, Department Names, and Salaries

select  employee.ename,department.dname,sales.salary
from employee
left join department
on employee.did=department.did
left join sales
on employee.eid=sales.eid;

select  employee.ename
from  employee
where did is NULL;

# List all departments and the number of employees in each department.

select  department.dname,count(employee.eid) as ecount
from department
left join employee
on department.did=employee.did
group by  department.dname;

select  employee.ename,sales.salary
from employee
join sales
on employee.eid=sales.eid
where  salary >(select avg(salary) from  sales);

#  Calculate the total salary of employees in each department



select  department.dname,sum(sales.salary)as total
from employee
join department
on employee.did=department.did
join sales
on employee.eid=sales.eid
group by department.dname ;

# Calculate the max salary of employees in each department

select  department.dname,max(sales.salary) as maximum
from employee
join department
on employee.did=department.did
join sales
on employee.eid=sales.eid
group by department.dname ;

select  department.dname,min(sales.salary) as minimum
from employee
join department
on  employee.did=employee.did
join sales
on employee.eid=sales.eid
group by department.dname ;