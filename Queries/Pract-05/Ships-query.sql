USE ships

--1. Напишете заявка, която извежда броя на класовете бойни кораби.
SELECT Count(*) AS [count of classes]
  FROM CLASSES
 WHERE CLASSES.TYPE = 'bb'

--2. Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.
  SELECT CLASSES.CLASS AS [Class], AVG(CLASSES.NUMGUNS) AS [Avg number of guns]
	FROM CLASSES
   WHERE CLASSES.TYPE = 'bb'
GROUP BY CLASSES.CLASS

--3. Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.
 SELECT AVG(CLASSES.NUMGUNS) AS [Avg number of guns]
	FROM CLASSES
   WHERE CLASSES.TYPE = 'bb'
GROUP BY CLASSES.TYPE

--4. Напишете заявка, която извежда за всеки клас първата и последната година, в която кораб от съответния клас е пуснат на вода.
  SELECT SHIPS.CLASS, MIN(SHIPS.LAUNCHED) AS [first], MAX(SHIPS.LAUNCHED) AS [last]
	FROM SHIPS
GROUP BY SHIPS.CLASS

--5. Напишете заявка, която извежда броя на корабите, потънали в битка според класа.
SELECT SHIPS.CLASS, COUNT(*) AS [sunken]
  FROM SHIPS
  JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
  WHERE OUTCOMES.RESULT = 'sunk'
GROUP BY SHIPS.CLASS

--6. Напишете заявка, която извежда броя на корабите, потънали в битка според класа, за тези класове с повече от 2 кораба.
  SELECT SHIPS.CLASS, COUNT(SHIPS.NAME) AS [sunken]
	FROM SHIPS
	JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
   WHERE OUTCOMES.RESULT = 'sunk' AND
		 SHIPS.CLASS IN (SELECT SHIPS.CLASS 
						   FROM SHIPS 
					   GROUP BY dbo.SHIPS.CLASS 
					     HAVING COUNT(dbo.SHIPS.NAME) > 2)
GROUP BY SHIPS.CLASS

--7. Напишете заявка, която извежда средния калибър на оръдията на корабите за всяка страна.
  SELECT CLASSES.COUNTRY, ROUND(AVG(dbo.CLASSES.BORE), 2) AS [Avg caliber]
	FROM CLASSES 
	JOIN dbo.SHIPS ON dbo.SHIPS.CLASS=dbo.CLASSES.CLASS
GROUP BY CLASSES.COUNTRY