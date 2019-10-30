drop table Board;
create table Board (
	id int not null auto_increment,
	user varchar(8) not null,
	title varchar(8) not null,
	date varchar(10),
	content varchar(500) not null,
	primary key (id)
) charset=utf8;

select * from Board;