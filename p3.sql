
create   table salesperson(

    sid int primary key ,
    sname varchar(30),
    city varchar(30)
);

create table   customer(

    cid int primary key,
    cname varchar(30),
    city  varchar(30)
);

insert into  salesperson(sid, sname, city) VALUES
                                               (1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'New York'),
(4, 'Eve', 'Chicago');

insert into  customer(cid, cname, city) VALUES
                                            (1, 'Charlie', 'New York'),
(2, 'Dave', 'Los Angeles'),
(3, 'Mike', 'Chicago'),
(4, 'Sophia', 'Houston');

select  salesperson.sname,customer.cname,customer.city
from salesperson
join  customer
on salesperson.city=customer.city;

create  table   orders(

    oid  int  primary key ,
    cost decimal(10,2),
    cname varchar(50),
    city  varchar(50)
);

insert into  orders(oid, cost, cname, city) VALUES
                                                (1, 1500.00, 'Charlie', 'New York'),
(2, 2500.00, 'Dave', 'Los Angeles'),
(3, 700.00, 'Mike', 'Chicago'),
(4, 1800.00, 'Sophia', 'Houston'),
(5, 300.00, 'Eve', 'Boston');

select  orders.oid,orders.cost,orders.cname,orders.city
from  orders
where  cost between  500 and 2000;
#
create table  salesperson(

    sid int primary key ,
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

    cid int  primary key ,
    cname varchar(30),
    city varchar(30),
    sid int,
    foreign key  (sid) references  salesperson(sid)

);

insert into  customer(cid, cname, city, sid) VALUES
                                                 (1, 'Eve', 'New York', 1),
(2, 'Mike', 'Los Angeles', 2),
(3, 'Sophia', 'Chicago', 3),
(4, 'Charlie', 'Houston', 4);


-- Query to find the salesperson(s) and the customer(s) they represent

select customer.cname,customer.city,salesperson.sname,salesperson.commission
from customer
join salesperson
on customer.sid=salesperson.sid


