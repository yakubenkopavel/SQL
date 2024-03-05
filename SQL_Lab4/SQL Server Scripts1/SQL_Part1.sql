use StudentDB
Go

select * from Students
Go

Select FIO, Data
from Students
Go

select 'Студент ' + FIO + ', специализация: ' + spez as Информация
from Students;
GO

select FIO, [через год] = godpost + 1
from Students;
Go

select distinct spez from students;
Go

select *from Students order by godpost;
Go

select * from students
order by spez desc, FIO asc;
Go

select top 2 *
from Students
order by FIO asc;
Go

select top 30 percent *
from Students
order by godpost;
Go

select top 4 with ties *
from Students
order by godpost;
GO

select * 
from students
order by FIO offset 2 rows;
GO

select * 
from students
order by FIO 
	offset 2 rows
	fetch next 8 rows only;
GO

