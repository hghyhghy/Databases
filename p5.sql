create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30)
);

create  table salesman(

    sid int  primary key ,
    sname varchar(30),

    city varchar(30),
    commission int
);

insert into  customer(cid, cname, city) VALUES
                                            (1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago');

insert into  salesman(sid, sname, city, commission) VALUES
                                                        (1, 'John', 'San Francisco', 13.00),
(2, 'Sarah', 'Chicago', 14.00),
(3, 'Michael', 'New York', 10.50);

select  customer.cname,customer.city,salesman.sname,salesman.city,salesman.commission
from  customer
join salesman
on customer.cid=salesman.sid
where customer.city != salesman.city
and commission > 12;

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    grade int
);

create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    commission int
);

create  table  orders(

    oid int primary key ,

    odate date,
    amount int,
    cid int,
    sid int,

    foreign key (cid) references  customer(cid),
    foreign key (sid) references  salesman(sid)
);

insert into  customer(cid, cname, grade) VALUES
                                             (1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3);

insert into  salesman(sid, sname, commission) VALUES
                                                  (1, 'John', 10.50),
(2, 'Sarah', 12.00),
(3, 'Michael', 8.75);

insert into  orders(oid, odate, amount, cid, sid) VALUES
                                                      (101, '2024-11-20', 5000.00, 1, 1),
(102, '2024-11-21', 3000.00, 2, 2),
(103, '2024-11-22', 1500.00, 3, 3);

select  orders.odate,orders.oid,orders.amount,customer.cname,customer.grade,salesman.sname,salesman.commission
from orders
join customer
on orders.cid=customer.cid
join salesman
on orders.sid=salesman.sid;

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int
);

create  table  salesman(

    sid int primary key ,
    sname varchar(30),
    city varchar(100)
);


insert into  customer(cid, cname, city, grade, sid) VALUES
                                                        (1, 'Alice', 'New York', 1, 1),
(2, 'Bob', 'Los Angeles', 2, 2),
(3, 'Charlie', 'Chicago', 3, 3),
(4, 'Diana', 'Seattle', 4, NULL);

insert into salesman(sid, sname, city) VALUES
                                           (1, 'John', 'San Francisco'),
(2, 'Sarah', 'Houston'),
(3, 'Michael', 'Boston');

select  customer.cname,customer.city,customer.grade,salesman.sname,salesman.city
from customer
left join salesman
on customer.sid=salesman.sid
group by cid

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    grade int,
    sid int
);

create  table  salesman (

    sid int primary key ,
    sname varchar(30),
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

insert into salesman(sid, sname, city, commission) VALUES
                                                       (5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

select  customer.cname,customer.city,customer.grade,salesman.sname,salesman.city
from customer
join salesman
on customer.sid=salesman.sid
where  grade < 300
order by  cid asc ;