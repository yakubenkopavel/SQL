use Booking
Go

--3.1
/*Вывожу все данные из имеющихся таблиц*/
select * 
from Aircraft

select *
from Airline

select * from Flights

select * from Passengers

select * from Reservation;
Go

--3.2
/*Вывожу все данные о пассажирах отсортированные по имени пассажиров 
в алфавитном порядке*/
select *
from Passengers
order by PASSENGER_NAME asc;
Go

--3.3
/*Вывожу все данные о пассажирах отсортированные в обратном алфавитном 
порядке по имени и фамилии пассажиров*/
select *
from Passengers
order by PASSENGER_NAME desc, PASSENGER_LASTNAME desc;
Go

--3.4
/*Вывожу имеющиеся модели самолетов без дубликатов*/
select distinct Model
from Aircraft
GO

--3.5
/*Вывожу 30% всей информации о рейсах*/
select top 30 percent *
from Flights;
Go

--3.6
/*Вывожу первые 5 строк информации о рейсах*/
select top 5 *
from Flights;
Go

--3.7
/*Вывожу строки с 4 по 7 о всех данных авиакомпаний отсортированные 
в обратном порядке по имени авиакомпании*/
select *
from Airline
order by AIRLINE_NAME desc
	offset 3 rows
	fetch next 4 rows only;
Go

--3.8
/*Вывожу всю информацию о рейсах отсортированные по возрастанию дней, 
который займет данный рейс*/
select *
from Flights
order by datediff(day, DEPARTURE_DATE, ARRIVAL_DATE);
Go

--3.9
/*Создаю таблицу содержащую информацию об аэропортах 
из которых производится вылет и в которые прибывают самолеты,
а также вывожу все данные этой таблицы*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT
into Way
from Flights

select *
from Way
Go

