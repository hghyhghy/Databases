

show databases ;
use testdb;
show tables;

create table employee(
    eid int primary key,
    ename varchar(30),
    did int,
    pid int
);

show tables ;

insert into employee(eid,ename,did,pid) values
                                            (1, 'Alice', 101, 1001),
(2, 'Bob', 102, NULL),
(3, 'Charlie', NULL, 1002),
(4, 'Diana', 103, 1003);

create table department(
    did int primary key ,
    dname varchar(30)
);

insert into  department(did,dname) values
                                       (101, 'HR'),
(102, 'IT'),
(103, 'Finance');


show  tables ;

create table project(

    pid int primary key ,
    pname varchar(30)
);

insert into project(pid,pname) values
                                   (1001, 'Website Redesign'),
(1002, 'AI Research'),
(1003, 'Budget Analysis');


show tables ;

select  employee.eid,employee.ename,department.dname,project.pname
from  employee
left join department on employee.did=department.did
left join project on employee.pid=project.pid;