use ships

--1. Напишете заявка, която извежда името на корабите с водоизместимост над 50000.
SELECT SHIPS.NAME
  FROM SHIPS, CLASSES
 WHERE SHIPS.CLASS = CLASSES.CLASS AND
	   CLASSES.DISPLACEMENT > 50000

--2. Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на всички кораби, участвали в битката при Guadalcanal.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
  FROM SHIPS, CLASSES, OUTCOMES
 WHERE OUTCOMES.BATTLE = 'Guadalcanal' AND
	   OUTCOMES.SHIP = SHIPS.NAME AND
	   SHIPS.CLASS = CLASSES.CLASS

--3. Напишете заявка, която извежда имената на тези държави, които имат както бойни кораби, така и бойни крайцери.
SELECT * FROM CLASSES

SELECT COUNTRY
  FROM CLASSES, SHIPS
 WHERE CLASSES.TYPE = 'bc' AND
	   CLASSES.CLASS = SHIPS.CLASS
INTERSECT
SELECT COUNTRY
  FROM CLASSES, SHIPS
 WHERE CLASSES.TYPE = 'bb' AND
	   CLASSES.CLASS = SHIPS.CLASS

 --4. Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по-късно са участвали в друга битка.
SELECT * FROM OUTCOMES
SELECT * FROM SHIPS

SELECT SHIPS.NAME
  FROM OUTCOMES, SHIPS
 WHERE OUTCOMES.SHIP = SHIPS.NAME AND
	   OUTCOMES.RESULT = 'damaged'
INTERSECT
SELECT SHIPS.NAME
  FROM OUTCOMES, SHIPS
 WHERE OUTCOMES.SHIP = SHIPS.NAME AND
	   OUTCOMES.RESULT = 'ok'