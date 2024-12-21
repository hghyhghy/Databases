
create table  customers(

    cid int primary key ,
    cname varchar(30),
    country varchar(30)
);

create  table  orders(

    oid int primary key ,
    cid int,
    pid int,
    odate date,
    quantity int,
    foreign key (cid) references  customers(cid)
);

create  table  products(

    pid int primary key ,
    pname varchar(30),
    price decimal(10,2)
);

insert into  customers(cid, cname, country) VALUES
                                                (1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'UK'),
(3, 'Samuel Green', 'Canada');

insert into  orders(oid, cid, pid, odate, quantity) VALUES
                                                        (1001, 1, 101, '2023-12-01', 2),
(1002, 2, 102, '2023-12-02', 1),
(1003, 1, 103, '2023-12-03', 1),
(1004, 3, 101, '2023-12-04', 3);

insert into products(pid, pname, price) VALUES
                                            (101, 'Laptop', 1000.00),
(102, 'Smartphone', 500.00),
(103, 'Tablet', 300.00);

select  orders.oid,customers.cid,customers.cname,products.price,orders.quantity
from  orders
join customers
on orders.cid = customers.cid
join products
on orders.pid=products.pid;

select  orders.oid,orders.cid,customers.cname,(orders.quantity*products.price) as totalamount
from orders
join customers
on orders.cid = customers.cid
join products
on orders.pid=products.pid;

# Left Join: Retrieve all customers and their orders, even if no orders are placed.

select  customers.cname,orders.oid,orders.odate
from customers
left join orders
on customers.cid = orders.cid;

# Right Join: Retrieve all products and their order details, even if no orders exist for a product.

select  orders.pid,orders.oid,orders.quantity
from  products
right join orders
on products.pid= orders.pid;

# Find the total revenue generated for each product

select products.pname,sum(orders.quantity*products.price) as totalprice
from  products
join orders
on products.pid=orders.pid
group by pname;

# Find customers who have never placed an order

select  customers.cname
from customers
left join  orders
on customers.cid = orders.cid
where  oid is NULL;

# . Find the most expensive order placed by each customer


select  customers.cname,max(orders.quantity*products.price ) as maxval
from customers
join orders
on customers.cid = orders.cid
join products
on orders.pid=products.pid
group by customers.cname ;

# Find products that have never been ordered


select  customers.cname,count(orders.oid) as totalcount
from customers
left join orders
on customers.cid = orders.cid
group by customers.cname ;

# 5. Count the number of orders placed by each customer

select  customers.cname,count(orders.oid) as totalcount
from customers
left join orders
on customers.cid =  orders.cid
group by customers.cname ;

# 6. Find the average order value for each customer

select   customers.cname, avg(orders.quantity*products.price) as avgprice
from customers
inner  join orders
on customers.cid = orders.cid
inner join products
on orders.pid=products.pid
group by customers.cname ;

# List all orders placed in a specific date range

select  orders.oid,customers.cname,products.pname,orders.odate
from orders
inner join customers
on orders.cid = customers.cid
inner  join  products
on orders.pid=products.pid
where  odate between  '2023-12-01' AND '2023-12-03';

# 8. Find customers who have ordered multiple products in a single order

select  orders.oid,customers.cname,count(distinct  orders.pid) as pcount
from orders
inner  join customers
on orders.cid = customers.cid
group by orders.oid, customers.cname
having  pcount > 1;

# 10. Find the product with the highest total sales

select  products.pname , sum(orders.quantity*products.price) as total
from  products
join orders
on products.pid = orders.pid
group by products.pname
order by  total desc
limit 1;