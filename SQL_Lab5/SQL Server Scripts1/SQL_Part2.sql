use groupBD
Go

--1
select '����������' as [���������� �������� �� ���������]
		, ����������
		, ������
		, �����
from
	(
		select predmet, fio
		from School
	)
	as source_table
Pivot
	(
		count(fio)
		for predmet in (����������, ������, �����)
	)as pivot_table
Go

--2
select ush
		, ����������
		, ������
		, �����
from
	(
		select ush, predmet, fio
		from School
	)
	as source_table
Pivot
	(
		count(fio)
		for predmet in (����������, ������, �����)
	)as pivot_table
Go

--3
select fio, [������� ��� �����]
from School
unpivot
(
	[������� ��� �����] for �������� in (ush, predmet)
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