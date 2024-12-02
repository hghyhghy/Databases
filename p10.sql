create  table  department(

    did int primary key ,
    dname varchar(30),
    allotment int
);

insert into department(did, dname, allotment) VALUES
                                                  (57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);

create table  employee(

    eid int primary key ,
    efname varchar(30),
    elname varchar(30),
    edid int,
    foreign key (edid) references  department(did)
);

insert into employee(eid, efname, elname, edid) VALUES
                                                    (127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);

select employee.eid,employee.efname,employee.elname,department.did,department.dname
from employee
join department
on employee.edid=department.did;

select  department.dname
from     employee
join department
on employee.edid = department.did
group by dname
having count(eid) > 2

select  employee.eid,department.did,employee.efname,employee.elname,department.dname
from employee
left join department
on employee.edid = department.did;

create table student(

    sid int primary key ,
    sname varchar(30),
    cid int
);

insert into student(sid, sname, cid) VALUES
                                         (1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'Diana', 101),
(5, 'Eve', NULL);

create table  courses(

    cid int primary key ,
    cname varchar(30),
    fees int
);

insert into courses(cid, cname, fees) VALUES
                                          (101, 'Mathematics', 500.00),
(102, 'Science', 600.00),
(103, 'History', 400.00),
(104, 'English', 300.00);

select student.sid,student.sname,courses.cid,courses.cname
from student
left join  courses
on student.cid=courses.cid;

select  student.sid,student.sname,courses.cid,courses.cname
from student
inner join  courses
on student.cid=courses.cid;

select  student.sid,student.sname,courses.cid,courses.cname
from  student
right join courses
on student.cid=courses.cid;

select  courses.cname,count(student.sid) as total , sum(courses.fees) as totalfees
from student
left join courses
on student.cid=courses.cid
group by courses.cname ;

select courses.cname,avg(courses.fees) as totalfees
from student
left join courses
on student.cid=courses.cid
group by courses.cname
having  count(sid) > 1;

select courses.cname,courses.fees
from courses
where fees > 400;

