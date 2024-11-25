create  table  customer(

    cid int primary key ,
    cname varchar(30),
    country varchar(30)
);

create table orders(

    oid int primary key ,
    cid int,
    amount decimal(10,2),
    odate date

);

insert into customer(cid, cname, country) VALUES
                                              (1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'Canada'),
(3, 'Alice Brown', 'UK'),
(4, 'David White', 'USA');

insert into  orders (oid, cid, amount, odate) VALUES
                                                  (101, 1, 250.75, '2024-01-15'),
(102, 2, 150.00, '2024-01-17'),
(103, 3, 300.00, '2024-01-20'),
(104, 1, 450.50, '2024-01-25');


select orders.oid,orders.amount,customer.cname,customer.country
from orders
inner  join customer
on orders.cid=customer.cid;


select  customer.cname,customer.country,orders.oid,orders.amount
from customer
left join orders on customer.cid=orders.cid;

select  orders.oid,orders.amount,customer.cname,customer.country
from orders
right join customer
on orders.cid=customer.cid;

select  customer.cname, count(orders.oid) as ocount
from customer
left join orders
on customer.cid=orders.cid
group by customer.cname ;

select  customer.cname,orders.amount
from customer
join orders
on customer.cid=orders.cid
where  amount > 200;

select  customer.cname,max(orders.amount) as oamount
from customer
left join orders
on customer.cid=orders.cid
group by customer.cname ;

select  customer.cname,customer.country,orders.amount
from customer
left join orders
on customer.cid =  orders.cid
order by  country asc  , amount desc ;