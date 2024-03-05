use groupBD
Go
--3.1
select otdel, god, sum(summa) as expenses
from Employee
group by otdel, god
Go

--3.2
select otdel, god, sum(summa) as expenses
from Employee
group by otdel, god with rollup
Go

--3.3
select otdel, sum(summa) as expenses
from Employee
group by otdel with rollup
Go

--3.4
select god, sum(summa) as expenses
from Employee
group by god with rollup
Go

--4.1
select otdel, god, sum(summa) as expenses
from Employee
group by otdel, god with cube
Go

--5.1
select otdel, god, sum(summa) as expenses
from Employee
group by grouping sets(otdel, god)
Go

--6
select otdel, isnull(cast(god as varchar(30)),
		case when grouping(god)=1 and grouping(otdel)=0
		then 'промежуточный результат' else 'Общий итог' end) as god,
		sum(summa) as itog,
		grouping(otdel) as grouping_otdel,
		grouping(god) as groupin_god
from Employee
group by rollup(otdel, god)