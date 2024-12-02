
use testdb;
show  tables;

show tables ;

create  table  course(

    cid int primary key ,
    cname varchar(30)
);

insert into  course(cid, cname) VALUES
                                        (201, 'Mathematics'),
    (202, 'Physics'),
    (203, 'Chemistry');

create table student(

    sid int primary key,
    sname varchar(30),
    cid int,
    foreign key (cid)  references  course(cid)
);

insert into  student(sid, sname, cid) VALUES

                                              (1, 'Alice', 201),
    (2, 'Bob', 202),
    (3, 'Charlie', NULL);

select  course.cid,course.cname,student.sname
from  student
right join  course on  student.cid=course.cid;