use StudentDB
Go

--1
select 
	trim(FIO) as FIO,
	Data,
	spez,
	godpost
from Students

--2
SELECT	
	FIO,
	CHARINDEX('о',FIO) AS Позиция_о
FROM Students
Go

--3
select 
	FIO,
	left(FIO, 3) as Спец_3
from Students
GO

--4
select FIO,
	Data,
	replace(spez, 'математика', 'прикладная математика'),
	godpost
from Students
Go

--5
select
	FIO,
	Data,
	Upper(spez),
	godpost
from Students
Go

--6
select 
	FIO,
	reverse(FIO) as reverseFIO
from Students
Go

--7
select distinct REPLICATE(spez, 4) as spez
from Students
GO

--8
select abs(cos(pi())) as cospi,
	abs(sin(pi())) as sinpi,
	abs(tan(pi())) as tanpi,
	abs(cot(pi())) as cotpi
Go

--9
SELECT
ROUND(123.456, 3) AS Окр3
,ROUND(123.456, 2) AS Окр2
,ROUND(123.456, 1) AS Окр1
,ROUND(123.456, 0) AS Окр0
,ROUND(123.456, -1) AS Окр_1
,ROUND(123.456, -2) AS Окр_2
,ROUND(123.456, -3) AS Окр_3
GO

--10
SELECT
CEILING(123.456) AS Больше
,FLOOR(123.456) AS Меньше
Go

--11
SELECT
SQRT(25) AS Корень
,SQUARE(25) AS Квадрат
,POWER(25, 3) AS Куб
Go

--12
SELECT
GETDATE() AS Сейчас
Go

--13
SELECT
DAY(GETDATE()) AS День
,MONTH(GETDATE()) AS Месяц
,YEAR(GETDATE()) AS Год
,DATEPART(HOUR, GETDATE()) AS Час
,DATEPART(MINUTE, GETDATE()) AS Минута
,DATEPART(SECOND, GETDATE()) AS Секунда
,DATEPART(QUARTER, GETDATE()) AS Квартал
,DATEPART(WEEK, GETDATE()) AS Неделя
,DATEPART(DAYOFYEAR, GETDATE()) AS День_года
,DATEPART(WEEKDAY, GETDATE()) AS День_неделиGo--14SELECT
DATEADD(DAY, -100, GETDATE()) AS День_100_Назад
Go

--15
SELECT
DATEDIFF(DAY, '18950708', '19710412') AS Количество_прожитых_дней
Go

--16
SELECT
FIO
, CASE MONTH(Data)
WHEN 3 THEN 'Весна'
WHEN 4 THEN 'Весна'
WHEN 5 THEN 'Весна'
WHEN 6 THEN 'Лето'
WHEN 7 THEN 'Лето'
WHEN 8 THEN 'Лето'
WHEN 9 THEN 'Осень'
WHEN 10 THEN 'Осень'
WHEN 11 THEN 'Осень'
ELSE 'Зима'
END AS Времени_года
FROM Students
Go

--17
SELECT
FIO
,Data
,spez
,godpost
,IIF(godpost- Year(Data) <= 18, 'Молодой','старше')
AS Возраст_при_присвоении
FROM Students
Go

--18
SELECT
FIO
, Data
, CASE
WHEN (MONTH(Data)=3 AND DAY(Data) >= 21)
OR (MONTH(Data)=4 AND DAY(Data) <= 20) THEN 'Овен'
WHEN (MONTH(Data)=4 AND DAY(Data) >= 21)
OR (MONTH(Data)=5 AND DAY(Data) <= 21) THEN 'Телец'
WHEN (MONTH(Data)=5 AND DAY(Data) >= 22)
OR (MONTH(Data)=6 AND DAY(Data) <= 21) THEN 'Близнецы'
WHEN (MONTH(Data)=6 AND DAY(Data) >= 22)
OR (MONTH(Data)=7 AND DAY(Data) <= 22) THEN 'Рак'
WHEN (MONTH(Data)=7 AND DAY(Data) >= 23)
OR (MONTH(Data)=8 AND DAY(Data) <= 21) THEN 'Лев'
WHEN (MONTH(Data)=8 AND DAY(Data) >= 22)
OR (MONTH(Data)=9 AND DAY(Data) <= 23) THEN 'Дева'
WHEN (MONTH(Data)=9 AND DAY(Data) >= 24)
OR (MONTH(Data)=10 AND DAY(Data) <= 23) THEN 'Весы'
WHEN (MONTH(Data)=10 AND DAY(Data) >= 24)
OR (MONTH(Data)=11 AND DAY(Data) <= 22) THEN 'Скорпион'
WHEN (MONTH(Data)=11 AND DAY(Data) >= 23)
OR (MONTH(Data)=12 AND DAY(Data) <= 22) THEN 'Стрелец'
WHEN (MONTH(Data)=12 AND DAY(Data) >= 23)
OR (MONTH(Data)=1 AND DAY(Data) <= 20) THEN 'Козерог'
WHEN (MONTH(Data)=1 AND DAY(Data) >= 21)
OR (MONTH(Data)=2 AND DAY(Data) <= 19) THEN 'Водолей'
WHEN (MONTH(Data)=2 AND DAY(Data) >= 20)
OR (MONTH(Data)=3 AND DAY(Data) <= 20) THEN 'Рыбы'
END AS Знак_зодиака
FROM Students