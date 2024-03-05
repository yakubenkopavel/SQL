use StudentDB
Go

--1
select FIO, spez, DATA
from students;
GO

--2
select FIO + ' поступил в ' + cast(godpost as varchar(4)) as 'ќ поступление'
from Students;
GO

--3
select FIO, [через 5 лет поступлени€] = godpost + 5
from students;
Go

--4
select distinct godpost
from students;
Go

--5
select FIO, DATA
from students
order by DATA desc;
GO

--6
select *
from students
order by spez desc, godpost desc, FIO asc;
GO

--7
select Top 1 *
from students
order by FIO desc;
GO

--8
select top 1 *
from students
order by godpost asc;
Go

--9
select top 10 percent *
from students
order by FIO asc;
Go

--10
select top 5 with ties  *
from students
order by godpost asc;
Go

--11
select *
from students
order by DATA asc 
	offset 4 rows;
GO

--12
select *
from Students
order by FIO asc
	offset 6 rows
	fetch next 1 rows only;
GO

--13
select *
from Students
order by FIO asc
	offset 4 rows
	fetch next 5 rows only;
GO
