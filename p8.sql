create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(30),
    commission int
);

insert into  salesman(sid, sname, city, commission) VALUES
                                                        (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

create  table  customer (

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int,
    foreign key (sid) references  salesman(sid)

);

insert into customer(cid, cname, city, grade, sid) VALUES
                                                       (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

select  salesman.sid,salesman.sname,customer.cid,customer.cname,customer.city,salesman.city,customer.grade,salesman.commission
from  salesman
join customer
on salesman.city != customer.city
where  grade is not null;

