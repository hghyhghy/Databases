create  table customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int ,
    sid int
);

create  table  orders(

    oid int primary key ,
    amount int ,
    odate date,
    cid int,
    sid int
);

insert into customer(cid, cname, city, grade, sid) VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006);

insert into orders(oid, amount, odate, cid, sid) VALUES
                                                     (70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

select  customer.cname,customer.city,orders.odate,orders.oid,orders.amount
from customer
left join orders
on customer.cid=orders.cid
order by  odate asc ;

create  table  customer(

    cid int primary key,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int
);

create  table  orders(

    oid int primary key ,
    amount int,
    odate date,
    cid int,
    sid int
);

create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(30),
    commission decimal(5,2)
);


insert into  customer(cid, cname, city, grade, sid) VALUES
                                                        (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


insert into orders(oid, amount, odate, cid, sid) VALUES
                                                     (70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

insert into salesman(sid, sname, city, commission) VALUES
                                                       (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13);

select customer.cname,salesman.sname,customer.city,salesman.city,orders.odate,orders.amount,orders.oid,salesman.commission
from customer
left join  orders
on customer.cid=orders.cid
left join  salesman
on customer.sid=salesman.sid
order by odate asc ,orders.cid asc


create table customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int
);

create table salesman(

    sid int primary key ,
    name varchar(30),
    city varchar(30),
    commission int
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

insert into salesman(sid, name, city, commission) VALUES

                                                      (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

select  customer.sid,salesman.name,customer.city,salesman.commission,customer.cname
from salesman
left join customer
on salesman.sid=customer.sid
order by name asc


create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(30),
    commission int
);

insert into salesman(sid, sname, city, commission) VALUES
                                                       (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

create table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int
);

insert into customer(cid, cname, city, grade, sid) VALUES
                                                       (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006);

select  salesman.sname,customer.cname,salesman.sid,customer.cid,salesman.commission,customer.grade,customer.grade
from salesman
cross join customer

create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(30),
    commission int
);

insert into salesman(sid, sname, city, commission) VALUES
                                                       (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int

);

insert into customer(CID, CNAME, CITY, GRADE, SID) VALUES
                                                       (3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

select  salesman.sid,salesman.sname,salesman.city,customer.cid,customer.cname,customer.city
from salesman
join
customer on salesman.city=customer.city;



create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(30),
    commission int
);

insert into salesman(sid, sname, city, commission) VALUES
                                                       (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int,
    foreign key (sid) references salesman(sid)
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

select  salesman.sid,salesman.sname,customer.cid,customer.cname,customer.grade,salesman.commission,customer.city,salesman.city
from salesman
join customer
on salesman.city=customer.city
where  grade is not  null;