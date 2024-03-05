use StudentDB
GO

--1
create trigger trig1 on Students
for insert
as
begin
	print 'Запись добавлена'
end
GO

insert into Students values
('Степаненко', '2000-02-03', 'Физика', 2021)
GO

--2
create trigger trig2 on Students
instead of delete
as
begin
	print 'Нельзя удалить данные'
end
Go

delete from Students where godpost = 2021
GO

--3
create table Студент_Архив1
(
	Fio varchar(40) null,
	Data Date null,
	spez varchar(20) null,
	godpost int null,
	удалено Datetime not null
)
Go

create trigger trig3 on Students
for delete
as
begin
	insert into Студент_Архив1
	select FIO,
		Data,
		spez,
		godpost,
		GETDATE() as Удалено 
	from deleted
end
Go

delete from Students where godpost = 2021
GO

select * 
from Студент_Архив1
GO