create table Users
(
	id int not null auto_increment,
    userName varchar(30) not null,
    password varchar(30) not null,
    
    primary key(id)
);