use groupBD
Go

--4
select '������� ����' as [������� ���� �� ������]
		, ��������
		, �����
from
	(
		select ush, ball
		from School
	)
	as source_table
Pivot
	(
		avg(ball)
		for ush in (��������, �����)
	)as pivot_table
Go

--5
select predmet
		, ��������
		, �����
from
	(
		select predmet, ush, ball
		from School
	)
	as source_table
Pivot
	(
		avg(ball)
		for ush in (��������, �����)
	)as pivot_table
Go

--6
select predmet, [������� ��� �����]
from School
unpivot
(
	[������� ��� �����] for �������� in (fio, ush)
)unpvt