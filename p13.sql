
create table student(

    sid int primary key ,
    sname varchar(30)

);

insert into student(sid, sname) VALUES
                                    (1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

create table  courses(

    cid int primary key ,
    cname varchar(30)
);

insert into courses(cid, cname) VALUES
                                    (101, 'Mathematics'),
(102, 'Science'),
(103, 'History'),
(104, 'Art');

create table enrollment(

    eid int primary key ,
    sid int,
    cid int,
    foreign key (sid) references student(sid),
    foreign key (cid) references courses(cid)
);

insert into enrollment(eid, sid, cid) VALUES
                                          (1, 1, 101),
(2, 1, 102),
(3, 2, 103),
(4, 3, 104),
(5, 4, 101);

select student.sname,courses.cname
from enrollment
join student on enrollment.sid=student.sid
join courses on enrollment.cid=courses.cid;

# Fetch all students and their courses, even if they are not enrolled in any.

select  student.sname,courses.cname
from enrollment
join student
on enrollment.sid=student.sid
join courses
on enrollment.cid=courses.cid;

# Fetch all courses and the students enrolled in them, even if no student is enrolled in a course.

select student.sname,courses.cname
from enrollment
join student
on enrollment.sid=student.sid
join courses
on enrollment.cid=courses.cid;

select student.sname,courses.cname
from student
cross join courses;

# Count the number of students enrolled in each course.

select courses.cname,count(courses.cid) as totalcount
from courses
left join enrollment
on  courses.cid=enrollment.cid
group by courses.cname;

# Find the course with the highest number of enrollments.

select  courses.cname,count(enrollment.sid) as totalcount
from courses
left join enrollment
on courses.cid=enrollment.cid
group by courses.cname
order by totalcount desc
limit 1;
#
# . CONCAT()
# Combine the first name of the student and the course name they are enrolled in.

select  concat(student.sname,'enrolled in',courses.cname) as full_list
from student
join enrollment
on student.sid = enrollment.sid
join courses
on enrollment.cid = courses.cid;

# Display the course names in uppercase.

select upper(courses.cname) as upper_name
from courses;

# Find the length of each student’s name.

select student.sname,length(student.sname) as name_length
from student;

# Get the current date alongside each enrollment date.

select  enrollment.eid,enrollment.cid,current_date() as total_dite
from enrollment;

select student.sid,student.sname
from student
left join enrollment
on student.sid=enrollment.sid
where  enrollment.sid is null;
#
# Question: Write an SQL query to display the student_name and the total number of courses they are enrolled in. If a student is not enrolled in any course, show 0.

select  student.sname,count(enrollment.cid) as enrolled_student
from student
left join enrollment
on student.sid = enrollment.sid
group by student.sname,student.sid;

# 2. Find the Names of Students Enrolled in More Than One Course
# Question: Write an SQL query to find the student_name of students who are enrolled in more than one course.

select  student.sname
from student
left join enrollment
on student.sid=enrollment.sid
group by sname,student.sid
having  count(cid) > 1;

# Question: Write an SQL query to display the course_name and the number of students enrolled in each course. Include courses with zero enrollments.

select   courses.cname,count(enrollment.sid) as enrolled_student
from courses
left join enrollment
on courses.cid=enrollment.cid
group by courses.cname ,courses.cid
