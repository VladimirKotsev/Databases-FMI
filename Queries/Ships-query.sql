use ships

--1. Напишете заявка, която извежда класа и страната за всички класове с помалко от 10 оръдия.
SELECT CLASSES.CLASS, CLASSES.COUNTRY
FROM CLASSES
WHERE CLASSES.NUMGUNS<10

--2. Напишете заявка, която извежда имената на корабите, пуснати на вода преди 1918. Задайте псевдоним shipName на колоната.
SELECT SHIPS.NAME AS shipName
FROM SHIPS
WHERE SHIPS.LAUNCHED<1918

--3. Напишете заявка, която извежда имената на корабите потънали в битка и имената на съответните битки.
SELECT OUTCOMES.SHIP, OUTCOMES.BATTLE
FROM OUTCOMES
WHERE OUTCOMES.RESULT='sinked'

--4. Напишете заявка, която извежда имената на корабите с име, съвпадащо с името на техния клас.
SELECT SHIPS.CLASS
FROM SHIPS
WHERE SHIPS.CLASS=SHIPS.NAME

--5. Напишете заявка, която извежда имената на корабите, които започват с буквата R.
SELECT SHIPS.NAME
FROM SHIPS
WHERE SHIPS.NAME LIKE 'R%'

--6. Напишете заявка, която извежда имената на корабите, които съдържат 2 или повече думи.
SELECT SHIPS.NAME
FROM SHIPS
WHERE SHIPS.NAME LIKE '% %'