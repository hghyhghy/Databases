
create  table   salesperson(

    sid int  primary key ,
    sname varchar(30),
    city varchar(30),
    commission decimal(10,2)
);

insert into salesperson(sid, sname, city, commission) VALUES
                                                          (1, 'Alice', 'New York', 0.15),
(2, 'Bob', 'Los Angeles', 0.12),
(3, 'Charlie', 'Chicago', 0.10),
(4, 'Dave', 'Houston', 0.08);

create  table  customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    sid int,
    foreign key (sid) references salesperson(sid)
);

insert into  customer(cid, cname, city, sid) VALUES
                                                 (1, 'Eve', 'New York', 1),
(2, 'Mike', 'Los Angeles', 2),
(3, 'Sophia', 'Chicago', 3),
(4, 'Charlie', 'Houston', 4);


select  customer.cname,customer.city,salesperson.sname,salesperson.commission
from customer
join salesperson
on customer.sid=salesperson.sid
where commission > 0.12;

create table salesperson(

    sid  int primary key ,
    sname varchar(30),
    city varchar(30),
    commission decimal(10,2)
);

insert into salesperson(sid, sname, city, commission) VALUES
                                                          (1, 'Alice', 'New York', 0.15),
(2, 'Bob', 'Los Angeles', 0.12),
(3, 'Charlie', 'Chicago', 0.10),
(4, 'Dave', 'Houston', 0.08);

create table customer(

    cid int primary key ,
    cname varchar(30),
    city varchar(30),
    sid int,
    foreign key (sid) references salesperson(sid)
);

insert into customer(cid, cname, city, sid) VALUES
                                                (1, 'Eve', 'New York', 1),
(2, 'Mike', 'Los Angeles', 2),
(3, 'Sophia', 'Chicago', 3),
(4, 'Charlie', 'Kolkata', 4);


select  customer.cname,customer.city,salesperson.sname,salesperson.commission
from customer
join salesperson
on customer.sid=salesperson.sid
where commission >0.12 and customer.city <> salesperson.city;


create  table  customer(

    cid int primary key ,
    cname varchar(30),
    grade int
);

create  table salesman(

    sid int primary key ,
    sname varchar(30),
    commission int
);

create table  orders(

    oid int primary key,
    odate date,
    cid int,
    sid int,
    amount int,
    foreign key (cid) references customer(cid),
    foreign key (sid) references salesman(sid)

);

insert into customer(cid, cname, grade) VALUES
                                            (1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3);

insert into salesman(sid, sname, commission) VALUES
(1, 'John', 10.50),
(2, 'Sarah', 15.00),
(3, 'Michael', 12.75);

insert into orders(oid, odate, cid, sid, amount) VALUES
(101, '2024-11-20', 1, 1, 5000.00),
(102, '2024-11-21', 2, 2, 3000.00),
(103, '2024-11-22', 3, 3, 1500.00);

select orders.oid,orders.odate,orders.amount,customer.cname,customer.grade,salesman.sname,salesman.commission
from orders
join customer on
orders.cid=customer.cid
join salesman
on orders.sid=salesman.sid;