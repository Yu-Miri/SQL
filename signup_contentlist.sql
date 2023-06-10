create table User_info(
	user_id varchar(20) not null primary key,
    user_name varchar(20) not null,
	user_pwd varchar(20) not null,
    user_nick varchar(20) not null unique,
    user_email varchar(20) not null
    );
    
drop table User_info;
drop table content;

create table content(
	content_id int not null auto_increment primary key,
    user_id varchar(20) not null,
    user_nick varchar(20) not null,
    content_title varchar(20) not null,
    content_string varchar(50) not null,
    
    constraint content_FK foreign key (user_nick) references User_info(user_nick)
    );
    
/* 사용할 데이터베이스*/
use test;

/* 게시판 조회 */
select *
from User_info;

select *
from content;

insert into content(content_id, user_id, user_nick, content_title, content_string)
value(null,'dbalfl4145','유밀밀','미리의 하루','오늘은 Flask를 복습해보자!');