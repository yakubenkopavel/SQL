use Booking
Go

--4.1
/*������ ��� ������ � ������������ ������� �� ����
���� �� ������� ������ 500*/
select *
from Reservation
where TICKETS_PRICES <= 500;
Go

--4.2
/*������ ������ � ������������� ������� ������� ������ 8.5*/
select *
from Airline
where RATING > 8.5;
Go

--4.3
/*������ ������ ����������� ������� ������ ������������� �� ov*/
select EMAIL
from Passengers
where RIGHT(PASSENGER_LASTNAME, 2) = 'ov';
Go

--4.4
/*������ ������������, ������� ���� ����� 777*/
select AIRLINE as '������������, ������� ����� ����� 777'
from Aircraft
where Model = 777;
Go

--4.5
/*������ ������ � ������ ������������ ������� �������� ������ ������ ���*/
select *
from Flights
where datediff(day, DEPARTURE_DATE, ARRIVAL_DATE) = 0
Go

--4.6
/*������ ������ � ��������� ������ �� ����� ��������� ����*/
select *
from Aircraft
where IS_EMPTY = 'false';
GO

--4.7
/*������ ������ � ������������ ���� ������� ������ 500 � 
����� ������������� �� ru*/
select *
from Reservation
where TICKETS_PRICES < 500 and RIGHT(PASSENGER_EMAIL, 2) = 'ru';
GO