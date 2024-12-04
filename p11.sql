create  table  department(

    did int primary key ,
    dname varchar(30),
    budget  decimal(10,2)
);

insert into department(did, dname, budget) VALUES
                                               (1, 'HR', 50000),
(2, 'Finance', 75000),
(3, 'IT', 100000),
(4, 'Marketing', 45000);

create  table  employee(

    eid int primary key ,
    ename varchar(30),
    salary decimal(10,2),
    did int,
    foreign key (did) references  department(did)
);

insert into employee(eid, ename, salary, did) VALUES
                                                  (101, 'Alice', 5000, 1),
(102, 'Bob', 6000, 2),
(103, 'Charlie', 7000, 3),
(104, 'David', 4000, 3),
(105, 'Eve', 3000, 4),
(106, 'Frank', 4500, 4),
(107, 'Grace', 5500, 2);

select department.dname,sum(employee.salary) as total , count(employee.eid) as totalcount
from employee
join department
on employee.did=department.did
group by department.dname ;

select department.dname,sum(employee.salary) as totalsalary
from employee
join department
on employee.did=department.did
group by department.dname
having  sum(salary) > 10000;

#find the average salary

select  department.dname, avg(employee.salary)  as avgsalary
from employee
join department
on employee.did=department.did
group by department.dname ;

select  employee.ename,department.dname
from employee
join department
on employee.did=department.did
where  budget > 60000;

# Find the Department with the Maximum Number of Employees

select  department.dname,count(employee.eid) as totalcount
from employee
join department
on employee.did=department.did
group by department.dname
order by totalcount  desc
limit  1;

create  table   workers(

    wid int primary key ,
    fname varchar(30),
    lname varchar(30),
    salary int,
    joining datetime,
    dname varchar(30)
);


INSERT INTO workers (wid, fname, lname, salary, joining, dname)
VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');



create  table bonus(

    ref int  ,
    bonus_date datetime,
    amount  decimal(10,2),
    foreign key (ref) references  workers(wid)
);

insert into  bonus(ref, bonus_date, amount) VALUES
                                                (1, '2023-02-20 00:00:00', 5000),
(2, '2023-06-11 00:00:00', 3000),
(3, '2023-02-20 00:00:00', 4000),
(1, '2023-02-20 00:00:00', 4500),
(2, '2023-06-11 00:00:00', 3500);

create  table  Title (

    ref int  ,
    title varchar(30),
    affected datetime,
    foreign key (ref) references  workers(wid)

);

insert into Title(ref, title, affected) VALUES
                                            (1, 'Manager', '2023-02-20 00:00:00'),
(2, 'Executive', '2023-06-11 00:00:00'),
(8, 'Executive', '2023-06-11 00:00:00'),
(5, 'Manager', '2023-06-11 00:00:00'),
(4, 'Asst. Manager', '2023-06-11 00:00:00'),
(7, 'Executive', '2023-06-11 00:00:00'),
(6, 'Lead', '2023-06-11 00:00:00'),
(3, 'Lead', '2023-06-11 00:00:00');


# Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

select  workers.fname as first_name
from workers;

select  upper(workers.fname) as first_name
from workers;

select  DISTINCT  workers.dname
from  workers;