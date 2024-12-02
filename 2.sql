use testdb;
show  tables ;

create  table  student(

    sid int primary key ,
    sname varchar(30)
);
insert into student(sid, sname) values
                                    (1, 'Subham'),
(2, 'Tonmoy'),
(3, 'Swarnodip');



show  tables ;
create  table  course(

    cid int primary key ,
    cname varchar(30)
);

insert into course(cid, cname) values
                                   (101, 'Mathematics'),
(102, 'Physics'),
(103, 'Chemistry'),
(104, 'Biology');

show  tables ;

create table enrollment(

    eid int primary key ,
    sid int,
    cid int
);

insert into  enrollment(eid, sid, cid) VALUES
                                           (1, 1, 101),
(2, 2, 102),
(3, 1, 103);

select  course.cid,course.cname,student.sname
from course
right join enrollment on course.cid=enrollment.cid
right join student on enrollment.sid=student.sid;
