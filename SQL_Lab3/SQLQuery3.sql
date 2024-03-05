use Booking
Go

--8.1
/*������ ������ � ���������� ����� ��� ������� ���������� �� �*/
select count(*) as count_people
from Passengers
where LEFT(PASSENGER_NAME, 1) = 'M';
Go

--8.2
/*������ ���������� � ������������ ������� ��� ��������������� �������*/
select Max(TICKETS_PRICES) - MIN(TICKETS_PRICES) as diff
from Reservation;
Go

--8.3
/*������ ���������� � ������� �������� ��������� ������������*/
select AVG(RATING) as avarage_rating
from Airline
Go

--8.4
/*������ ���������� � ������� ���������� � ������� ���� �������*/
select SUM(TICKETS_PRICES) as income
from Reservation;
Go

--8.5
/*������ ����������� ������� ������������*/
select Min(RATING)
from Airline
Go

--5
/*������������ ������� Reservation � Book*/
exec sp_rename 'Reservation', 'Book'
Go

--6
/*������� �� 2 ������ � ������ �� ��������� ������*/
insert Airline values
('Demodevo', 7.6),
('Vnukovo', 7.0)
insert Aircraft values
(1443, 737, default, 'Demodevo'),
(8756, 737, 'false', 'Vnukovo')
insert Flights values
(13454, 'Demodevo', 'Seoul Gimpo International Airport', '2023-10-20', '2023-10-21', 1443),
(69857, 'Bangkok Suvarnabhumi Airport', 'Vnukovo', '2023-11-2', '2023-11-3', 8756)
insert Passengers values
('usupovivan@mail.ru', 'Ivan', 'Usupov'),
('sorokinpeter@bk.ru', 'Peter', 'Sorokin')
insert Reservation values
('usupovivan@mail.ru', 13454, 600),
('sorokinpeter@bk.ru', 69857, 700)
GO

--7
/*������� ������ ������������ �� ��������� �� ��������� 10000*/
alter table Airline
add CAPACITY int default(10000)
GO

/*������� ����������� �� ����������� ������������,
��� ��� ������ ���� ������ 10000*/
alter table Airline
add constraint CK_Airline_Capacity check(CAPACITY > 10000)
GO
