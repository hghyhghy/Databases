create  table  product(

    pid int primary key ,
    pname varchar(30)
);

CREATE TABLE Sales (
    sale_id INT,
    pid INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year),
    FOREIGN KEY (pid) REFERENCES product(pid)
);

insert into product(pid, pname) VALUES
                                    (1, 'Laptop'),
(2, 'Smartphone'),
(3, 'Tablet');

insert into sales(sale_id, pid, year, quantity, price) VALUES (101, 1, 2021, 10, 800),
(102, 2, 2021, 15, 500),
(103, 3, 2022, 8, 300),
(104, 1, 2022, 5, 750),
(105, 2, 2023, 20, 450);

select  Sales.sale_id,product.pname,Sales.year,Sales.price
from sales
join product
on Sales.pid=product.pid;

create table  employee(

    eid int primary key ,
    ename varchar(30),
    supervisor int,
    salary int
);

create  table  bonus(

    eid  int primary key ,
    bonus int,
    foreign key (eid) references  employee(eid)

);

insert into  employee(eid, ename, supervisor, salary) VALUES
                                                          (1, 'Alice', NULL, 60000),
(2, 'Bob', 1, 50000),
(3, 'Charlie', 1, 55000),
(4, 'Diana', 2, 45000),
(5, 'Eve', 3, 70000);


insert into bonus(eid, bonus) VALUES
                                  (1, 1500),
(2, 800),
(3, 1200),
(4, 500),
(5, 300);

-- Query to fetch the name and bonus amount of employees with a bonus less than 1000

select  employee.ename,bonus.bonus
from employee
join bonus
on employee.eid=bonus.eid
where bonus > 1000;

create table weather(

    id int primary key ,
    recorddate date,
    temperature int
);

insert into  weather(id, recorddate, temperature) VALUES

                                                      (1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

select  w1.id
from weather w1
join weather w2
on DATEDIFF(w1.recorddate,w2.recorddate)
where  w1.recorddate > w2.recorddate;