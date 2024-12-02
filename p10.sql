# create  table  department(
#
#     did int primary key ,
#     dname varchar(30),
#     allotment int
# );
#
# insert into department(did, dname, allotment) VALUES
#                                                   (57, 'IT', 65000),
# (63, 'Finance', 15000),
# (47, 'HR', 240000),
# (27, 'RD', 55000),
# (89, 'QC', 75000);
#
# create table  employee(
#
#     eid int primary key ,
#     efname varchar(30),
#     elname varchar(30),
#     edid int,
#     foreign key (edid) references  department(did)
# );
#
# insert into employee(eid, efname, elname, edid) VALUES
#                                                     (127323, 'Michale', 'Robbin', 57),
# (526689, 'Carlos', 'Snares', 63),
# (843795, 'Enric', 'Dosio', 57),
# (328717, 'Jhon', 'Snares', 63),
# (444527, 'Joseph', 'Dosni', 47),
# (659831, 'Zanifer', 'Emily', 47),
# (847674, 'Kuleswar', 'Sitaraman', 57),
# (748681, 'Henrey', 'Gabriel', 47),
# (555935, 'Alex', 'Manuel', 57),
# (539569, 'George', 'Mardy', 27),
# (733843, 'Mario', 'Saule', 63),
# (631548, 'Alan', 'Snappy', 27),
# (839139, 'Maria', 'Foster', 57);

# select employee.eid,employee.efname,employee.elname,department.did,department.dname
# from employee
# join department
# on employee.edid=department.did;
#
# select  department.dname
# from     employee
# join department
# on employee.edid = department.did
# group by dname
# having count(eid) > 2

select  employee.eid,department.did,employee.efname,employee.elname,department.dname
from employee
left join department
on employee.edid = department.did;