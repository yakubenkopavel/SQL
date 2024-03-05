use Booking
Go

--3.1
/*������ ��� ������ �� ��������� ������*/
select * 
from Aircraft

select *
from Airline

select * from Flights

select * from Passengers

select * from Reservation;
Go

--3.2
/*������ ��� ������ � ���������� ��������������� �� ����� ���������� 
� ���������� �������*/
select *
from Passengers
order by PASSENGER_NAME asc;
Go

--3.3
/*������ ��� ������ � ���������� ��������������� � �������� ���������� 
������� �� ����� � ������� ����������*/
select *
from Passengers
order by PASSENGER_NAME desc, PASSENGER_LASTNAME desc;
Go

--3.4
/*������ ��������� ������ ��������� ��� ����������*/
select distinct Model
from Aircraft
GO

--3.5
/*������ 30% ���� ���������� � ������*/
select top 30 percent *
from Flights;
Go

--3.6
/*������ ������ 5 ����� ���������� � ������*/
select top 5 *
from Flights;
Go

--3.7
/*������ ������ � 4 �� 7 � ���� ������ ������������ ��������������� 
� �������� ������� �� ����� ������������*/
select *
from Airline
order by AIRLINE_NAME desc
	offset 3 rows
	fetch next 4 rows only;
Go

--3.8
/*������ ��� ���������� � ������ ��������������� �� ����������� ����, 
������� ������ ������ ����*/
select *
from Flights
order by datediff(day, DEPARTURE_DATE, ARRIVAL_DATE);
Go

--3.9
/*������ ������� ���������� ���������� �� ���������� 
�� ������� ������������ ����� � � ������� ��������� ��������,
� ����� ������ ��� ������ ���� �������*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT
into Way
from Flights

select *
from Way
Go

