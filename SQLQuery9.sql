create database Cinema
use Cinema
create table Genres(
Id int primary key identity,
Name nvarchar(20) not null
)
create table Films(
Id int primary key identity,
Name nvarchar(50) not null,
TicketId int foreign key references Tickets(Id)
)
create table Genre_Film(
Id int primary key identity,
GenreId int foreign key references Genres(Id),
FilmId int foreign key references Films(Id)
)
create table Seans(
Id int primary key identity,
ReleaseDate datetime not null
)
create table Film_Seans(
Id int primary key identity,
FilmId int foreign key references Films(Id),
SeansId int foreign key references Seans(Id)
)
create table Hals(
Id int primary key identity,
Name nvarchar not null,
[Row] int not null,
Place int not null
)
create table Actors(
Id int primary key identity,
Fullname nvarchar(50) not null
)
create table Actor_Film(
Id int primary key identity,
ActorId int foreign key references Actors(Id),
FilmId int foreign key references Films(Id)
)
create table Tickets(
Id int primary key identity,
TicketNumber int not null,
Price int not null,
SeansId int foreign key references Seans(Id),
CustomerId int foreign key references Customers(Id),
HalId int foreign key references Hals(Id)
)
create table Customers(
Id int primary key identity,
Fullname nvarchar(50) not null,
Age tinyint not null
)

create view vw_SelectAllTickets
as
select t.TicketNumber,t.Price, s.ReleaseDate, c.Fullname, h.Name,h.Place,h.Row from Tickets as t
join Seans as s
on t.SeansId = s.Id
join Customers as c
on t.CustomerId = c.Id
join Hals as h
on t.HalId = h.Id

select*from vw_SelectAllTickets
