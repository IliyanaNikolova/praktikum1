use Airline

--1. Напишете заявка, която извежда цялата информация за всички летища
SELECT * FROM Airports

--2. Напишете заявка, която извежда информация за тези самолети, които имат повече от 100 места.
SELECT code_airplane,type_airplane, seats,year_airplane
FROM Airplanes
WHERE seats>=100

--3. Напишете заявка, която извежда данните за резервацията направени за полет SU2061: код, дата на резержацията и цена 
SELECT booking_code, booking_date, price FROM Bookings as b
JOIN Flights as f
ON f.fnumber=b.flight_number
WHERE fnumber='SU2061'

--4. Напишете заявка, която намира e-mail адреса на клиент с име Ivan Ivanov
SELECT fname, lname, email
FROM Customers
WHERE fname='Ivan' AND lname='Ivanov'

--5. Напишете заявка, която извежда всички полети в интервалите 9:00-10:00 и 12:00-13:15.
--Резултатът да бъде сортиран по час на излитане.

SELECT fnumber, FORMAT(flight_time,'HH:mm'), airline_operator
FROM Flights 
WHERE flight_time>='9:00' AND FLIGHT_TIME<='10:00' OR flight_time>='12:00' AND flight_time<='13:15'
ORDER BY flight_time

--6. Напишете заявка, която извежда имената на всички агенции, които не са посочили телефонен номер
--или този номер се състои само от един символ.

SELECT NAME, PHONE FROM Agencies
WHERE PHONE IS NULL OR phone LIKE '_'


--7. Напишете заявка, която намира имената на всички градове, в които има както летища, така и офиси на агенции.
SELECT city FROM Agencies
INTERSECT --izpolzva se za namirane na obshti rtedove mezdu 2 zaqvki
SELECT city_airport FROM Airports

--8. Напишете заявка, която намира всички години, в които има произведени както самолети на ATR, така и на Boeing.
SELECT DISTINCT year_airplane FROM Airplanes
WHERE type_airplane LIKE '%ATR%' OR type_airplane LIKE '%Boeing%'

--Pravilen variant!!!!
SeLECT year_airplane FROM Airplanes
WHERE type_airplane LIKE '%ATR%'
INTERSECT
SELECT year_airplane FROM Airplanes
WHERE type_airplane LIKE '%Boeing%'

--9. Напишете заявка, която намира имената на всички държави,
--в които има летища, така и авиокомпании, но не и офиси на агенции.
(SELECT country_airport FROM Airports
INTERSECT
SELECT country_airline FROM Airlines)
EXCEPT--vryshta redove ot pyrvata zaqvka, koito gi nqma vyv vtorata
SELECT COUNTRY FROM Agencies



--2-ND FILE

--1. Изведете информация за всички самолети Airbus
SELECT type_airplane, seats, year_airplane FROM Airplanes
WHERE type_airplane LIKE '%Airbus%'

--2. Напишете заявка, която намира всички летища,
--чието име съдържа едновременно думите International и Vinchi
--(не непременно в този ред).

SELECT name_airport, country_airport
FROM Airports
WHERE name_airport LIKE '%International%Vinci%' OR name_airport LIKE '%Vinci%International%'


--3. Напишете заявка, която извежда без повторение имената на тези агенции,
--чиито име започват с А или S и имат резервации за полет номер TK1027.
SELECT DISTINCT NAME,flight_number FROM Agencies 
JOIN Bookings as b
ON b.agency=Agencies.NAME
WHERE flight_number='TK1027' AND (NAME LIKE 'A%' OR NAME LIKE 'S%') 

--4. Напишете заявка, която намира имената на градовете и всички летища,
--чието име се състои от точно две думи.

SELECT city_airport, name_airport FROM Airports
WHERE name_airport LIKE '% %' AND name_airport NOT LIKE '% % %'



--3RD FILE

--1. Напишете заявка, която извежда кодовете, статусите и цените на всички резервации,
--направени през зимните месеци (януари, февруари, март). Резултатът да бъде сортиран по месеци,
--а резервациите от един и същи месец подредени по цена, започвайки от най-скъпата.

SELECT MONTH(booking_date), status, price FROM Bookings
WHERE MONTH (booking_date) IN(1,2,3)
ORDER BY MONTH(booking_date), price DESC


--2. Да се изведат всички самолети, сортирани по брой места във възходящ ред,
--ако два самолета имат еднакъв брой места – да се подредят по азбучен ред на моделите си.

SELECT * FROM Airplanes
ORDER BY seats,type_airplane

--3. Да се изведе информация за всички резервации на агенция Aerofly.
--Резултатната таблица да съдържа кодовете на заявките, номерата на полетите, 
--датите на резервация и техните цени. Редовете да са подредени по месец на резервиране
--в нарастващ ред, а резервациите от един и същи месец да са сортирани по цена в намаляващ ред.

