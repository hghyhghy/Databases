create table student(

    sid int primary key ,
    sname varchar(30)
);

insert into student(sid, sname) VALUES
                                    (1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

create table  course(

    cid int primary key ,
    cname varchar(30)
);

insert into  course(cid, cname) VALUES
                                    (101, 'Mathematics'),
(102, 'Physics'),
(103, 'Chemistry');

create table enrollment(

    eid int primary key ,
    sid int,
    cid int,
    foreign key (sid) references  student(sid),
    foreign key (cid) references course(cid)
);

insert into enrollment(eid, sid, cid) VALUES
                                          (1, 1, 101),
(2, 2, 102),
(3, 3, 103),
(4, 1, 103),
(5, 4, 101);

select  student.sname,course.cname
from enrollment
join student on enrollment.sid = student.sid
join course on enrollment.cid = course.cid
order by cname desc ;

select  student.sname,course.cname
from enrollment
join student on enrollment.sid = student.sid
join course on enrollment.cid = course.cid
order by cname desc ;

select  student.sname,course.cname
from enrollment
join student on enrollment.sid = student.sid
join course on enrollment.cid = course.cid
order by cname asc ;