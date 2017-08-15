#1 - 
DROP TABLE IF EXISTS BuildingEnergy;
create database BuildingEnergy;
show tables in BuildingEnergy;

#drop table EnergyTypes;

#2
create table EnergyCategories
(
category_id int PRIMARY KEY,
category varchar(30) NOT NULL
);

insert into EnergyCategories
(category_id, category)
VALUES
(1, 'fossil'),
(2, 'renewable');

create table EnergyTypes
(
type_id int PRIMARY KEY,
typename varchar(30) NOT NULL,
category_id int NULL references EnergyCategories(category_id)
);

insert into EnergyTypes
(type_id, typename, category_id)
VALUES
(1, 'electricity', 1),
(2, 'gas', 1),
(3, 'steam', 1),
(4, 'fuel oil', 1),
(5, 'solar', 2),
(6, 'wind', 2);

select * from EnergyCategories;
select * from EnergyTypes;

#3
select c.category, t.typename
from EnergyTypes as t
left join EnergyCategories as c
on t.category_id = c.category_id
order by c.category;

#4
create table Buildings
(
building_id int PRIMARY KEY,
building varchar(30) NOT NULL
);

insert into Buildings
(building_id, building)
VALUES
(1, 'Empire State Building'),
(2, 'Chrysler Building'),
(3, 'Manhattan Community College');

create table Available
(building_id INT NOT NULL references Buildings(building_id),
type_id INT NOT NULL references EnergyTypes(type_id),
CONSTRAINT pk_Available PRIMARY KEY(building_id, type_id)
);

insert into Available
(building_id, type_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(3, 3),
(3, 5);

select * from Buildings;
select * from available;

#5
select b.building, t.typename
from Buildings as b
left join Available as a
on b.building_id = a.building_id
left join EnergyTypes as t
on a.type_id = t.type_id
order by b.building;

#6
insert into Buildings
(building_id, building)
VALUES
(4, 'Bronx Lion House'),
(5, 'Brooklyn Childrens Museum');

insert into EnergyTypes
(type_id, typename, category_id)
VALUES
(7, 'geothermal', 2);

insert into Available
(building_id, type_id)
VALUES
(4, 7),
(5, 1),
(5, 7);

#7
select b.building, t.typename, c.category
from Buildings as b
left join Available as a
on b.building_id = a.building_id
left join EnergyTypes as t
on a.type_id = t.type_id
left join EnergyCategories as c
on t.category_id = c.category_id 
where c.category = 'renewable'
order by b.building;

#8
select t.typename, count(a.type_id)
from Available as a
left join EnergyTypes as t
on a.type_id = t.type_id
group by t.typename
order by count(a.type_id) DESC;

#9a from #4
create table Available
(building_id INT NOT NULL references Buildings(building_id),
type_id INT NOT NULL references EnergyTypes(type_id),
CONSTRAINT pk_Available PRIMARY KEY(building_id, type_id)
);

#9b in picture