SELECT booking_code, flight_number, booking_date, price FROM Bookings
WHERE agency='Aerofly'
ORDER BY MONTH(booking_date) ASC, price DESC




--4TH FILE

--1. Да се изведат имената на всички клиенти, които са резервирали билет от българска агенция. 
--Да се изведе името и града на агенцията.

SELECT c.fname, c.lname, a.NAME, a.CITY 
FROM Customers as c
JOIN Bookings as b
ON b.customer_id=c.id
JOIN Agencies as a
ON b.agency=a.NAME
WHERE COUNTRY='Bulgaria'

--2. Да се изведат имената на авиокомпании, които имат резервации направени чрез български агенции.
SELECT DISTINCT name_airline 
FROM Airlines as a
JOIN Bookings as b
ON a.code_airline=b.airline_code
JOIN Agencies as ag
ON ag.NAME=b.agency
WHERE COUNTRY='Bulgaria'

--3. Да се изведе информация от кое летище за кое летище има директни полети

SELECT DISTINCT a.city_airport as city_from, b.city_airport as to_city
FROM Flights as f
JOIN Airports as a
ON f.dep_airport=a.code_airport 
JOIN Airports as b
ON f.arr_airport=b.code_airport

--4. Да се изведат номерата на всички полети, за които има както потвърдени 
--така и непотвърдени резервации.

SELECT flight_number from Bookings
WHERE status=1
INTERSECT
SELECT flight_number from Bookings
WHERE status=0

--5. Напишете заявка, която за всеки полет извежда кодовете на началното и крайното летище,
--часа на излитане и броя места в самолета.

SELECT dep_airport, arr_airport,FORMAT(flight_time,'HH:mm'), seats FROM Flights as f
JOIN Airplanes AS a
ON f.airplane=a.code_airplane

--6. Напишете заявка, която извежда всички часове, в които излита самолет на Airbus
SELECT type_airplane,FORMAT(flight_time,'HH:mm') FROM Flights as f
JOIN Airplanes as a
ON f.airplane=a.code_airplane
WHERE type_airplane LIKE 'Airbus%'

--7. Напишете заявка, която извежда (без повторение) имената на тези клиенти, които са направили резервации през нечетна година.
--SELECT Distinct fname, lname, YEAR(booking_date)
--FROM Customers as c
--JOIN Bookings as b
--ON c.id=b.customer_id
--WHERE YEAR(booking_date) LIKE 




--5-ти Файл

--1. Напишете заявка, която намира броя извършени до момента резервации и средната цена на билет за клиент номер 1.
SELECT customer_id, COUNT(*) as cointer, FORMAT(AVG(price), '0.00') as price FROM Bookings
WHERE customer_id=1
GROUP BY customer_id

--2. Напишете заявка, която намира средната цена на час полет за всички резервации направени досега.
--За всяка резервация се смята отношението между цената и продължителността на полета, 
--след което на всички така пресметнати стойности се намира средното аритметично.
SELECT FORMAT(AVG(price/(flight_duration/60.0)), '0.00') as result FROM Flights
JOIN Bookings
ON Bookings.flight_number=Flights.fnumber

--3. Напишете заявка, която намира броя на градовете с поне едно летище.
--variant 1
SELECT COUNT(r.counter) FROM  (SELECT a.city_airport, COUNT(*)as counter FROM Airports as a
group BY city_airport
HAVING COUNT(city_airport)>=1) as r

--variant 2
SELECT COUNT(DISTINCT city_airport) as [one airport] FROM AIRPORTS

--4. Напишете заявка, която извежда броя летища във всеки отделен град.
SELECT city_airport, COUNT(*) as [count airports] FROM Airports
GROUP BY city_airport

--5. Напишете заявка, която izvezda колко резервации е направил всеки клиент за всяка година.
SELECT customer_id, YEAR(booking_date) as year, COUNT(*) FROM Bookings
GROUP BY YEAR(booking_date), customer_id

--6. Да се напише заявка, която намира средния брой места за един самолет.
SELECT AVG(seats) as [for one airplane] FROM Airplanes

--7. Да се напише заявка, която намира броя самолети на Airbus
SELECT COUNT(type_airplane) [брой самолети Airbus] FROM Airplanes
WHERE type_airplane  LIKE 'Airbus%'

--8. Да се намери броя на градовете, в които има летища.
SELECT COUNT(DISTINCT city_airport) [брой градове, в които има летища] FROM Airports

--9. Да се напише заявка, която намира броя на агенциите във всеки град.
SELECT COUNT(DISTINCT NAME), CITY FROM Agencies
GROUP BY CITY

--10. Да се напише заявка, която намира броя на авиокомпаниите във всяка държава, в която има поне две авиокомпании.
SELECT country_airline, COUNT(*) FROM Airlines
GROUP BY country_airline
HAVING COUNT(*)>=2