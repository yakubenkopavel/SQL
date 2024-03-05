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
	CHARINDEX('�',FIO) AS �������_�
FROM Students
Go

--3
select 
	FIO,
	left(FIO, 3) as ����_3
from Students
GO

--4
select FIO,
	Data,
	replace(spez, '����������', '���������� ����������'),
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
ROUND(123.456, 3) AS ���3
,ROUND(123.456, 2) AS ���2
,ROUND(123.456, 1) AS ���1
,ROUND(123.456, 0) AS ���0
,ROUND(123.456, -1) AS ���_1
,ROUND(123.456, -2) AS ���_2
,ROUND(123.456, -3) AS ���_3
GO

--10
SELECT
CEILING(123.456) AS ������
,FLOOR(123.456) AS ������
Go

--11
SELECT
SQRT(25) AS ������
,SQUARE(25) AS �������
,POWER(25, 3) AS ���
Go

--12
SELECT
GETDATE() AS ������
Go

--13
SELECT
DAY(GETDATE()) AS ����
,MONTH(GETDATE()) AS �����
,YEAR(GETDATE()) AS ���
,DATEPART(HOUR, GETDATE()) AS ���
,DATEPART(MINUTE, GETDATE()) AS ������
,DATEPART(SECOND, GETDATE()) AS �������
,DATEPART(QUARTER, GETDATE()) AS �������
,DATEPART(WEEK, GETDATE()) AS ������
,DATEPART(DAYOFYEAR, GETDATE()) AS ����_����
,DATEPART(WEEKDAY, GETDATE()) AS ����_������Go--14SELECT
DATEADD(DAY, -100, GETDATE()) AS ����_100_�����
Go

--15
SELECT
DATEDIFF(DAY, '18950708', '19710412') AS ����������_��������_����
Go

--16
SELECT
FIO
, CASE MONTH(Data)
WHEN 3 THEN '�����'
WHEN 4 THEN '�����'
WHEN 5 THEN '�����'
WHEN 6 THEN '����'
WHEN 7 THEN '����'
WHEN 8 THEN '����'
WHEN 9 THEN '�����'
WHEN 10 THEN '�����'
WHEN 11 THEN '�����'
ELSE '����'
END AS �������_����
FROM Students
Go

--17
SELECT
FIO
,Data
,spez
,godpost
,IIF(godpost- Year(Data) <= 18, '�������','������')
AS �������_���_����������
FROM Students
Go

--18
SELECT
FIO
, Data
, CASE
WHEN (MONTH(Data)=3 AND DAY(Data) >= 21)
OR (MONTH(Data)=4 AND DAY(Data) <= 20) THEN '����'
WHEN (MONTH(Data)=4 AND DAY(Data) >= 21)
OR (MONTH(Data)=5 AND DAY(Data) <= 21) THEN '�����'
WHEN (MONTH(Data)=5 AND DAY(Data) >= 22)
OR (MONTH(Data)=6 AND DAY(Data) <= 21) THEN '��������'
WHEN (MONTH(Data)=6 AND DAY(Data) >= 22)
OR (MONTH(Data)=7 AND DAY(Data) <= 22) THEN '���'
WHEN (MONTH(Data)=7 AND DAY(Data) >= 23)
OR (MONTH(Data)=8 AND DAY(Data) <= 21) THEN '���'
WHEN (MONTH(Data)=8 AND DAY(Data) >= 22)
OR (MONTH(Data)=9 AND DAY(Data) <= 23) THEN '����'
WHEN (MONTH(Data)=9 AND DAY(Data) >= 24)
OR (MONTH(Data)=10 AND DAY(Data) <= 23) THEN '����'
WHEN (MONTH(Data)=10 AND DAY(Data) >= 24)
OR (MONTH(Data)=11 AND DAY(Data) <= 22) THEN '��������'
WHEN (MONTH(Data)=11 AND DAY(Data) >= 23)
OR (MONTH(Data)=12 AND DAY(Data) <= 22) THEN '�������'
WHEN (MONTH(Data)=12 AND DAY(Data) >= 23)
OR (MONTH(Data)=1 AND DAY(Data) <= 20) THEN '�������'
WHEN (MONTH(Data)=1 AND DAY(Data) >= 21)
OR (MONTH(Data)=2 AND DAY(Data) <= 19) THEN '�������'
WHEN (MONTH(Data)=2 AND DAY(Data) >= 20)
OR (MONTH(Data)=3 AND DAY(Data) <= 20) THEN '����'
END AS ����_�������
FROM Students