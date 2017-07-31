create database videos;
drop table videos.Videos;
create table videos.Videos(
ID varchar(30) PRIMARY KEY, 
title varchar(90), 
length INTEGER, 
URL varchar(90)
);

#what's the difference between Text and varchar vs INTEGER and varchar? 
#I saw examples of people using TEXT and varchar in reading material and samples
#what do you do when the primary key is NOT an integer? MYSQL throws an error since YT video IDs are not numbers only.
show tables in videos;
insert into videos.Videos
(ID, title, length, URL)
VALUES
('O5k7TfjE37w', 'Game of Thrones Season 7 Episode 1 Breakdown', 368, 'https://www.youtube.com/watch?v=O5k7TfjE37w'),
('Qf5wp60d99M', 'Game of Thrones Season 7 Episode 2 Breakdown', 391, 'https://www.youtube.com/watch?v=Qf5wp60d99M'),
('Pf7rTnsYWjI', 'Game of Thrones Season 7 Episode 3 Preview', 300, 'https://www.youtube.com/watch?v=Pf7rTnsYWjI');

select * from videos;
create table videos.Reviewers(
ID varchar(30),
name varchar(30), 
review varchar(30), 
rating varchar(30)
);

insert into videos.Reviewers
(ID, name, rating, review)
VALUES
('O5k7TfjE37w', 'George', 'Must see', 5),
('O5k7TfjE37w', 'Heather', 'Letdown', 1),
('Qf5wp60d99M', 'Grace', 'Edge of my seat', 5),
('Qf5wp60d99M', 'Ben', 'Unexciting', 5),
('Pf7rTnsYWjI', 'Rob', 'Badass', 5);

select * from Reviewers;

select v.id, v.title, v.length, v.URL, r.name, r.rating, r.review
from videos as v
JOIN reviewers as r
ON v.ID = r.ID;


