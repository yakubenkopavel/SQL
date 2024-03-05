use Booking
Go

--9.1
/*������ ���������� � ���������� ������ � ���������� ������ 
������� �� ��� ������������*/
select DEPARTURE_AIRPORT, 
	count(ARRIVAL_AIRPORT) 
from Flights
group by DEPARTURE_AIRPORT
Go

--9.2
/*������ ���������� � ���� ��������� ������ �� ���������� � 
���������� ����� ������� ������ ����� �� ������ ����*/
select TICKETS_PRICES, count(PASSENGER_EMAIL)
from Reservation
group by TICKETS_PRICES;
GO

--10.1
/*������ ���������� � ������������, ������� �������� ����� ����� ������ ���������,
� ���������� ������� ���������*/
select AIRLINE , count(MODEL) as count_Model
from Aircraft
group by AIRLINE
having count(MODEL) > 1;
Go

--10.2
/*������ ���������� � ���������� �������, ������� ��������� �������� �� ����� 1 ���������,
� ���������� ����������� ����������*/
select ARRIVAL_AIRPORT, count(DEPARTURE_AIRPORT) as '�������������'
from Way
group by ARRIVAL_AIRPORT
having count(DEPARTURE_AIRPORT) > 1
Go

--11.1
/*������ ���������� � ����� ��������� ����� ������� �� ������� � 
������� ������ �������� �� ������� ��������, � ����� ������� ������ 
��������� � ������������� ���������*/
select DEPARTURE_AIRPORT, ARRIVAL_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by ARRIVAL_AIRPORT, DEPARTURE_AIRPORT with cube
Go

--11.2
/*������ ���������� � ����� ��������� ����� ������� �� ������� � 
������� ������ �������� �� ������� ��������*/
select DEPARTURE_AIRPORT, ARRIVAL_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by DEPARTURE_AIRPORT, ARRIVAL_AIRPORT with rollup
Go

--11.3
/*������ ���������� ������� ������ �������� � ��������� � ������ �� ����������*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by GROUPING sets(ARRIVAL_AIRPORT, DEPARTURE_AIRPORT)
Go

--11.4
/*������ ���������� � ��������, ������� ���� �� ������, 
����� ���������� ���� ������ ��� ������� �� ���������� ������*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT, datediff(day, DEPARTURE_DATE, ARRIVAL_DATE) as diff, 
	sum(datediff(day, DEPARTURE_DATE, ARRIVAL_DATE)) over (partition by ARRIVAL_AIRPORT) as sum_diff
from Flights
Go

--12.1
/*������ � ������� ���������� � ������� � ���������� ������������,
���������� ��������� ��� ������� ��������*/
select model, true, false
from 
(
select model, is_empty, AIRLINE
from Aircraft
)as source_table
pivot
(
count(AIRLINE) for is_empty in (true, false)
)as pivot_table
GO

--12.2
/*������ ���������� �� ������� � �������, � ����� ��� ���������������*/
select EMAIL, [��� ��� �������]
from Passengers
unpivot
(
[��� ��� �������] for �������� in (PASSENGER_NAME, PASSENGER_LASTNAME)
)unpvt
Go