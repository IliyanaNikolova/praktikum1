CREATE DATABASE Airline

use Airline

CREATE TABLE Agencies
(NAME varchar(100) PRIMARY KEY,
COUNTRY varchar(50),
CITY varchar(50),
PHONE varchar(50))

CREATE TABLE Customers
(id int PRIMARY KEY,
fname varchar(50),
lname varchar(50),
email varchar(50))

CREATE TABLE Airports
(code_airport char(3) PRIMARY KEY,
name_airport varchar(50),
country_airport varchar(50),
city_airport varchar(50))

CREATE TABLE Airplanes
(code_airplane char(3) PRIMARY KEY,
type_airplane varchar(30),
seats int,
year_airplane int)

CREATE TABLE Airlines
(code_airline char(2) PRIMARY KEY,
name_airline varchar(20),
country_airline varchar(50))

CREATE TABLE Flights
(fnumber char(10) PRIMARY KEY,
airline_operator char(2) FOREIGN KEY REFERENCES Airlines(code_airline),
dep_airport char(3) FOREIGN KEY REFERENCES Airports(code_airport),
arr_airport char(3) FOREIGN KEY REFERENCES Airports(code_airport),
flight_time time,
flight_duration int,
airplane char(3) FOREIGN KEY REFERENCES Airplanes(code_airplane))

ALTER TABLE Flights
ALTER COLUMN flight_time datetime

CREATE TABLE Bookings
(booking_code char(6) PRIMARY KEY,
agency varchar(100) FOREIGN KEY REFERENCES Agencies(NAME),
airline_code char(2) FOREIGN KEY REFERENCES Airlines(code_airline),
flight_number char(10) FOREIGN KEY REFERENCES Flights(fnumber),
customer_id int FOREIGN KEY REFERENCES Customers(id),
booking_date date,
flight_date date,
price decimal(9,2),
status int)


INSERT Agencies
VALUES ('Aerofly','Bulgaria','Sofia','02882533'),
		('Aerotravel','Bulgaria','Varna','02884233'),
		('Fly tour','Bulgaria','Sofia','02881233'),
		('Travel One','Bulgaria','Sofia','0783482233'),
		('Travel Tour','Bulgaria','Sofia','NULL'),
		('Travel Two','Bulgaria','Plovdiv','02882234')

INSERT Customers
VALUES (1,'Petar','Milenov','petter@mail.com'),
		(2,'Dimitar','Petrov','petrov@mail.com'),
		(3,'Ivan','Ivanov','ivanov@mail.com'),
		(4,'Petar','Slavov','slavov@mail.com'),
		(5,'Bogdan','Bobov','bobov@mail.com'),
		(6,'Petar','Kirov','pr_kirov@mail.com'),
		(7,'Vladimir','Petrov','vladov@mail.com')

INSERT Airports
VALUES ('AHN','Athens','Greece','Athens'),
		('BER','Berlin Metropolitan Area','Germany','Berlin'),
		('BOJ','Burgas International','Bulgaria','Burgas'),
		('BRN','Belp','Switzerland','Berne'),
		('CDG','Charles De Gaule','France','Paris'),
		('DME','Domodedovo','Russion Federation','Moscow'),
		('ESB','Esenboga International','Turkey','Ankara'),
		('FCO','Leonardo da Vinci International','Italy','Rome'),
		('FKB','Karlsruhe','Germany','Karlsruhe'),
		('GVA','Geneve-Cointrin','Switzerland','Geneve'),
		('IST','Ataturk International','Turkey','Istanbul'),
		('JFK','John F Kennedy International','United States','New York'),
		('LBG','Le Bourget','France','Paris'),
		('LHR','London Heathrow','United Kingdom','London'),
		('LIN','Linate','Italy','Milan'),
		('MUC','Franz Josef Strauss','Germany','Munich'),
		('ORD','Chicago O`Hare International','United States','Chicago'),
		('ORY','Orly','France','Paris'),
		('SOF','Sofia International','Bulgaria','Sofia'),
		('SVO','Sheremetyevo','Russion Federation','Moscow'),
		('TXL','Tegel','Germany','Berlin')

INSERT Airplanes
VALUES ('100','Fokker 100',80,1991),
		('319','Airbus A319',150,1993),
		('320','Airbus A320',280,1984),
		('321','Airbus A321',150,1989),
		('735','Boeing 737-800',90,1995),
		('738','Boeing 737-800',90,1997),
		('AT5','ATR 42-0',50,1995),
		('DH4','De Havilland DHC-8-400',70,1992)

