use Booking
Go

--4.1
/*Вывожу все данные о бронировании белетов на рейс
цена на которые меньше 500*/
select *
from Reservation
where TICKETS_PRICES <= 500;
Go

--4.2
/*Вывожу данные о авиакомпаниях рейтинг которых больше 8.5*/
select *
from Airline
where RATING > 8.5;
Go

--4.3
/*Вывожу имейлы пассажирова фамилия котрых заканчивается на ov*/
select EMAIL
from Passengers
where RIGHT(PASSENGER_LASTNAME, 2) = 'ov';
Go

--4.4
/*Вывожу авиакомпании, которые имею Боинг 777*/
select AIRLINE as 'Авиакомпании, которые имеют Боинг 777'
from Aircraft
where Model = 777;
Go

--4.5
/*Вывожу данные о рейсах длительность которых занимает меньше одного дня*/
select *
from Flights
where datediff(day, DEPARTURE_DATE, ARRIVAL_DATE) = 0
Go

--4.6
/*вывожу данные о сомалетах кторые не имеют свободных мест*/
select *
from Aircraft
where IS_EMPTY = 'false';
GO

--4.7
/*Вывожу данные о бранировании цена которых меньше 500 и 
имейл заканчивается на ru*/
select *
from Reservation
where TICKETS_PRICES < 500 and RIGHT(PASSENGER_EMAIL, 2) = 'ru';
GO