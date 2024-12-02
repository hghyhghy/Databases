create table product(

    pid int primary key ,
    pname varchar(30),
    price decimal(10,2)
);

create table sales(

    sid int primary key ,
    pid int,
    quantity int,
    sale date,
    foreign key (pid) references product(pid)
);

create table customer(

    cid int primary key ,
    cname varchar(30),
    pid int,
    foreign key (pid) references product(pid)
);


insert into product(pid, pname, price) VALUES
                                           (1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00);

insert into sales(sid, pid, quantity, sale) VALUES
                                                (1, 1, 2, '2023-01-15'),
(2, 2, 5, '2023-02-20'),
(3, 3, 3, '2023-03-05');

insert into  customer(cid, cname, pid) VALUES
                                           (1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3);


-- 1. Find the first and last sale dates

select  min(sales.sale) as smin, max(sales.sale) as smax
from sales;

select max(product.price) as pmax, min(product.price) as pmin , avg(product.price) as aprice
from product;

-- 3. Calculate the total revenue generated from all sales

select sum(product.price*sales.quantity) as revenue
from product
join sales on product.pid = sales.pid;

select  count(customer.cid) as totalcount
from customer;

-- 5. Find the product with the highest quantity sold
select  product.pname, max(sales.quantity) as  total
from product
join sales on product.pid = sales.pid
group by product.pname
order by  total desc
limit 1;

-- 6. Calculate the average quantity of products sold per sale

select  avg(sales.quantity) as avgquantity
from sales;

select  product.pname,sum(sales.quantity) as total
from product
join sales
on product.pid=sales.pid
group by product.pname ;

select  customer.cname,length(customer.cname) as clength
from customer;

select product.pname,ucase(product.pname) as pupper
from product;

select  product.pname,product.price,round(product.price) as rprice
from product;