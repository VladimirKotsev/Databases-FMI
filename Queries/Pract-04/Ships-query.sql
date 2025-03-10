USE ships

--1. Напишете заявка, която извежда цялата налична информация за всеки кораб, включително и данните за неговия клас. 
--В резултата не трябва да се включват тези класове, които нямат кораби.
   SELECT *
	 FROM SHIPS
LEFT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS

--2. Повторете горната заявка, като този път включите в резултата и класовете, които нямат кораби, но съществуват кораби със същото име като тяхното.
   SELECT *
	 FROM SHIPS
FULL JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS

--3. За всяка страна изведете имената на корабите, които никога не са участвали в битка.
   SELECT CLASSES.COUNTRY, SHIPS.NAME
	 FROM CLASSES
	 JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
LEFT JOIN OUTCOMES ON OUTCOMES.SHIP = SHIPS.NAME
	WHERE OUTCOMES.SHIP IS NULL
 ORDER BY CLASSES.COUNTRY ASC

--4. Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода през 1916, но наречете резултатната колона Ship Name.
SELECT SHIPS.NAME AS [Ship Name]
  FROM SHIPS
  JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
 WHERE CLASSES.NUMGUNS >= 7 AND
	   SHIPS.LAUNCHED = 1916

--5. Изведете имената на всички потънали в битка кораби, името и дата на провеждане на битките, в които те са потънали. Подредете резултата по име на битката.
  SELECT SHIPS.NAME, OUTCOMES.BATTLE, BATTLES.DATE
    FROM SHIPS
    JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
    JOIN BATTLES ON OUTCOMES.BATTLE = BATTLES.NAME
   WHERE OUTCOMES.RESULT = 'sunk'
ORDER BY BATTLES.NAME ASC

--6. Намерете името, водоизместимостта и годината на пускане на вода на всички кораби, които имат същото име като техния клас.
   SELECT DISTINCT  SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
	 FROM CLASSES 
FULL JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS 
	WHERE SHIPS.CLASS = SHIPS.NAME

--7. Намерете всички класове кораби, от които няма пуснат на вода нито един кораб.
   SELECT CLASSES.CLASS
	 FROM SHIPS 
FULL JOIN CLASSES ON CLASSES.CLASS = SHIPS.CLASS
	WHERE SHIPS.NAME IS NULL

--8. Изведете името, водоизместимостта и броя оръдия на корабите, участвали в битката ‘North Atlantic’, а също и резултата от битката.
   SELECT DISTINCT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
	 FROM CLASSES 
	 JOIN dbo.SHIPS ON SHIPS.CLASS = CLASSES.CLASS 
FULL JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
	WHERE OUTCOMES.BATTLE='North Atlantic'

