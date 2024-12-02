create  table  product(

    pid int primary key ,
    low_fat enum('y','n'),
    recyclable enum('y','n')
);

insert into product(pid,low_fat,recyclable) values

(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'N'),
(4, 'Y', 'Y');

select  product.pid
# from product
# where  low_fat='y' and recyclable='y';

create  table  customer(

    cid int primary key ,
    name varchar(30),
    referee_id int
);

insert into customer(cid, name, referee_id) VALUES
                                                (1, 'Alice', NULL),
(2, 'Bob', NULL),
(3, 'Charlie', 2),
(4, 'Diana', 1),
(5, 'Eve', 2),
(6, 'Frank', NULL);

select  customer.name
from  customer
where  referee_id != 2 or referee_id is NULL;

create  table  world(

    name varchar(100) primary key ,
    continent varchar(30),
    area int,
    population int,
    gdp bigint
);

insert into world(name, continent, area, population, gdp) VALUES
                                                              ('China', 'Asia', 9600000, 1400000000, 14140163500000),
('India', 'Asia', 3287000, 1360000000, 2875142000000),
('United States', 'North America', 9834000, 329500000, 21433226000000),
('Australia', 'Oceania', 7692000, 25687000, 1392687000000),
('Canada', 'North America', 9985000, 38000000, 1736426600000),
('Brazil', 'South America', 8516000, 212600000, 2140738000000),
('Malta', 'Europe', 316, 500000, 14379000000);


select  world.name,world.population,world.area
from  world
where  area >=3000000 and population >=25000000;


create table  employee(

    id int primary key ,
    name varchar(30)
);

create table employee_unique (

    id int ,
    unique_id int ,
    primary key (id,unique_id)

);

insert into employee( id, name) VALUES
                                    (1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana');

insert into employee_unique(id, unique_id) VALUES
                                               (1, 101),
(2, 102),
(4, 104);

select  employee.id,employee.name,employee_unique.unique_id
from employee
left join employee_unique
on employee.id=employee_unique.id;

select  employee_unique.unique_id,employee.name
from employee
left join employee_unique
on employee.id=employee_unique.id;

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

-- Insert data into Visits table
INSERT INTO Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

-- Create the Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);

-- Insert data into Transactions table
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

select Visits.customer_id,count(Visits.visit_id) as totalcount
from Visits
left join Transactions
on Visits.visit_id=Transactions.visit_id
where  transaction_id is NULL
group by Visits.customer_id ;