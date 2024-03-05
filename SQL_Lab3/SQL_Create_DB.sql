CREATE DATABASE Booking
ON
(
	NAME = Booking_data,
	FILENAME = 'D:\Study\SQL\Booking.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB
)

LOG ON
(
	NAME = 'Booking_log',
	FILENAME = 'D:\Study\SQL\Booking.ldf',
	SIZE = 5MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5%
)