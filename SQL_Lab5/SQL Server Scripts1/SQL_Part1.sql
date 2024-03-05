use groupBD
Go

--���1_1
--1.1
use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush;
Go

--1.2
use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush with rollup;
Go

--2.1
use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush with cube;
Go

--2.2
use groupBD
select predmet, ush, count(fio) as kol
from School
group by grouping sets(predmet, ush);
Go

--3
use groupBD
select 
		coalesce(predmet, '�����') as predmet, 
		coalesce(ush,'�����') as ush, 
		count(fio) as kol
from School
group by rollup(predmet, ush);
Go

--4
use groupBD
select 
		coalesce(predmet, '�����') as predmet, 
		coalesce(ush,'�����') as ush, 
		count(fio) as kol
from School
group by cube(predmet, ush);
Go

--5
select IIF(grouping (predmet)=1, '�����', predmet) as predmet
		,IIF(grouping(ush)=1, '�����', ush) as ush
		,count(fio) as kol

--6
select case GROUPING_ID(predmet, ush)
			when 1 then '���� �� ���������'
			when 3 then '�����'
			else ''
			end as �����
			,isnull(predmet, '') as predmet
			,isnull(ush, '') as ush
			, count(fio) as kol
from School
group by rollup(predmet, ush);