INSERT Airlines
VALUES ('A3','Aegen Airlines','Greece'),
		('AA','American Airlines','United States'),
		('AF','Air France','France'),
		('AZ','Alitalia','Italy'),
		('BA','British Airways','United Kingdom'),
		('DL','Delta Air Lines','France'),
		('ET','Ethiopian Airlines','Ethopia'),
		('FB','Bulgaria Air','Bulgaria'),
		('LH','Laufthansa','Germany'),
		('OA','Olympic Air','Greece'),
		('SR','Swissair','Switzerland'),
		('SU','Aeroflot','Russian Federation'),
		('TK','Turkish Airlines','Turkey'),
		('U2','EasyJet','United Kingdom')

INSERT Flights
VALUES ('EZY1931','U2','LHR','SOF','10:15',90,'738'),
		('EZY1932','U2','SOF','LHR','13:05',90,'738'),
		('EZY3159','U2','LHR','SOF','10:05',90,'738'),
		('EZY3160','U2','SOF','LHR','12:45',90,'738'),
		('FB1363','SU','SOF','SVO','12:45',100,'738'),
		('FB1364','SU','SVO','SOF','10:00',120,'321'),
		('FB363','FB','SOF','SVO','15:10',110,'738'),
		('FB364','FB','SVO','SOF','21:05',120,'738'),
		('FB437','FB','SOF','MUC','9:10',129,'319'),
		('FB438','FB','MUC','SOF','12:10',90,'738'),
		('FB457','FB','SOF','CDG','9:10',100,'319'),
		('FB458','FB','ORY','SOF','12:10',100,'738'),
		('FB851','FB','SOF','LHR','13:30',100,'738'),
		('FB852','FB','LHR','SOF','16:30',100,'100'),
		('LH1426','LH','FKB','SOF','11:05',120,'738'),
		('LH1427','LH','SOF','FKB','13:45',120,'735'),
		('LH1702','LH','MUC','SOF','10:10',100,'738'),
		('LH1703','LH','SOF','MUC','13:10',100,'738'),
		('OA307','OA','AHN','SOF','9:25',40,'738'),
		('OA308','OA','SOF','AHN','10:25',40,'738'),
		('SU2060','SU','SVO','SOF','11:10',110,'738'),
		('SU2061','SU','SOF','SVO','13:00',110,'320'),
		('TK1027','TK','IST','SOF','7:00',100,'738'),
		('TK1028','TK','SOF','IST','10:00',100,'AT5'),
		('TK1037','TK','ESB','SOF','7:00',90,'738'),
		('TK1038','TK','SOF','ESB','10:00',90,'AT5')

INSERT Bookings
VALUES  ('YA298P','Travel Two','FB','TK1038',2,'2013-12-18','2013-12-25',300.00,1),
		('YB298P','Travel Tour','FB','TK1037',3,'2014-01-18','2014-02-25',400.00,0),
		('YC298P', 'Travel One', 'FB', 'TK1028', 4, '2014-11-11', '2014-11-25', 350.00, 0),
		('YD298P', 'Travel Tour', 'FB', 'TK1028', 1, '2013-11-03', '2013-12-20', 250.00, 1),
		('YE298P', 'Aerofly', 'FB', 'TK1027', 2, '2013-11-07', '2013-12-21', 150.00, 0),
		('YJ298P', 'Aerofly', 'FB', 'SU2061', 3, '2013-11-05', '2013-12-05', 500.00, 1),
		('YK298P', 'Aerofly', 'FB', 'SU2060', 1, '2014-07-07', '2014-08-08', 350.00, 0),
		('YL298P', 'Fly Tour', 'FB', 'FB851', 7, '2014-04-28', '2014-05-25', 360.00, 0),
		('YM298P', 'Aerotravel', 'FB', 'OA308', 2, '2014-06-09', '2014-07-10', 350.00, 1),
		('YN198P', 'Aerotravel', 'FB', 'OA307', 3, '2014-10-18', '2014-11-25', 450.00, 0),
		('YN268P', 'Fly Tour', 'FB', 'FB457', 2, '2014-02-08', '2014-12-21', 390.00, 0),
		('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2013-11-18', '2013-12-25', 300.00, 0),
		('YN498P', 'Aerofly', 'FB', 'LH1703', 1, '2014-01-05', '2014-02-25', 300.00, 1),
		('YN598P', 'Aerotravel', 'FB', 'FB1363', 5, '2014-03-03', '2014-06-25', 300.00, 0),
		('YN698P', 'Fly Tour', 'FB', 'FB852', 6, '2014-06-16', '2014-07-25', 330.00, 1),
		('YS298P', 'Aerofly', 'FB', 'SU2061', 4, '2014-10-04', '2014-11-15', 400.00, 0),
		('YZ298P', 'Fly Tour', 'FB', 'FB458', 1, '2014-03-15', '2014-06-25', 380.00, 1)