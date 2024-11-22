show  tables ;
create table product(

    pid int primary key ,
    pname varchar(30)
);

insert into product(pid, pname) values

                                        (101, 'Laptop'),
    (102, 'Smartphone'),
    (103, 'Tablet'),
    (104, 'Monitor');

create table sales(

    sid int primary key ,
    pid int,
    sdate date,
    quantity int,
    foreign key (pid) references product(pid)
);

insert into sales(sid, pid, sdate, quantity) values
                                                     (1, 101, '2024-11-01', 2),
    (2, 102, '2024-11-05', 1),
    (3, 103, '2024-11-10', 4),
    (4, NULL, '2024-11-15', 3);

select product.pid,product.pname,sales.sid
from  sales
right join  product on  sales.pid=product.pid;
