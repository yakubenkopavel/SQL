create proc proc1
as
begin
	select
	@@SERVERNAME as Сервер, @@VERSION as ВерсияСУБД,
	DB_NAME() as БазаДанных, User as ПользовательБД,
	System_User as СистемныйПользователь
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
	@Буква as char(1),
	@Количество as int output
as
begin
	select 
		@Количество = count(*)
	from
		Tabl_Kontinent
	where
		CHARINDEX(@Буква, Nazvanie) > 0
end
GO


declare @K as int
declare @Б as char(1)
set @Б = 'у'
execute proc2 @Б, @K output
select
	@K as [Количество стран]
GO

create proc proc3
	@Конт as varchar(50) = 'Европа'
as
begin
	select top 3
		Nazvanie,
		Stolica,
		PL,
		KolNas,
		Kontinent
	from Tabl_Kontinent
	where Kontinent = @Конт
	order by PL
end
GO

execute proc3 default
GO

drop proc proc3