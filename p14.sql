# Question: Write an SQL query to display the student_name of students who are not enrolled in any course.

select  student.sname
from student
left join enrollment
on student.sid = enrollment.sid
where  enrollment.sid is NULL;
#
# 5. Find the Most Popular Course
# Question: Write an SQL query to find the course_name with the maximum number of enrollments.

select  courses.cname,count(enrollment.cid) as total_enrollment
from courses
left join enrollment
on courses.cid=enrollment.cid
group by courses.cname ,courses.cid
order by  total_enrollment desc
limit  1;

# Question: Write an SQL query to find the course_name with the minimum number of enrollments. Include courses with zero enrollments.

select  courses.cname,count(enrollment.cid) as total_enrollment
from courses
join enrollment
on courses.cid=enrollment.cid
group by courses.cname ,courses.cid
order by total_enrollment asc
limit 1;

# Question: Write an SQL query to calculate the total number of students and the total number of courses.

select
    (select  count(*) from  student) as total_student,
    (select  count(*) from courses) as total_courses;

# Question: Write an SQL query to display each student_name along with the first course they enrolled in.

select  student.sname,courses.cname,min(enrollment.eid) as minimum
from student
join enrollment
on student.sid = enrollment.sid
join courses
on  enrollment.cid = courses.cid
group by student.sname, courses.cname ,student.sid;

# Question: Write an SQL query to display student_name, course_name, and the total number of times each student has enrolled in the same course.

select  student.sname,courses.cname,count(enrollment.eid) as tota
from student
join enrollment
on student.sid = enrollment.sid
join courses
on enrollment.cid = courses.cid
group by student.sname, courses.cname ,student.sid,courses.cid;


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    fee INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert into Students
INSERT INTO Students (student_id, student_name, age) VALUES
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21),
(4, 'Diana', 23),
(5, 'Edward', 22);

-- Insert into Courses
INSERT INTO Courses (course_id, course_name, fee) VALUES
(101, 'Mathematics', 500),
(102, 'Physics', 600),
(103, 'Computer Science', 700),
(104, 'Biology', 550);

-- Insert into Enrollments
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 101, '2023-01-10'),
(2, 2, 102, '2023-01-12'),
(3, 3, 103, '2023-01-15'),
(4, 1, 102, '2023-01-20'),
(5, 4, 104, '2023-01-25'),
(6, 2, 103, '2023-01-30');

select  Students.student_name,Courses.course_name,Enrollments.enrollment_date
from Enrollments
join Students
on Enrollments.student_id = Students.student_id
join courses
on Enrollments.course_id=Courses.course_id;

# Left Join: Fetch All Students and Their Enrollments

select  students.student_name,courses.course_name,Enrollments.enrollment_date
from students
left join Enrollments
on students.student_id = Enrollments.student_id
left join courses
on Enrollments.course_id = courses.course_id;

#  This fetches all courses, including those not taken by any students.

select students.student_name,courses.course_name,enrollments.enrollment_date
from courses
right join enrollments
on courses.course_id = enrollments.course_id
right join students
on enrollments.student_id = students.student_id;

#  Find Students Enrolled in Multiple Courses

select  students.student_name,count(enrollments.course_id) as total_count
from enrollments
join students
on enrollments.student_id = students.student_id
group by students.student_name
having count(course_id) > 1;

# Fetch Courses with No Students Enrolled

select  courses.course_name
from courses
left join enrollments
on courses.course_id = enrollments.course_id
where  enrollments.course_id is null;

# Fetch Students with No Enrollments

select  students.student_name
from   students
left join enrollments
on students.student_id = enrollments.student_id
where  enrollments.student_id is NULL;

#  Find Total Fee Paid by Each Student

select  students.student_name,sum(courses.fee) as fees
from enrollments
join students
on enrollments.student_id = students.student_id
join courses
on enrollments.course_id = courses.course_id
group by students.student_name ;