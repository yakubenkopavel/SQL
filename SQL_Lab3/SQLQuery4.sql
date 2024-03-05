use Booking
Go

--9.1
/*Вывожу информацию о аэропортов вылета и количестве рейсов 
которые из них производится*/
select DEPARTURE_AIRPORT, 
	count(ARRIVAL_AIRPORT) 
from Flights
group by DEPARTURE_AIRPORT
Go

--9.2
/*Вывожу информацию о всех возможных ценнах на авиабилеты и 
количество людей которые купили билет по данной цене*/
select TICKETS_PRICES, count(PASSENGER_EMAIL)
from Reservation
group by TICKETS_PRICES;
GO

--10.1
/*Вывожу информацию о авиакомпании, которые содержат более одной модели самолетов,
и количестве моделий самолетов*/
select AIRLINE , count(MODEL) as count_Model
from Aircraft
group by AIRLINE
having count(MODEL) > 1;
Go

--10.2
/*Вывожу информацию о аэропортах прилета, которые принимает самолеты из более 1 аэропорта,
и количестве принимаемых аэропортов*/
select ARRIVAL_AIRPORT, count(DEPARTURE_AIRPORT) as 'загруженность'
from Way
group by ARRIVAL_AIRPORT
having count(DEPARTURE_AIRPORT) > 1
Go

--11.1
/*Вывожу информацию в какие аэропорты можно попасть из данного и 
сколько рейсов проходят по данному маршруту, а также сколько рейсов 
прибывает в перечисленные аэропорты*/
select DEPARTURE_AIRPORT, ARRIVAL_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by ARRIVAL_AIRPORT, DEPARTURE_AIRPORT with cube
Go

--11.2
/*Вывожу информацию в какие аэропорты можно попасть из данного и 
сколько рейсов проходят по данному маршруту*/
select DEPARTURE_AIRPORT, ARRIVAL_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by DEPARTURE_AIRPORT, ARRIVAL_AIRPORT with rollup
Go

--11.3
/*Вывожу информацию сколько рейсов вылетает и прилетает в каждый из аэропортов*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT, count(FLIGHTS_NUMBER)
from Flights
group by GROUPING sets(ARRIVAL_AIRPORT, DEPARTURE_AIRPORT)
Go

--11.4
/*Вывожу информацию о маршруте, сколько дней он займет, 
общее количество дней полета для каждого из аэропортов вылета*/
select ARRIVAL_AIRPORT, DEPARTURE_AIRPORT, datediff(day, DEPARTURE_DATE, ARRIVAL_DATE) as diff, 
	sum(datediff(day, DEPARTURE_DATE, ARRIVAL_DATE)) over (partition by ARRIVAL_AIRPORT) as sum_diff
from Flights
Go

--12.1
/*Вывожу в таблицу информацию о моделях и количестве авиакомпаний,
содержащих свободные или занятые самолеты*/
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
/*Вывожу информацию об емайлах и фамилии, и имени ему соответствующие*/
select EMAIL, [имя или фамилия]
from Passengers
unpivot
(
[имя или фамилия] for значения in (PASSENGER_NAME, PASSENGER_LASTNAME)
)unpvt
Go