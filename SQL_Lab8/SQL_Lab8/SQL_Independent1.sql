use Kontinent
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where PL < 500
union select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where PL > 5000000
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where PL > 1000000
except select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas < 100000000
Go

select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where PL < 500
intersect select
	Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent
from Tabl_Kontinent
where KolNas < 100000