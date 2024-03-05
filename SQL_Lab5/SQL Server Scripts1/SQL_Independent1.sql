use groupBD
Go

--УСР1_1
--1
select coalesce(predmet, 'Итого'), coalesce(ush, 'Итого'), max(ball) as maxBall
from School
group by rollup(predmet, ush)

--2
select predmet, ush, min(ball) as minBall
from School
group by cube(predmet, ush)
Go

--3
select predmet, ush, avg(ball) as averageBall
from School
group by grouping sets(predmet, ush)
Go

--4
select 
	coalesce(predmet, 'Итого'), 
	coalesce(ush, 'Итого'), 
	count(fio) as kol
from School
group by rollup(predmet, ush)
Go

--5
select case GROUPING_ID(predmet, ush)
			when 1 then 'Итог по предметам'
			when 2 then 'Итог по школам'
			when 3 then 'Итого'
			else ''
			end as Итого
			,coalesce(predmet, '') as predmet
			,isnull(ush, '') as ush
			, sum(ball) as sumBall
from School
group by cube(predmet, ush);
Go

--6
select case GROUPING_ID(predmet, ush)
			when 1 then 'Итог по предметам'
			when 2 then 'Итог по школам'
			when 3 then 'Итого'
			else ''
			end as Итого
			,coalesce(predmet, '') as predmet
			,isnull(ush, '') as ush
			, max(ball) as maxBall
from School
group by cube(predmet, ush);
Go