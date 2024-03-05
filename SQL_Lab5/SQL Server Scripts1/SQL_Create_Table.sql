use groupBD

if OBJECT_ID('dbo.School', 'U') is null
create table School
(
	id int primary key identity,
	fio varchar(50),
	predmet varchar(50),
	ush varchar(50),
	ball float
)
Go

insert School  values
('�������', '����������', '�����', 98.5),
('������', '������', '�����', 99),
('�������', '����������', '�����', 88),
('��������', '������', '��������', 78),
('��������', '�����', '�����', 92),
('��������', '�����', '��������', 68),
('��������', '����������', '��������', 81),
('������', '������', '�����', 87),
('��������', '�����', '�����', 94),
('��������', '�����', '�����', 88)
Go

--7.1
if OBJECT_ID('db0.test_table_pivot', 'U') is null
CREATE TABLE test_table_pivot(
 fio varchar(50) NULL,
 god int NULL,
 summa float NULL
 )
 Go

 --7.2
 insert test_table_pivot values
 ('������ �.�.', 2011, 200),
 ('������ �.�.', 2011, 500),
 ('������ �.�.', 2012, 300),
 ('������ �.�.', 2012, 600),
 ('������ �.�.', 2013, 900),
 ('������ �.�.', 2014, 500),
 ('������ �.�.', 2014, 300),
 ('������ �.�.', 2015, 100),
 ('������ �.�.', 2011, 100),
 ('������ �.�.', 2012, 200),
 ('������ �.�.', 2012, 300),
 ('������ �.�.', 2013, 100),
 ('������ �.�.', 2014, 300),
 ('������ �.�.', 2014, 100),
 ('������� �.�', 2012, 100),
 ('������� �.�', 2013, 1000),
 ('������� �.�', 2014, 500),
 ('������� �.�', 2014, 300),
 ('������� �.�', 2015, 300)
 Go

 --1
 if OBJECT_ID('dbo.Employee', 'U') is null
 create table Employee
 (
	id int primary key identity,
	manager varchar(50),
	otdel varchar(50),
	god int,
	summa float
 );
 Go

 --2
 insert Employee values
 ('���������_1', '�����������', 2014, 200.00),
 ('���������_2', '�����������', 2014, 300.00),
 ('���������_3', '����� �������', 2014, 150.00),
 ('���������_4', '����� �������', 2014, 200.00),
 ('���������_5', '����� ����������', 2014, 250.00),
 ('���������_6', '����� ����������', 2014, 300.00),
 ('���������_7', '����� ����������', 2014, 300.00),
 ('���������_1', '�����������', 2015, 230.00),
 ('���������_2', '�����������', 2015, 200.00),
 ('���������_3', '����� �������', 2015, 200.00),
 ('���������_4', '����� �������', 2015, 300.00),
 ('���������_5', '����� ����������', 2015, 200.00),
 ('���������_6', '����� ����������', 2015, 250.00),
 ('���������_7', '����� ����������', 2015, 350.00)