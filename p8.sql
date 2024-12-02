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


create  table  company(

    cid int primary key ,
    cname varchar(30)
);

insert into  company(cid, cname) VALUES
                                         (11, 'Samsung'),
    (12, 'iBall'),
    (13, 'Epsion'),
    (14, 'Zebronics'),
    (15, 'Asus'),
    (16, 'Frontech');

create  table  product(

    pid int primary key ,
    pname varchar(30),
    price decimal(10,2),
    pcom int
);

insert into  product(pid, pname, price, pcom) VALUES
                                                      (101, 'Mother Board', 3200.00, 15),
    (102, 'Key Board', 450.00, 16),
    (103, 'ZIP drive', 250.00, 14),
    (104, 'Speaker', 550.00, 16),
    (105, 'Monitor', 5000.00, 11),
    (106, 'DVD drive', 900.00, 12),
    (107, 'CD drive', 800.00, 12),
    (108, 'Printer', 2600.00, 13),
    (109, 'Refill cartridge', 350.00, 13),
    (110, 'Mouse', 250.00, 12);

select  product.pid, product.pname,product.price,company.cname
from  product
join company
on product.pcom=company.cid


create  table   company(

    cid int primary key ,
    cname varchar(30)
);

insert into  company(cid, cname) VALUES
                                     (11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

create  table   product(

    pid int primary key ,
    pname varchar(30),
    price  decimal(10,2),
    pcom int,
    foreign key (pcom) references  company(cid)
);

insert into  product(pid, pname, price, pcom) VALUES
                                                  (101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16);

select  product.pid,product.pname,company.cname,company.cid,product.price
from product
join company
on product.pcom=company.cid