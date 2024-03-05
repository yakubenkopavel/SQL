use Kontinent
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent,
	round(cast(KolNas as float) * 100 / 
	(
	select sum(KolNas)
	from Tabl_Kontinent
	), 3) as �������
from Tabl_Kontinent
order by ������� desc
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas > (select avg(KolNas) from Tabl_Kontinent)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from 
(
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '������'
) A
where KolNas > 50000000
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent,
	round(cast(KolNas as float) * 100 / 
	(
	select sum(KolNas)
	from Tabl_Kontinent as B
	where A.Kontinent = B.Kontinent
	), 3) as �������
from Tabl_Kontinent A
order by ������� desc
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent as A
where KolNas > 
(
select avg(KolNas)
from Tabl_Kontinent as B
where A.Kontinent = B.Kontinent
)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent in 
(
select Kontinent
from Tabl_Kontinent
group by Kontinent
having avg(KolNas) > 
	(
	select avg(KolNas)
	from Tabl_Kontinent
	)
)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '����'
	and KolNas > all
		(
		select KolNas
		from Tabl_Kontinent
		where Kontinent = '������'
		)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '������'
	and KolNas > any
		(
		select KolNas
		from Tabl_Kontinent
		where Kontinent = '����� �������'
		)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '������' and
	exists 
		(
		select *
		from Tabl_Kontinent
		where Kontinent = '������' and
			KolNas > 100000000
		)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = 
	(
	select 
	Kontinent
	from Tabl_Kontinent
	where Nazvanie = '������'
	)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas !> 
	(
	select KolNas
	from Tabl_Kontinent
	where Nazvanie = '������'
	)
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas = 
	(
	select max(minP)
	from 
		(
		select min(KolNas) as minP
		from Tabl_Kontinent
		group by Kontinent
		) A
	)
Go