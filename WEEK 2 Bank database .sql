create database insurance;
use insurance;

create table person(
driver_id varchar(20),
name varchar(20),
address varchar(20),
primary key(driver_id));

create table car(
reg_num varchar(20),
model varchar(20),
year int,
primary key(reg_num));

create table accident(
report_num int,
accident_Date date,
location varchar(20),
primary key(report_num));

create table owns(
driver_id varchar(20),
reg_num varchar(20),
primary key(driver_id, reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));

create table participated(
driver_id varchar(20),
reg_num varchar(20),
report_num int,
damage_amount int,
primary key(Driver_id, reg_num, report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));

insert into person values('A01', 'Richard', 'Srinivas nagar');
insert into person values('A02', 'Pradeep', 'Rajaji nagar');
insert into person values('A03', 'Smith', 'Ashok nagar');
insert into person values('A04', 'Venu', 'NR colony');
insert into person values('A05', 'John', 'Hanumanth nagar');

insert into car values('KA052250', 'Indica', '1990');
insert into car values('KA031181', 'Lancer', '1957');
insert into car values('KA095477', 'Toyota', '1998');
insert into car values('KA053408', 'Honda', '2008');
insert into car values('KA041702', 'Audi', '2005');

insert into owns values('A01', 'KA052250');
insert into owns values('A02', 'KA031181');
insert into owns values('A03', 'KA095477');
insert into owns values('A04', 'KA053408');
insert into owns values('A05', 'KA041702');

insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','South End Circle');
insert into accident values(13,'2003-01-21','Bull Temple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2004-03-05','Kanakapura Road');

insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA031181',12,50000);
insert into participated values('A03','KA095477',13,25000);
insert into participated values('A04','KA053408',14,3000);
insert into participated values('A05','KA041702',15,5000);

select * from participated;
select * from accident;
select * from owns;
select * from car;
select * from person;

select * from car order by car.year ASC;
select * from participated order by damage_amount DESC;
select avg(damage_amount) from participated;
select name from person, participated where person.driver_id = participated.driver_id and participated.damage_amount>(select avg(damage_amount) from participated where damage_amount is not NULL);
select max(damage_amount) from participated;

SELECT COUNT(DISTINCT o.driver_id) AS total_owners_in_2008
FROM accident a
JOIN participated p ON a.report_num = p.report_num
JOIN owns o ON p.reg_num = o.reg_num
WHERE YEAR(a.accident_Date) = 2008;

SELECT COUNT(DISTINCT p.report_num) AS lancer_accident_count
FROM car c
JOIN participated p ON c.reg_num = p.reg_num
WHERE c.model = 'Lancer';

select count(distinct name) from person, accident;