use StudentDB
GO

--1
create trigger trig1 on Students
for insert
as
begin
	print '������ ���������'
end
GO

insert into Students values
('����������', '2000-02-03', '������', 2021)
GO

--2
create trigger trig2 on Students
instead of delete
as
begin
	print '������ ������� ������'
end
Go

delete from Students where godpost = 2021
GO

--3
create table �������_�����1
(
	Fio varchar(40) null,
	Data Date null,
	spez varchar(20) null,
	godpost int null,
	������� Datetime not null
)
Go

create trigger trig3 on Students
for delete
as
begin
	insert into �������_�����1
	select FIO,
		Data,
		spez,
		godpost,
		GETDATE() as ������� 
	from deleted
end
Go

delete from Students where godpost = 2021
GO

select * 
from �������_�����1
GO