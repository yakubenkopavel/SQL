use Kontinent
Go

 --1
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent,
	round(cast(PL as float) * 100 / 
		(
		select sum(PL)
		from Tabl_Kontinent
		), 3
	) as �������
from Tabl_Kontinent
Go

--2
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where PL > 
	(
	select avg(PL)
	from Tabl_Kontinent
	)
Go

--3
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
	)A
where KolNas < 5000000
Go

--4
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent,
	round(cast(Pl as float) * 100 / 
		(
		select sum(PL)
		from Tabl_Kontinent as B
		where A.Kontinent = B.Kontinent
		), 3
	) as �������
from Tabl_Kontinent as A
Go

--5
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent as A
where PL > 
	(
	select avg(PL)
	from Tabl_Kontinent as B
	where A.Kontinent = B.Kontinent
	)
Go

--6
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
	where PL > 
		(
		select avg(PL)
		from Tabl_Kontinent
		)
	)
Go

--7
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '����� �������' and
	KolNas > all
	(
	select KolNas
	from Tabl_Kontinent
	where Kontinent = '������'
	)
Go

--8
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '������' and
	KolNas > any
	(
	select KolNas
	from Tabl_Kontinent
	where Kontinent = '����� �������'
	)
Go

--9
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = '������' and
	exists (
		select *
		from Tabl_Kontinent
		where Kontinent = '������' and
			PL > 2000000
	) 
Go

--19
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where Kontinent = 
	(
	select Kontinent
	from Tabl_Kontinent
	where Nazvanie = '�����'
	)
Go

--11
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
	where Nazvanie = '�����'
	)
Go

--12
select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas = 
	(
	select max(KolNas)
	from 
		(
		select KolNas
		from Tabl_Kontinent as A
		where PL = 
			(
			select min(PL)
			from Tabl_Kontinent as B
			where A.Kontinent = B.Kontinent
			)
		) tableA
	)
Go