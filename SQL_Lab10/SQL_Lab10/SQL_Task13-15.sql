use Booking 
GO

--13.1 ќбъедин€ем таблицы с именем и стоимостью билета дл€ данного пассажира
select R.TICKETS_PRICES,
	P.PASSENGER_LASTNAME
from Reservation R 
inner join Passengers P on R.PASSENGER_EMAIL = P.EMAIL  
GO

--13.2 ¬ывод всех авикомпаний и даты вылетов дл€ этих аэропортов
select A.AIRLINE_NAME,
		A.RATING,
		F.DEPARTURE_DATE
from Airline A
left join Flights F on F.DEPARTURE_AIRPORT = A.AIRLINE_NAME
Go

--13.3 ќбъедин€ем таблицы с именем и стоимостью билета дл€ данного пассажира
-- при этом выводим всех пассажиров даже дл€ которых еще не назначен рейс
select R.TICKETS_PRICES,
	P.PASSENGER_LASTNAME
from Reservation R 
right join Passengers P on R.PASSENGER_EMAIL = P.EMAIL  
GO

--13.4 јналогично предыдущему варианту в данном случае
select R.TICKETS_PRICES,
	P.PASSENGER_LASTNAME
from Reservation R 
full join Passengers P on R.PASSENGER_EMAIL = P.EMAIL  
GO

--13.5 ¬се возможные маршруты
select A.AIRLINE_NAME as DEPARTURE_AIRPORT,
		F.ARRIVAL_AIRPORT
from Airline A 
cross join Flights F 
GO

--14.1.1 ¬ыводим пассажиров со стоимостью билета < 200 и > 400
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES < 200
union select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 400
Go

--14.1.2 ¬ыводим всех пассажиров с ограничением 
--на стоимость билета дл€ иностранных пассажирво
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 500
union select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where right(PASSENGER_EMAIL, 2) = 'ru'
GO

--14.2.1 ¬ыводим пассажиров со стоимостью билета от 200 до 400
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES >= 200
intersect select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES < 400
Go

--14.2.2 ¬ыводим иностранных пассажиров с ценой билета больше 500
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 500
intersect select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where right(PASSENGER_EMAIL, 3) = 'com'
GO

--14.3.1 ¬ыводим пассажиров со стоимость билета от 200 до 400
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES >= 200
except select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 400
Go

--14.3.2 ”брали всех иностранный пассажиров и рассматриваем пассажиров
--со стоимость билета больше 200
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 200
except select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where right(PASSENGER_EMAIL, 3) = 'com'
GO

--15.1 —мотрим авиакомпании с определенной моделью самолета
select AIRLINE_NAME,
	RATING
from Airline
where AIRLINE_NAME in
	(
	select AIRLINE
	from Aircraft
	where MODEL = 787
	)
Go

--15.2 —мотрим сколько иностранных пассажиров плат€т больше
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > all
	(
		select TICKETS_PRICES
		from Reservation
		where RIGHT(PASSENGER_EMAIL, 2) = 'ru'
	)
Go

--15.3 ѕросматриваем пассажиров со стоимость билета больше какого-то пассажира
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > any
	(
		select TICKETS_PRICES
		from Reservation
		where RIGHT(PASSENGER_EMAIL, 2) = 'ru'
	)
Go

--15.4 ѕроссматриваем иностранных пассажиров со стоимость билета больше 300
select PASSENGER_EMAIL,
	TICKETS_PRICES
from Reservation
where TICKETS_PRICES > 300 and
	exists 
	(
	select *
	from Reservation
	where right(PASSENGER_EMAIL, 2) = 'ru'
	) 
Go