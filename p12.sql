# select  substring(workers.fname,1,3) as firstname
# from workers;
#
# select  locate('a',workers.fname) as firstpos
# from workers
# where fname='Amitabh';
#
# select  workers.dname,length(workers.dname ) as totallength
# from workers;
#
#
# select  concat(workers.fname,' ', workers.lname) as completename
# from workers;
#
# select  * from workers
# order by fname asc ;
#
# select  * from workers
# where  fname like  '%a%';
#
# select  * from  workers
# where  salary between 100000 and 500000;
#
# select  * from  workers
# where  joining like  '2021-02%';
#
# select  count(*) as totalemployeecount
# from workers
# where  dname = 'Admin';
#
# select  workers.fname,workers.lname
# from workers
# where  salary >= 50000 and salary <  100000;
#
# # Write an SQL query to fetch the number of workers for each department in descending order.
# # Ans.
#
# select  workers.dname,count(*) as no_of_workers
# from workers
# group by dname
# order by  no_of_workers desc;
#
# #  Write an SQL query to print details of the Workers who are also Managers.
#
# select   w.*
# from workers w
# join title t
# on w.wid = t.ref
# where  t.title = 'Manager';

# Write an SQL query to show records from one table that another table does not have.

# create  table  student(
#
#     sid int primary key ,
#     sname varchar(30)
# );
#
# insert into student(sid, sname) VALUES
#                                     (1, 'Alice'),
# (2, 'Bob'),
# (3, 'Charlie'),
# (4, 'Diana');
#
# create  table  passed (
#
#     sid int primary key
# );
#
# insert into  passed(sid)values
#                             (2), (4);

select  passed.sid,student.sname
from student
left join passed
on student.sid=passed.sid
where  passed.sid is NULL;

select count(*) as total_Student
from student;

# student with id  > 2

select  student.sname,student.sid
from student
where  sid > 2;

# student passed and have first letter D in his name

select  student.sname,student.sid
from student
join passed
on student.sid=passed.sid
where  sname like 'D%';

#  Fetch the Top 2 Students With the Lowest IDs
select student.sname,student.sid
from student
order by  sid asc
limit  2;

select  avg(passed.sid) as avg_id
from passed;

#  Check Which Students Have the Same IDs in Both Tables

select  student.sid,student.sname
from student
inner  join  passed
on student.sid=passed.sid
