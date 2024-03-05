use groupBD
Go

--1
select 'Количество' as [Количество учеников по предметам]
		, Математика
		, Физика
		, Химия
from
	(
		select predmet, fio
		from School
	)
	as source_table
Pivot
	(
		count(fio)
		for predmet in (Математика, Физика, Химия)
	)as pivot_table
Go

--2
select ush
		, Математика
		, Физика
		, Химия
from
	(
		select ush, predmet, fio
		from School
	)
	as source_table
Pivot
	(
		count(fio)
		for predmet in (Математика, Физика, Химия)
	)as pivot_table
Go

--3
select fio, [предмет или школа]
from School
unpivot
(
	[предмет или школа] for Значение in (ush, predmet)
)unpvt
Go


--7.3
use groupBD
select fio, [2011], [2012], [2013], [2014], [2015]
from test_table_pivot
pivot
(
	sum(summa) for god in ([2011], [2012], [2013], [2014], [2015])
)as test_pivot