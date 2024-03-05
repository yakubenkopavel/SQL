use StudentDB
Go

--1
declare @a int, @b int, @c int
set @a = 5
set @b = 10
set @c = @a+@b print @c
GO

--2
declare @licey float, @gimn float, @diff float

set @licey = 
	(
	select max(ball)
	from Tabl_uch1
	where ush = 'Лицей'
	)

set @gimn = 
	(
	select max(ball)
	from Tabl_uch1
	where ush = 'Гимназия'
	)

set @diff = abs(@licey - @gimn) print @diff
Go

--3
declare @maxp float, @minp float, @diff float
select @maxp = max(ball),
	@minp = min(ball)
from Tabl_uch1
set @diff = @maxp - @minp
print @diff
GO

--4
declare @a1 int, @b1 int
set @a1 = rand()*1000
set @b1 = square(@a1)
print @a1
print @b1
Go

--5
declare @a2 int = rand() * 100, @b2 int = rand() * 100
if @a2 > @b2 print '@a2 = ' + cast(@a2 as varchar(3))
else print '@a2 = ' + cast(@b2 as varchar(3))
Go

--6
declare @a3 int = rand() * 100
if @a3 % 3 = 0
print cast(@a3 as varchar(3)) + ' делится на 3'
else 
print cast(@a3 as varchar(3)) + ' не делится на 3'
Go

--7
declare @a4 int = rand() * 1000
while @a4 % 5 = 0
	set @a4 = @a4 / 5
if @a4 = 1
print 'Да'
else 
print 'Нет'
Go

--8
declare @a5 int =  rand() * 1000, @b5 int = rand()*1000
print '@a5 = ' + cast(@a5 as varchar(4))
print '@b5 = ' + cast(@b5 as varchar(4))
while @a5 != @b5
begin
	if @a5 > @b5
	set @a5 = @a5 - @b5
	else
	set @b5 = @b5 - @a5
end
print 'НОД = ' + cast (@a5 as varchar(4))
Go

--9
declare @a6 int = 5, @b6 int = 10, @s int = 0
while @a6 <= @b6
begin
	set @s = @s + @a6
	set @a6 = @a6 + 1
end
print 'Сумма' + cast(@s as varchar(5))
GO

--10
declare @N int = rand()*10, @M int = 1, @S1 int = 0
while @M <= 2 * @N -1 
begin
	set @S1 = @S1 + @M
	print @S1
	set @M = @M + 2
end
Go

--11
declare @a8 int = 10
while @a8 < 100
begin
	if (@a8 % 4 = 0) and (@a8 % 6 != 0)
	print @a8
	set @a8 = @a8 + 1
end
Go

--12
declare @d int = 31, @m int = 12
set @d = case
			when @m in (1,3,5,7,8,10,12) and @d = 31 then 1
			when @m in (4,6,9,11) and @d = 30 then 1
			when @m = 2 and @d = 29 then 1
			else @d + 1
		end
set @m = case
			when @d = 1 and @m = 12 then 1
			when @d = 1 and @m < 12 then @m + 1
			else @m
		end
print cast(@d as varchar(2)) + '/' + cast(@m as varchar(2))
Go

--13
declare @l int, @n1 char(13)
set @l = len(@n1)
while @l > 0
begin
	print(@n1)
	set @l = @l - 1	
end
Go

--14
declare @l1 int, @n1 char(13), @m1 int
set @n1 = 'Нижневартовск'
set @l1 = len(@n1)
set @m1 = @l1
while @l1 > 0
begin
	print left(@n1, @l1) + space(@m1-@l1) 
	+ right(reverse(@n1),@l1) + space(@m1-@l1)
	set @l1 = @l1 -1
end
set @l1 = 2
while @l1 < @m1
begin
	print left(@n1, @l1) + space(@m1-@l1) 
	+ right(reverse(@n1),@l1) + space(@m1-@l1)
	set @l1 = @l1 + 1
end
Go


--15
declare @l2 int, @n2 char(13), @m2 int
set @n2 = 'Нижневартовск'
set @l2 = len(@n2)
set @m2 = @l2
while @l2 > 0
begin
	print left(@n2, @l2) + space(2*(@m2-@l2)) + right(reverse(@n2),@l2)
	set @l2 = @l2 -1
end
set @l2 = 2
while @l2 < @m2
begin
	print left(@n2, @l2) + space(2*(@m2-@l2)) + right(reverse(@n2),@l2)
	set @l2 = @l2 + 1
end