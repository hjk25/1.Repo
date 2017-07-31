create database management;
show tables in management;

drop table groups;
drop table users;
drop table rooms;
drop table room_access;

select * from groups;
select * from users;
select * from rooms;
select * from room_access;

#Groups to Users is 1 to Many relationship; 
#Groups to Rooms is Many to Many relationship; 
	#Note: primary keys designate that one unique ID per that table and can't be duplicated, so needed to create room_access table

create table groups
(
group_id int PRIMARY KEY,
groupname varchar(30) NOT NULL
);

create table users
(
user_id int PRIMARY KEY,
username varchar(30) NOT NULL,
group_id int NULL references groups(group_id)
);

create table rooms
(room_id int not NULL,
room varchar(30) NOT NULL
);

create table room_access
(group_id int NOT NULL references groups(group_id), 
room_id int NOT NULL references rooms(room_id),
CONSTRAINT pk_room_access PRIMARY KEY(group_id, room_id)
);

insert into users
(user_id, username, group_id)
VALUES
(1, 'Modesto', 1),
(2, 'Ayine', 1),
(3, 'Christopher', 2),
(4, 'Cheong Woo', 2),
(5, 'Saulat', 3),
(6, 'Heidy', null);

insert into groups
(group_id, groupname)
VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'Admin'),
(4, 'Operations');

insert into rooms
(room_id, room)
VALUES
(1, '101'),
(2, '102'),
(3, 'Aud_A'),
(4, 'Aud_B');

insert into room_access
(group_id, room_id)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

#All groups, and the users in each group.  A group should appear even if there are no users assigned to the group.
select * 
from groups
left join users
on groups.group_id = users.group_id;

#All rooms, and the groups assigned to each room. 
#The rooms should appear even if no groups have been assigned to them.
select r.room, g.groupname
from rooms as r
left join room_access as ra
on r.room_id = ra.room_id
left join groups as g
on ra.group_id = g.group_id
order by r.room, g.groupname;

#A list of users, the groups that they belong to, and the rooms to which they are assigned.
#This should be sorted alphabetically by user, then by group, then by room.
select u.username as Users, 
ifnull(g.groupname, '') as Groups, 
ifnull(r.room, '') as Rooms
from users as u
left join groups as g
on u.group_id = g.group_id
left join room_access as ra
on g.group_id = ra.group_id
left join rooms as r
on ra.room_id = r.room_id
order by u.username, g.groupname, r.room;
