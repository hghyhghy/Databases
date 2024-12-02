show  tables ;
create  table  department(

    did int  primary key ,
    dname varchar(30)
);

insert into department(did, dname) VALUES
                                           (1, 'Engineering'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');

create table employee(

    eid int primary key ,
    ename varchar(30),
    did int,
    salary int,
    foreign key (did) references department(did)
);

insert into employee(eid, ename, did, salary) VALUES
                                                      (101, 'Alice', 1, 75000),
    (102, 'Bob', 2, 45000),
    (103, 'Charlie', NULL, 60000),
    (104, 'David', 3, 90000),
    (105, 'Eva', 4, 40000),
    (106, 'Frank', NULL, 52000);

select  employee.eid,employee.ename,department.dname,employee.salary
from  employee
left join  department on employee.did=department.did
where  salary > 50000;
#
#
select  employee.eid,employee.ename,department.dname,employee.salary
from  employee
left join  department on employee.did=department.did
where  salary > 50000
and  (department.dname like  'E%' or  department.dname like  'F%');