use Kontinent
GO

--1
create function fun4
(
	@maxArea as int
)
returns @table table
(
	nameCountry varchar(255)
)
as
begin
	insert into @table
	select Nazvanie
	from Tabl_Kontinent
	where PL < @maxArea

	return
end
GO

select *
from dbo.fun4(400000)
GO

--2
create function fun5()
returns @table table
(
	nameCountry varchar(255),
	pl int
)
as
begin
	insert into @table
	select Nazvanie, PL
	from Tabl_Kontinent

	return
end
GO

select *
from dbo.fun5()
GO

drop function dbo.fun4
drop function dbo.fun5

