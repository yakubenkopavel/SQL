use Kontinent
GO

--1
create proc proc4
as
begin 
	select
		Nazvanie,
		Stolica,
		PL,
		KolNas,
		Kontinent
	from Tabl_Kontinent
end
GO

exec proc4
Go

--2
create proc proc5
	@value int,
	@result int output
as
begin
	set @result = len(cast(@value as varchar(MAX)))
end
GO

declare @value int = 12345
declare @result int
execute proc5 @value, @result output
select @result as [Количество цифр]
GO

--3
create proc proc6
as
begin
	create table TestTable(
		nameCountry varchar(50)
	)
	insert into TestTable
	select Nazvanie
	from Tabl_Kontinent
	where left(Nazvanie, 1) = 'Я'

	select nameCountry
	from TestTable
end
GO

exec proc6
GO