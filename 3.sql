create  table department(

        did int primary key ,
    dname varchar(30)
);

insert into  department(did, dname) VALUES
                                            (101, 'HR'),
    (102, 'IT'),
    (103, 'Finance');

create table  employee(

    eid int primary key ,
    ename varchar(30),
    did int,
    foreign key (did) references department(did)
);

insert into  employee(eid,ename,did) values
                                             (1, 'Alice', 101),
    (2, 'Bob', 102),
    (3, 'Charlie', NULL);


show  tables ;
select  department.dname,department.did,employee.ename
from employee
right join  department on  employee.did = department.did;