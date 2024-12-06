
# create table student(
#
#     sid int primary key ,
#     sname varchar(30),
#     age int
# );

# create table courses(
#
#     cid int primary key ,
#     cname varchar(30),
#     sid int,
#     foreign key (sid) references student(sid)
# );
#
# insert into student(sid, sname, age) VALUES
#                                          (1, 'Alice', 20),
# (2, 'Bob', 22),
# (3, 'Charlie', 21),
# (4, 'Diana', 23),
# (5, 'Edward', 22);
#
# insert into courses(cid, cname, sid) VALUES
#                                          (101, 'Mathematics', 1),
# (102, 'Physics', 2),
# (103, 'Chemistry', 3),
# (104, 'Biology', 1),
# (105, 'History', 4);

# Fetch all student names and their enrolled courses.

select  student.sname,courses.cname
from student
left join  courses
on student.sid = courses.sid;

# Find students who are not enrolled in any course.

select  student.sname
from student
left join courses
on student.sid=courses.sid
where  cid is null;

#  Fetch course names along with the names of the students enrolled in them.

select  student.sname,courses.cname
from courses
join student
on courses.sid=student.sid;

# Find the total number of students enrolled in each course.

select student.sname,count(student.sid) as total_count
from courses
left join student
on courses.sid=student.sid
group by student.sname ;

# Find the length of student names.

select  student.sname,length(student.sname) as name_length
from student;

#  Convert all course names to uppercase.

select  courses.cname,upper(courses.cname) as upper_case
from courses;