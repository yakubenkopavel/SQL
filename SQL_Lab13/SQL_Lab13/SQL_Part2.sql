use Kontinent
GO

create function fun1
(
	@A1 as float,
	@B1 as float
)
returns table
as
return (
	select Nazvanie,
		Stolica,
		PL,
		KolNas,
		Kontinent
	from Tabl_Kontinent
	where PL between @A1 and @B1
)
GO

select * 
from dbo.fun1(100, 1000)
GO

create function fun2
(
	@������ as varchar(50)
)
returns varchar(50)
as
begin
	declare @S as varchar(50)

	select
	@S = Stolica
	from Tabl_Kontinent
	where Nazvanie = @������
	return @S
end
GO

select dbo.fun2('�������')
GO

create function fun3
(
	@��������� as int,
	@������� as float
)
returns float
as
begin
	declare @P as float
	set @P = round(cast(@��������� as float)/@�������, 2)
	return @P
end
GO

select Nazvanie,
	Stolica,
	PL,
	KolNas,
	Kontinent,
	dbo.fun3(KolNas, PL) as ���������
from Tabl_Kontinent
GO

IF OBJECT_ID('dbo.fun3') IS NOT NULL
  DROP FUNCTION dbo.fun3
GO