use StudentDB
Go

select * from Students, Tabl_uch1
Go

--1
declare @a int, @b int, @c int
set @a = 5
set @b = 10
set @c = @a*@b print @c
GO

--2
declare @licey float, @gimn float, @diff float

set @licey = 
	(
	select avg(ball)
	from Tabl_uch1
	where ush = 'Ћицей'
	)

set @gimn = 
	(
	select avg(ball)
	from Tabl_uch1
	where ush = '√имнази€'
	)

set @diff = abs(@licey - @gimn) print @diff
Go

--3
declare @CountLine int
set @CountLine = 
				(
				select count(*)
				from Tabl_uch1
				)
if @CountLine % 2 = 0
	print 'четное количество строк'
else
	print 'нечетное количество строк'
Go

--4
declare @number int = rand()*(10000-1000)+1000, @sum int = 0
print @number
while @number > 0
begin
	set @sum = @sum + (@number % 10)
	set @number = @number / 10
end
print @sum
Go

--5
declare @a int = rand()*100, @b int = rand()*100, @c int = rand()*100
print @a
Print @b
print @c
if @a > @b
	set @a = @b

if @a > @c
	set @a = @c
print @a
GO


--6
declare @a1 int = rand()*1000
print @a1
if @a1 % 11 = 0
	print 'ƒелитс€ на 11'
else
	print 'Ќе делитс€ на 11'
Go

--7
declare @N int = rand()*1000
while @N % 3 = 0
	set @N = @N / 3
print @N
if @N = 1
	print 'явл€етс€ степенью числа 3'
else
	print 'не €вл€етс€ степенью числа 3'
GO

--8
declare @a1 int = rand()*1000, @a2 int = rand()*1000, @result int
print @a1
print @a2
set @result = @a1 * @a2
while @a1!=@a2
begin
	if @a1 > @a2
		set @a1 = @a1 - @a2
	else
		set @a2 = @a2 - @a1
end
set @result = @result / @a1
print @result
Go

--9
declare @a int = rand()*1000
declare @b int = @a + rand() * 10, @sum int = 0
print @a
print @b
while @a <= @b
begin
	set @sum = @sum + @a*@a
	set @a = @a + 1
end
print @sum
GO

--10
declare @a int = 1
while (@a % 2 != 1) or (@a%3!=1) or (@a % 4 !=1) or (@a % 5 != 1) or (@a % 6 != 1) or (@a % 7 = 0)
	set @a = @a + 1
print @a
Go

--11
declare @name char(8) = 'якубенко'
declare @len int = len(@name)
print replicate(@name + ' ', @len)
Go
