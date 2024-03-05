use Booking

if OBJECT_ID('dbo.Airline', 'U') is null
create table Airline
(
	AIRLINE_NAME varchar(50) primary key,
	RATING float Null,
	constraint CK_Airline_Rating check(RATING >= 0 and RATING <= 10)
);
Go

if OBJECT_ID('dbo.Aircraft', 'U') is null
create table Aircraft
(
	ID int primary key,
	MODEL int not null,
	IS_EMPTY varchar(10) not null default 'true',
	AIRLINE varchar(50) not null,
	constraint FK_Airline foreign key (AIRLINE) references Airline(AIRLINE_NAME) on delete cascade
);
Go

if OBJECT_ID('dbo.Flights', 'U') is null
create table dbo.Flights
(
	FLIGHTS_NUMBER int primary key,
	DEPARTURE_AIRPORT varchar(50),
	ARRIVAL_AIRPORT varchar(50),
	DEPARTURE_DATE date,
	ARRIVAL_DATE date,
	AIRCRAFT_ID int unique  ,
	constraint FK_Aircraft foreign key (AIRCRAFT_ID) references Aircraft(ID) on delete cascade
);
Go


if OBJECT_ID('dbo.Passengers', 'U') is null
create table dbo.Passengers
(
	EMAIL varchar(50) primary key,
	PASSENGER_NAME varchar(50) not null,
	PASSENGER_LASTNAME varchar(50) not null
)
Go

if OBJECT_ID('dbo.Reservation', 'U') is null
create table dbo.Reservation
(
	PASSENGER_EMAIL varchar(50),
	FLIGHTS_NUMBER int,
	TICKETS_PRICES int not null,
	primary key(PASSENGER_EMAIL, FLIGHTS_NUMBER),

	constraint FK_Passenger foreign key (PASSENGER_EMAIL) 
	references Passengers(EMAIL),

	constraint FK_Flights foreign key (FLIGHTS_NUMBER)
	references Flights(FLIGHTS_NUMBER)
)
Go
