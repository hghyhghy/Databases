
create  table  comapany(

    cid int primary key ,
    cname varchar(30)
);

insert into  comapany(cid, cname) VALUES
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
    pcom int,
    foreign key  (pcom) references  comapany(cid)
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

select  comapany.cname,avg(product.price) as avgprice
from product
join comapany
on product.pcom=comapany.cid
group by comapany.cname ;

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

create  table  product(

    pid int primary key ,
    pname varchar(30),
    price decimal(10,2),
    pcom int,
    foreign key  (pcom) references  company(cid)
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

select  company.cname,avg(product.price) as avgprice
from  product
join company
on product.pcom = company.cid
where  price >= 350
group by company.cname ;

create  table company(

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

create table product(

    pid int primary key ,
    pname varchar(30),
    price decimal(10,2),
    pcom int,
    foreign key (pcom) references company(cid)
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

select  company.cname,product.pname,max(product.price) as maximum
from product
join company
on product.pcom = company.cid
group by company.cname, product.pname ;