use Booking
Go

--8.1
/*Вывожу данные о количестве людей имя которых начинается на М*/
select count(*) as count_people
from Passengers
where LEFT(PASSENGER_NAME, 1) = 'M';
Go

--8.2
/*Вывожу информацию о максимальной разницы цен забронированных билетов*/
select Max(TICKETS_PRICES) - MIN(TICKETS_PRICES) as diff
from Reservation;
Go

--8.3
/*Вывожу информацию о среднем рейтинге имеющихся авиакомпаний*/
select AVG(RATING) as avarage_rating
from Airline
Go

--8.4
/*Вывожу информацию о прибыли полученной с продажи всех билетов*/
select SUM(TICKETS_PRICES) as income
from Reservation;
Go

--8.5
/*Вывожу минимальный рейтинг авиакомпании*/
select Min(RATING)
from Airline
Go

--5
/*Переименовал таблицу Reservation в Book*/
exec sp_rename 'Reservation', 'Book'
Go

--6
/*Добавил по 2 записи в каждую из имеющихся таблиц*/
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
/*Добавил размер авиакомпании со значением по умолчанию 10000*/
alter table Airline
add CAPACITY int default(10000)
GO

/*Добавил ограничение на размерность авиакомпании,
что она должна быть больше 10000*/
alter table Airline
add constraint CK_Airline_Capacity check(CAPACITY > 10000)
GO
