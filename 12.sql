show  tables ;
create  table  employee(

    eid int primary key ,
    ename varchar(30),
    did int
);

insert into employee(eid, ename, did) VALUES
                                          (1, 'Alice', 101),
       (2, 'Bob', 102),
       (3, 'Charlie', 103),
       (4, 'Diana', NULL);

create  table department(

    did int primary key,
    dname varchar(30)
);

insert into department(did, dname) VALUES
                                        (101, 'HR'),
       (102, 'Finance'),
       (104, 'IT');


create  table project(

    pid int primary key ,
    pname varchar(30),
    did int
);

insert into project(pid, pname, did) VALUES
                                         (1, 'Project A', 101),
       (2, 'Project B', 102),
       (3, 'Project C', 105);


select  employee.eid,employee.ename,department.dname
from employee
left join department
on employee.did=department.did;

select  department.dname,project.pname
from department
right join project
on department.did=project.did;

select  employee.ename,project.pname
from employee
join project
on employee.did=project.did;

select  department.dname,count(employee.eid) as ecount
from department
left join employee
on department.did=employee.did
group by department.dname;

select  department.dname,count(project.pid) as pcount
from department
left join  project
on department.did=project.did
group by department.dname ;

select  department.dname,count(employee.eid) as ecount,  count(project.pid) as pcount
from  department
left join employee on department.did=employee.did
left join project on  department.did=project.did
group by department.dname ;

select  project.pname
from project
left  join  department
on project.did=department.did
where department.did is Null;

select  department.dname
from department
join project on department.did=project.did
group by department.dname;

select  ename
from employee
where  did is NULL;

select employee.ename,department.dname,project.pname
from department
left join employee
on department.did=employee.did
left join project
on department.did=project.did;

-- Identify Departments where every Employee is working on at least one Project

select  department.dname
from department
left join employee on department.did=employee.did
left join project on department.did=project.did
group by dname
having  count(eid)=count(pid);

-- Check which Departments do not have any Projects and any Employees

select  department.dname
from department
left join  employee on department.did=employee.did
left join project on department.did=project.did
where  eid is  NULL and pid is NULL;

select  department.dname,count(project.pid) as pcount
from department
left join  project
on department.did=project.did
group by department.dname
order by  pcount  desc
limit 1;

select department.dname,count(project.pid) as pcount
from department
left join project
on department.did=project.did
group by department.dname ;