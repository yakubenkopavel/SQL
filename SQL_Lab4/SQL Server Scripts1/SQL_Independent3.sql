use ProductDB
Go

--1
select * 
from Product
where Manufacturer = 'Samsung';
Go

--2
select *
from Product
where Price > 45000;
Go

--3
select *
from Product
where Price*ProductCount> 200000;
Go

--4
select *
from Product
where Manufacturer = 'Samsung' and Price>50000;
GO

--5
select *
from Product
where Manufacturer = 'Samsung' or Price>50000;
GO

--6
select *
from Product
where Manufacturer != 'Samsung';
GO

--7
select *
from Product
where (Manufacturer = 'Samsung') or 
	(ProductCount > 2 and Price > 30000);
GO

--8
select *
from Product
where Manufacturer = 'Samsung' 
or Manufacturer = 'Xiaomi' 
or Manufacturer = 'Huawei';
GO

--9
select *
from Product
where (Price >= 20000) and (Price <= 40000);
Go

--10
select *
from Product
where (Price*ProductCount > 100000) and (Price*ProductCount < 200000);
Go