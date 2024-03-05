create proc proc1
as
begin
	select
	@@SERVERNAME as ������, @@VERSION as ����������,
	DB_NAME() as ����������, User as ��������������,
	System_User as ���������������������
end
Go

exec proc1
GO

use Kontinent
GO

select top (1000) [Nazvanie],
	[Stolica],
	[PL],
	[KolNas],
	[Kontinent]
from [Kontinent].[dbo].[Tabl_Kontinent]
Go

create proc proc2
	@����� as char(1),
	@���������� as int output
as
begin
	select 
		@���������� = count(*)
	from
		Tabl_Kontinent
	where
		CHARINDEX(@�����, Nazvanie) > 0
end
GO


declare @K as int
declare @� as char(1)
set @� = '�'
execute proc2 @�, @K output
select
	@K as [���������� �����]
GO

create proc proc3
	@���� as varchar(50) = '������'
as
begin
	select top 3
		Nazvanie,
		Stolica,
		PL,
		KolNas,
		Kontinent
	from Tabl_Kontinent
	where Kontinent = @����
	order by PL
end
GO

execute proc3 default
GO

drop proc proc3