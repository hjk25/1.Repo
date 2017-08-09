drop table company;
create table company
(
user_id int PRIMARY KEY,
username varchar(30) NOT NULL,
title varchar(30) NOT NULL,
supervisor_id varchar(30) NULL
);

insert into company
(user_id, username, title, supervisor_id)
VALUES 
(1, 'Mike', 'CEO', null),
(2, 'Sally', 'Assistant', 1),
(3, 'Bob', 'Research VP', 1),
(4, 'Joan', 'Data VP', 1),
(5, 'Molly', 'Senior Analyst', 3),
(6, 'Frodo', 'Analyst', 3),
(7, 'Caleb', 'Visualization Expert', 4),
(8, 'Keith', 'Developer', 4),
(9, 'Dara', 'Senior Developer', 4);

select * from company;

select 
Supervisors.username AS 'Supervisor Name',
Employees.username AS 'Employee Name'
from company as Supervisors
join company as Employees
on Employees.supervisor_id = Supervisors.user_id
ORDER by Supervisors.username;

