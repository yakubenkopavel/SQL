use groupBD
Go

--4
select 'Средний балл' as [Средний балл по школам]
		, Гимназия
		, Лицей
from
	(
		select ush, ball
		from School
	)
	as source_table
Pivot
	(
		avg(ball)
		for ush in (Гимназия, Лицей)
	)as pivot_table
Go

--5
select predmet
		, Гимназия
		, Лицей
from
	(
		select predmet, ush, ball
		from School
	)
	as source_table
Pivot
	(
		avg(ball)
		for ush in (Гимназия, Лицей)
	)as pivot_table
Go

--6
select predmet, [фамилия или школа]
from School
unpivot
(
	[фамилия или школа] for Значение in (fio, ush)
)unpvt