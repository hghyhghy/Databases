create table  customer(

    cid int primary key ,
    cname varchar(30),
    country varchar(30)
);

insert into  customer(cid, cname, country) VALUES

                                               (1, 'Alice', 'USA'),
(2, 'Bob', 'Canada'),
(3, 'Charlie', 'UK'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

create  table orders(

    oid int primary key ,
    cid int,
    amount decimal(10,2),
    odate date
);

insert into  orders(oid, cid, amount, odate) VALUES

                                                 (101, 1, 250.00, '2023-01-15'),
(102, 2, 150.00, '2023-02-10'),
(103, 1, 300.00, '2023-03-05'),
(104, 4, 400.00, '2023-03-15'),
(105, 3, 200.00, '2023-04-01');


select  customer.cid,customer.cname,orders.oid,orders.amount
from customer
join orders
on customer.cid=orders.cid;

select  customer.cid,customer.cname,orders.oid,orders.amount
from customer
join orders
on  customer.cid=orders.cid
order by  amount desc ;

select customer.cid,customer.cname,orders.oid,orders.amount
from customer
join orders
on customer.cid=orders.cid
where  odate > '2023-03-01';

select  customer.cid,customer.cname,orders.oid,orders.amount
from customer
join orders
on customer.cid=orders.cid
where oid is null;

select  customer.cid,customer.cname,count(orders.oid) as ocount
from customer
left join orders
on customer.cid=orders.cid
group by customer.cid, customer.cname ;

select  orders.oid,orders.amount,orders.odate,customer.cname,customer.country
from  orders
right join customer
on orders.cid=customer.cid;

select customer.country, sum(orders.amount) as total
from customer
join orders
on customer.cid=orders.cid
group by customer.country ;

select  customer.cid,customer.cname,max(orders.odate) as recent
from customer
left join orders
on customer.cid=orders.cid
group by customer.cid, customer.cname ;

select  orders.oid,orders.amount,customer.cname
from orders
join customer
on orders.cid=customer.cid
where  amount > 200;

select  orders.oid,orders.amount,customer.cname
from orders
join customer
on orders.cid=customer.cid
where cname like  'A%';

select  customer.cid,customer.cname,orders.oid,orders.amount
from  customer
join orders
on customer.cid=orders.cid
where amount = (select max(amount) from orders);