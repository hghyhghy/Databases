
create table student(

    sid int primary key ,
    sname varchar(30),
    age int
);

create table courses(

    cid int primary key ,
    cname varchar(30),
    sid int,
    foreign key (sid) references student(sid)
);

insert into student(sid, sname, age) VALUES
                                         (1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 21),
(4, 'Diana', 23),
(5, 'Edward', 22);

insert into courses(cid, cname, sid) VALUES
                                         (101, 'Mathematics', 1),
(102, 'Physics', 2),
(103, 'Chemistry', 3),
(104, 'Biology', 1),
(105, 'History', 4);

Fetch all student names and their enrolled courses.

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

create  table  employee(

    eid int primary key ,
    ename varchar(30),
    did int,
    salary decimal(10,2)
);

insert into employee(eid, ename, did, salary) VALUES
                                                  (1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 55000),
(4, 'David', 103, 80000),
(5, 'Eve', 102, 75000);

create  table  department(

    did int primary key ,
    dname varchar(30)
);

insert into department(did, dname) VALUES
                                       (101, 'HR'),
(102, 'Finance'),
(103, 'IT');

create table  project(

    pid int primary key ,
    pname varchar(30),
    eid int
);

insert into project(pid, pname, eid) VALUES
                                         (201, 'Recruitment', 1),
(202, 'Budget Analysis', 2),
(203, 'App Development', 4),
(204, 'Auditing', 5),
(205, 'Employee Engagement', 1);

# Find the name of employees and their department names using a JOIN.

select  employee.ename,department.dname
from employee
join department
on employee.did=department.did;

# Find the total salary paid by each department.

select  department.dname,sum(employee.salary) as total_salary
from employee
join department
on employee.did=department.did
group by department.dname ;

# List all employees and their projects. If an employee is not assigned a project, display "No Project".

select  employee.ename,coalesce(project.pname,"No project")  as projectname
from employee
left join project
on employee.eid=project.eid;

# Find employees working in the 'Finance' department.

select  employee.ename
from employee
join department
on employee.did=department.did
where  dname='Finance';

# Get the highest-paid employee in each department

select employee.ename,department.dname,max(employee.salary) as maximumsalary
from employee
join department
on employee.did=department.did
group by employee.ename, department.dname;

# Find the projects handled by employees in the 'IT' department.

select  project.pname
from project
join employee
on project.eid=employee.eid
join department
on employee.did=department.did
where  dname = 'IT';

# Display employees not assigned to any department.

select  employee.ename
from employee
left join  department
on employee.did=department.did
where  employee.did is NULL;