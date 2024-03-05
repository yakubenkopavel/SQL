use Booking

insert Airline values
('Tokyo Haneda International Airport', 8.9),
('Tokyo Narita International Airport', 8.78),
('Hyderabad Rajiv Gandhi International Airport', 8.73),
('Seoul Gimpo International Airport', 8.41),
('Dubai International Airport', 8.75),
('Jeju International Airport', 7.78),
('Houston George Bush Intercontinental Airport', 8.48),
('San Francisco International Airport', 8.11),
('Rio de Janeiro Santos Dumont Airport', 7.27),
('Bangkok Suvarnabhumi Airport', 8.05)
Go

use Booking
insert Aircraft values
(7286, 737, default, 'Tokyo Haneda International Airport'),
(2789, 787, 'false', 'San Francisco International Airport'),
(9782, 747, default, 'Bangkok Suvarnabhumi Airport'),
(5264, 787, default, 'Rio de Janeiro Santos Dumont Airport'),
(9878, 747, default, 'Houston George Bush Intercontinental Airport'),
(3143, 737, 'false', 'Bangkok Suvarnabhumi Airport'),
(9626, 777, default, 'Dubai International Airport'),
(1064,737, 'false', 'Hyderabad Rajiv Gandhi International Airport'),
(1526,777, default, 'Tokyo Haneda International Airport'),
(0634, 787, default, 'Jeju International Airport')
Go

use Booking 
insert Flights values
(77653, 'Dubai International Airport', 'Seoul Gimpo International Airport', '2023-10-20', '2023-10-20', 2789),
(67366, 'Bangkok Suvarnabhumi Airport', 'Tokyo Haneda International Airport', '2023-11-2', '2023-11-2', 9782),
(86265, 'Tokyo Haneda International Airport', 'San Francisco International Airport', '2023-12-1', '2023-12-2', 7286),
(29485, 'San Francisco International Airport', 'Houston George Bush Intercontinental Airport', '2023-10-28', '2023-10-28', 9878),
(92656,'Dubai International Airport', 'Bangkok Suvarnabhumi Airport','2023-11-21', '2023-11-22', 9626),
(11857, 'Bangkok Suvarnabhumi Airport', 'Tokyo Haneda International Airport', '2023-12-25', '2023-12-25',1526),
(86582, 'Jeju International Airport', 'Tokyo Haneda International Airport', '2023-12-24', '2023-12-24',  0634),
(90265, 'Seoul Gimpo International Airport', 'Bangkok Suvarnabhumi Airport', '2023-11-11', '2023-11-11', 3143),
(18657, 'Hyderabad Rajiv Gandhi International Airport', 'Tokyo Narita International Airport', '2023-11-15', '2023-11-15', 1064),
(13452, 'Rio de Janeiro Santos Dumont Airport','San Francisco International Airport','2023-11-21', '2023-11-22',  5264)
Go

use Booking 
insert Passengers values
('smernovivan@mail.ru', 'Ivan', 'Ivanov'),
('sidorovpeter@bk.ru', 'Peter', 'Sidorov'),
('krusenkoigor@mail.ru', 'Igor', 'Krusenko'),
('smithalex@gmail.com', 'Alex', 'Smith'),
('daviswilliam@mail.com', 'William', 'Davis'),
('taylorida@mail.com', 'Ida', 'Taylor'),
('wlsonclara@mail.com', 'Clara', 'Wlson'),
('andersonjames@mail.com', 'James', 'Anderson'),
('harristhomas@mail.ru', 'Thomas', 'Harris'),
('brownmike@mail.ru', 'Mike', 'Brown')
Go

use Booking
insert Reservation values
('smernovivan@mail.ru', 77653, 100),
('sidorovpeter@bk.ru', 86265, 200),
('krusenkoigor@mail.ru', 67366, 400),
('smithalex@gmail.com', 29485, 200),
('daviswilliam@mail.com',86582, 400),
('taylorida@mail.com',13452, 800),
('wlsonclara@mail.com',92656, 900),
('andersonjames@mail.com',90265, 500),
('harristhomas@mail.ru',18657, 400),
('brownmike@mail.ru',11857, 300)
Go