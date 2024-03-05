use Booking
GO

--16 ��������� �������
--16.1 ������� ���������� � email ��������������� �� com
select S.PASSENGER_NAME,
	S.PASSENGER_LASTNAME,
	R.PASSENGER_EMAIL
from Reservation R
	join Passengers S on R.PASSENGER_EMAIL = S.EMAIL
where RIGHT(PASSENGER_EMAIL, 3) = 'com'
GO

--16.2 ������� ��� � ������� ��� ���� ������
select CONCAT(PASSENGER_NAME, ' ', PASSENGER_LASTNAME) as FI
from Passengers
Go

--16.3 ����� ����� �������� �� ��������
select SUBSTRING(AIRLINE, 0, len(AIRLINE)-8) as airline,
	MODEL as modelOfAircruft
from Aircraft
GO

--16.4 ������� ������� ������� @
select PASSENGER_EMAIL,
	CHARINDEX('@', PASSENGER_EMAIL)
from Reservation
GO

--17 �������� �������
--17.1 �������� ����� � ���������
select TICKETS_PRICES + FLOOR(RAND()*100)
from Reservation
Go

--17.2 �������� ��������� � �������� ��������
select FLOOR(LOG(TICKETS_PRICES)) as Price
from Reservation
GO

--17.3 �������� ���� ��������� 
select SIGN(TICKETS_PRICES) as SignOfPrice,
	TICKETS_PRICES
from Reservation
GO

--17.4 �������� ������ ���������
select CEILING(SQRT(TICKETS_PRICES))
from Reservation
GO

--18 ������������� �� ����� ��
--18.1 �������� ���������� �� ���������� ������ < 500
create view pr1
as
select *
from Reservation
where TICKETS_PRICES < 500
GO

select*
from pr1
GO

--18.2 �������� ���, ������� � ��������� ������ ����������
create view pr2
(
	���,
	�������,
	���������_������
)
as
select P.PASSENGER_NAME,
	P.PASSENGER_LASTNAME,
	R.TICKETS_PRICES
from Passengers P
	join Reservation R on P.EMAIL = R.PASSENGER_EMAIL
GO

select ���,
	�������
from pr2
GO
--18.3 �������� ���� ������� � ���������� ����������, ������� ������ ������ �� ������ ����
create view pr3
(
	Price,
	countPassengers
)
as
select TICKETS_PRICES,
	count(PASSENGER_EMAIL)
from Reservation
group by TICKETS_PRICES
GO

select *
from pr3
GO
--18.4 �������� �������� ��������� � ��������� ������ ���������
create view pr4
(
	��������,
	��������������
)
as
select AIRLINE,
	MODEL
from Aircraft
where IS_EMPTY = 'true'
GO

select*
from pr4
GO
--18.5 �������� email ���������, ����� ����������� � ���� �����������
create view pr5
as
select R.PASSENGER_EMAIL,
	F.DEPARTURE_AIRPORT,
	F.DEPARTURE_DATE
from Reservation R
join Flights F on R.FLIGHTS_NUMBER = F.FLIGHTS_NUMBER
Go

select *
from pr5
GO

--19.1 ��������� ����������
--�������� ���, �������, ��������, ���� �����������, ��������� ������
declare @table1 table
(
	��� varchar(50),
	������� varchar(50),
	�������� varchar(50),
	���� date,
	��������� int
)

insert into @table1
select P.PASSENGER_NAME,
	P.PASSENGER_LASTNAME,
	F.DEPARTURE_AIRPORT,
	F.DEPARTURE_DATE,
	R.TICKETS_PRICES
from Reservation R
join Passengers P on R.PASSENGER_EMAIL = P.EMAIL
join Flights F on F.FLIGHTS_NUMBER = R.FLIGHTS_NUMBER

select*
from @table1
GO

--19.2 ��������� ��������� �������
--�������� ����� � ����� ��������, ������ �������� 
select F.ARRIVAL_AIRPORT,
	F.ARRIVAL_DATE,
	A.MODEL
	into #table2
from Flights F
join Aircraft A on F.AIRCRAFT_ID = A.ID

select * from #table2
GO

--19.3 ��������� ���������� �������
--�������� ���, �������, ����� �����������, ����� �������� � ��������� ������
create table ##table3
(
	��� varchar(50),
	������� varchar(50), 
	����������� varchar(50),
	�������� varchar(50), 
	��������� int
)

insert into ##table3 
select P.PASSENGER_NAME,
	P.PASSENGER_LASTNAME,
	F.DEPARTURE_AIRPORT,
	F.ARRIVAL_AIRPORT,
	R.TICKETS_PRICES
from Reservation R
join Passengers P on R.PASSENGER_EMAIL = P.EMAIL
join Flights F on R.FLIGHTS_NUMBER = F.FLIGHTS_NUMBER

select * from ##table3
Go

--19.4 ���������� ��������� ���������
--�������� ���, �������, email ���������, � ����� ��������� ������
with fullTable as
(
	select P.PASSENGER_NAME,
		P.PASSENGER_LASTNAME,
		P.EMAIL,
		R.TICKETS_PRICES
	from Reservation R
	join Passengers P on R.PASSENGER_EMAIL = P.EMAIL
)

select * from fullTable
GO

--�������� ���������
--20.1 ��������� ��� ������ �����, ������� � email ���������
create proc proc1
as
begin 
	select
		P.PASSENGER_NAME,
		P.PASSENGER_LASTNAME,
		P.EMAIL
	from Passengers P
end
GO

exec proc1
Go
--20.2 ��������� ��� ������ �������
create proc proc2
	@result int output
as
begin
	select @result = sum(TICKETS_PRICES)
	from Reservation
end
GO

declare @result int
execute proc2 @result output
select @result as [������� ��������]
GO
--������������ ������������� �������
--21.1 ������� ������������� ��� ������ ������������ � ����� ������ ������ ��������
create function fun1
(
	@maxPrice as int
)
returns @table table
(
	�������� varchar(255),
	������� float,
	��������� int
)
as
begin
	insert into @table
	select F.DEPARTURE_AIRPORT,
		A.RATING,
		R.TICKETS_PRICES
	from Reservation R
	join Flights F on R.FLIGHTS_NUMBER = F.FLIGHTS_NUMBER
	join Airline A on A.AIRLINE_NAME = F.DEPARTURE_AIRPORT
	where TICKETS_PRICES < @maxPrice

	return
end
GO

select *
from dbo.fun1(500)
GO

--21.2 ������� �������� �� ���� com ��� ru � ������� ������� ��� ������� ������
create function fun2(@Region varchar(10))
returns int
as
begin
	declare @income as int
	select @income = sum(TICKETS_PRICES)
	from Reservation
	where RIGHT(PASSENGER_EMAIL, len(@Region)) = @Region

	return @income
end
GO

select dbo.fun2('ru')
GO

drop function dbo.fun1
drop function dbo.fun2
GO

--��������
--22.1 ������� ����������� ������� ��������� �� ������� 
create trigger trig1
on Passengers
instead of delete
as
begin
	print '������ ������� ���������'
end

delete Passengers where PASSENGER_NAME = 'Ivan'
GO

drop trigger trig1
drop trigger trig2
GO
--22.2 ������� ��������� ���������� � ��������� ������� ������ ��������
create trigger trig2 on Passengers
after insert
as
begin
	insert into People
	select PASSENGER_NAME,
		PASSENGER_LASTNAME,
		EMAIL
	from inserted
end
Go

insert into Passengers values
('mikeelton@bk.ru', 'Mike', 'Elton')
GO

select * 
from People
GO

drop trigger trig2
GO

