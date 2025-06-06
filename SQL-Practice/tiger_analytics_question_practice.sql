CREATE DATABASE tiger_analytics_DB;
USE tiger_analytics_DB;

create table family 
(
person varchar(5),
type varchar(10),
age int
);

insert into family values 
	('A1','Adult',54),
	('A2','Adult',53),
	('A3','Adult',52),
	('A4','Adult',58),
	('A5','Adult',54),
	('C1','Child',20),
	('C2','Child',19),
	('C3','Child',22),
	('C4','Child',15);
    
select * from family
order by type, age desc;

with cte_adult as 
(select *, row_number() over (order by age desc) as rn from family
where type = 'Adult')
, cte_child as 
(select *, row_number() over (order by age asc) as rn from family
where type = 'Child')
select a.person, c.person, a.age, c.age
from cte_adult a
left join cte_child c on a.rn=c.rn;