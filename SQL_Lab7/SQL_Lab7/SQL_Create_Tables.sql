use University
Go

if OBJECT_ID('dbo.Fakultet', 'U') is null
create table Fakultet
(
	ABfak varchar(2) primary key,
	NFak varchar(50)
)
Go

if OBJECT_ID('dbo.Kafedra', 'U') is null
create table Kafedra
(
	ShifrKaf varchar(2) primary key,
	NKaf varchar(50),
	AbFaK_Kaf varchar (2)
)
Go

if OBJECT_ID('dbo.Sotrudnik', 'U') is null
create table Sotrudnik
(  
	TabNom int primary key,
	ShifrKaf_Sotr varchar(2),
	FIO varchar(50),
	Dolgn varchar(50),
	Zarplata float,
	tabNom_ruk int
)
Go

if OBJECT_ID('dbo.Spezialn', 'U') is null
create table Spezialn 
(
	NSpez varchar(8) primary key,
	NaprSpez varchar(50),
	Shifr_Spez varchar(2)
)
Go

if OBJECT_ID('dbo.Predmet', 'U') is null
create table Predmet
(
	kod_pred int primary key,
	Kol int,
	Predmet varchar(50),
	Ispolnitel_kaf varchar(2)
)
Go

if OBJECT_ID('dbo.Zakaz', 'U') is null
create table Zakaz
(
	N_Z varchar(8),
	Kod_Z int
)
Go

if OBJECT_ID('dbo.ZavKaf', 'U') is null
create table ZavKaf
(
	TabNom_K int primary key,
	St_K int
)
Go

if OBJECT_ID('dbo.Ingener','U') is null
create table Ingener
(
	TabNom_IN int primary key,
	Spez varchar(50)
)
Go

if OBJECT_ID('Prepodavatel','U') is null
create table Prepodavatel
(
	TabNom_Pr int primary key,
	Zvanie varchar(50),
	Stepen varchar(50)
)
Go

if OBJECT_ID('Student','U') is null
create table Student
(
	Reg_Nom int primary key,
	Nom_SpeZ_St varchar(8),
	Fio_stud varchar(50)
)
Go

if object_id('dbo.Ozenka', 'U') is null
create table Ozenka
(
	Odata date,
	Kod int,
	ReGNom int,
	tab_Nom int,
	Auditoria varchar(10),
	Ozenka_a int 
)
Go
