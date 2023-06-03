/* 사용할 데이터베이스*/
use test;

/* player 테이블의 모든 column을 조회 */
select *
from player;

/* join */
select p.player_name, t.team_name
from player p, team t
where p.team_id = t.team_id;

select *
from stadium;

/* 3중 join */
select *
from player p, team t, stadium s
where t.stadium_id = s.stadium_id
and p.team_id = t.team_id;

/* inner join */
select *
from player p inner join team t
on p.team_id = t.team_id;

