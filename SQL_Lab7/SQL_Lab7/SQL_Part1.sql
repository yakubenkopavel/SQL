use University
Go

--1
select F.Nfak as Fakultet
	, K.Nkaf as Kafedra 
from Fakultet F, Kafedra K
where F.ABfak = K.AbFaK_Kaf
order by Fakultet, Kafedra
Go

--2
select F.Nfak as Fakultet
	, K.Nkaf as Kafedra
from Fakultet F inner join Kafedra K 
	on F.ABfak = K.AbFaK_Kaf
order by Fakultet, Kafedra
Go

--3
select F.Nfak as Fakultet
	, K.Nkaf as Kafedra
from Fakultet F left outer join Kafedra K 
	on F.ABfak = K.AbFaK_Kaf
order by Fakultet, Kafedra
Go

--4
select S.Fio_stud,
	P.NaprSpez,
	K.NKaf as Kafedra
from Student S
	inner join Spezialn P on S.Nom_SpeZ_St = P.NSpez
	inner join Kafedra K on P.Shifr_Spez = K.ShifrKaf
Go

--5
select S.FIO,
	S.Dolgn,
	S.Zarplata,
	P.FIO as Руководитель
from Sotrudnik S
	inner join Sotrudnik P on S.TabNom = P.tabNom_ruk
Go

--6
select S.Fio_stud
from Student S
	inner join Ozenka O on S.Reg_Nom = O.ReGNom
group by S.Fio_stud
Go

--7
select S.Fio_stud,
		count(O.Ozenka_a) as [Количество экзаменов],
		avg(O.Ozenka_a) as [Средний балл]
from Student S inner join Ozenka O on S.Reg_Nom = O.ReGNom
group by S.Fio_stud
GO

--8
select S.FIO,
	S.Zarplata,
	Z.St_K
from Sotrudnik S inner join ZavKaf Z on S.TabNom = Z.TabNom_K
GO

--9
select S.FIO,
	P.Stepen
from Sotrudnik S inner join Prepodavatel P on S.TabNom = P.TabNom_Pr
where P.Stepen in ('к.ф.-м.н', 'д.ф.-м.н')
Go

--10
select distinct PR.Predmet as Дисциплина,
	S.FIO,
	S.Dolgn,
	P.Stepen,
	O.Odata,
	O.Auditoria
from Ozenka O
	inner join Predmet PR on O.Kod = PR.kod_pred
	inner join Sotrudnik S on O.tab_Nom = S.TabNom
	inner join Prepodavatel P on O.tab_Nom = P.TabNom_Pr 
order by O.Odata
Go

--11
select S.FIO,
	COUNT(O.Odata) as [количество экзаменов]
from Ozenka O
	inner join Sotrudnik S on O.tab_Nom = S.TabNom
group by S.FIO
Go

--12
select S.Fio_stud
from Student S 
	left outer join Ozenka O on S.Reg_Nom = O.ReGNom
where O.ReGNom is null
Go