use groupBD

use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush;
Go

use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush with rollup;
Go

use groupBD
select predmet, ush, count(fio) as kol
from School
group by predmet, ush with cube;
Go

use groupBD
select predmet, ush, count(fio) as kol
from School
group by grouping sets(predmet, ush);
Go

use groupBD
select 
		coalesce(predmet, '�����') as predmet, 
		coalesce(ush,'�����') as ush, 
		count(fio) as kol
from School
group by rollup(predmet, ush);
Go

use groupBD
select 
		coalesce(predmet, '�����') as predmet, 
		coalesce(ush,'�����') as ush, 
		count(fio) as kol
from School
group by cube(predmet, ush);
Go

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