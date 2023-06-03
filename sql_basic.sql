/* 사용할 데이터베이스*/
use test;

/* player 테이블의 모든 column을 조회 */
select *
from player;

/* 테이블 생성 */
create table alpaco_student(
/* column 명, type, null 여부 */
id int not null,
name varchar(10) not null,
email varchar(30) not null,
phone_number varchar(20) not null,
alpaco_office_id varchar(20) not null,
/* 제약조건 설정 */
constraint alpaco_student_PK primary key (id),
constraint alpaco_student_FK foreign key (alpaco_office_id) references alpaco(alpaco_office_id)
);


create table brand(
brand_id int not null,
name varchar(10) not null,
constraint brand_PK primary key(brand_id)
);

create table movie(
id int not null,
m_name varchar(20) not null,
brand_id int not null,
seat int not null,
constraint movie_PK primary key(id),
constraint movie_FK foreign key(brand_id) references brand(brand_id)
);

select *
from player;

/* disable safe mode, 수정을 못 하게 하는 설정을 False로 변경 */
set SQL_SAFE_UPDATES = 0;

update player
/* set : column의 데이터를 변경 */
set position = 'FW'
/* where : 조건에 맞는 데이터 변경 */
where player_id = 2000002;

/* concat(column,'string') */
select player_name, concat(height,'cm'), concat(weight,'kg'), height-weight as 키몸무게
from player
where height >= 170;

select *
from (select *
	from player
	where height > 170
	/* -- and position in ('DF', 'MF');*/
	/* 컬럼에 속해있으면 조회 */
	and player_name like '김%') a
    /* %는 모든 글자 수, _는 지정 글자 개수 */
where a.height > 190 ;
/* 조회한 테이블 이름을 a로 지정*/

select *
from (select *
		from player
		where height > 170
        and player_name like '김_') a, (select *
										from player
                                        where height > 170
                                        and player_name like '박%') b
where position in (select position
					from player
                    where height > 170
                    and player_name like 'DF');

select *
from player;

delete
from player
where player_id like '2000001';

commit;

delete
from player
where player_id like '2000003';

select *
from player;

rollback;

delete
from player
where player_id like '2000003';

savepoint A;

delete
from player
where player_id like '2000004';

savepoint B;

select *
from player;

rollback to A;

SET AUTOCOMMIT = 0; /* 자동 저장을 해지한다 */

select *
from player;

select *
from player
where not height between 170 and 190;

select player_name, weight, case
							when weight >= 80
								then 'HIGH'
							when weight >= 70
								then 'MID'
							when weight >= 60
								then 'SMALL'
							else 'WARNING'
                            end as 체지방
from player;


select team_id, count(*) /*는 선수 모든 정보*/
from player
group by team_id;

select position, AVG(height)
from player
group by position;

select team_id, count(*)
from player
group by team_id
having count(*) > 10;

select team_id, min(weight)
from player
where weight >= 72 /* 먼저 필터링하고 그룹핑 */ 
group by team_id
having min(weight) >= 75; /* 그룹핑 후에 필터링, 집계함수에 대한 조건절 */

select player_name, weight, height
from player
order by weight DESC, height DESC; /* Default = ASC, DESC = 내림차순 ASC = 오름차순, 이중 정렬이 가능 */

select player_name, height
from player
order by height DESC
limit 2;

select position, AVG(height)
from player
where height >= 170
group by position
order by avg(height) desc
limit 1;