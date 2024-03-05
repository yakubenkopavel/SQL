use University
Go

--1
select ST.Fio_stud,
	K.NKaf as Kafedra,
	S.NaprSpez as Special
from Spezialn S
	inner join Kafedra K on K.ShifrKaf = S.Shifr_Spez
	inner join Student ST on S.NSpez = ST.Nom_SpeZ_St
Go

--2
select S.FIO,
	R.FIO,
	R.TabNom
from Sotrudnik S
	inner join Sotrudnik R on S.tabNom_ruk = R.TabNom
Go

--3
select S.Fio_stud,
	count(O.ReGNom)
from Student S 
	inner join Ozenka O on S.Reg_Nom = O.ReGNom
group by S.Fio_stud
having COUNT(O.ReGNom) >= 2
GO

--4
select S.FIO,
	S.Zarplata
from Ingener I 
	inner join Sotrudnik S on I.TabNom_IN = S.TabNom
where S.Zarplata < 2000
GO


--5
select S.Fio_stud
from Student S 
	inner join Ozenka O on S.Reg_Nom = O.ReGNom
where O.Auditoria = 'т506'
Go

--6
select S.Fio_stud,
	count(O.ReGNom) as Количество,
	avg(O.Ozenka_a) as [Средний балл]
from Student S 
	inner join Ozenka O on S.Reg_Nom = O.ReGNom
group by S.Fio_stud
having avg(O.Ozenka_a) >= 4
Go

--7
select S.FIO,
	S.Zarplata,
	P.Stepen
from ZavKaf Z
	inner join Sotrudnik S on Z.TabNom_K = S.TabNom
	inner join Prepodavatel P on Z.TabNom_K = P.TabNom_Pr
Go

--8
select S.FIO
from Prepodavatel P
	inner join Sotrudnik S on P.TabNom_Pr = S.TabNom
where P.Zvanie = 'профессор'
GO

--9
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
where O.Odata > '2022-06-07' and O.Odata < '2022-06-15'
order by O.Odata
Go

--10
select S.FIO,
	count(O.Ozenka_a) as [Количество экзаменов]
from Prepodavatel P
	inner join Ozenka O on P.TabNom_Pr = O.tab_Nom
	inner join Sotrudnik S on S.TabNom = P.TabNom_Pr
group by S.FIO
having count(O.Ozenka_a) >= 3
Go

--11
select S.Fio_stud,
	O.Odata
from Student S 
	left outer join Ozenka O on S.Reg_Nom = O.ReGNom
where O.ReGNom is null
Go
