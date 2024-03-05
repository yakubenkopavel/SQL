use StudentDB
Go

--1
select FIO,
	len(FIO) as ƒлина
from Students
order by len(FIO) asc
Go

--2
select 
	trim(FIO) as FIO,
	Data,
	spez,
	godpost
from Students
GO

--3
select 
	FIO,
	CHARINDEX('ов', FIO) as ѕозици€_о
from Students
Go

--4
select
	FIO,
	RIGHT(spez, 2) As endSpez
from Students
GO

--5
select SUBSTRING(FIO,1,CHARINDEX(' ', FIO)) + 
	SUBSTRING(FIO, CHARINDEX(' ',FIO)+1, 1) + '.'+
	SUBSTRING(FIO, CHARINDEX(' ', FIO, CHARINDEX(' ', FIO)+1),2) + '.'
from Students
Go

--6
select distinct spez,
	REVERSE(spez) as sepzReverse
from Students
GO

--7
print replicate('якубенко ', 20)
Go

--8
print round(power(sin(pi()/2),2) - cos(3*pi()/2),2)
GO

--9
select datediff(day, GETDATE(), '2023-12-31') as days
Go

--10
select datediff(month, '2003-07-15', GETDATE()) as time
Go

--11
select distinct spez,
	IIF(len(spez)  < 7,'короткий','длинный')
from Students