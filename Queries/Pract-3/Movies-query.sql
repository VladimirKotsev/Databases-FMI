USE movies

--1. Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетни активи над 10 милиона.
SELECT MOVIESTAR.NAME
  FROM MOVIESTAR
 WHERE MOVIESTAR.NAME IN (SELECT MOVIEEXEC.NAME FROM MOVIEEXEC WHERE MOVIEEXEC.NETWORTH > 10000000) AND
	   MOVIESTAR.GENDER = 'F'

--2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти.
SELECT MOVIESTAR.NAME
  FROM MOVIESTAR
 WHERE MOVIESTAR.NAME NOT IN (SELECT MOVIEEXEC.NAME FROM MOVIEEXEC WHERE MOVIEEXEC.NETWORTH > 10000000)

--3. Напишете заявка, която извежда имената на всички филми с дължина, по-голяма от дължината на филма ‘Star Wars’
SELECT MOVIE.TITLE
  FROM MOVIE
 WHERE MOVIE.LENGTH > (SELECT MOVIE.LENGTH FROM MOVIE WHERE MOVIE.TITLE = 'Star Wars')

--4. Напишете заявка, която извежда имената на продуцентите и имената на филмите за всички филми, които са продуцирани от продуценти с нетни активи по-големи от тези на ‘Merv Griffin’
SELECT MOVIEEXEC.NAME AS ProducerName, MOVIE.TITLE AS MovieName
  FROM MOVIEEXEC, MOVIE
 WHERE MOVIEEXEC.CERT# = MOVIE.PRODUCERC# AND
	   MOVIEEXEC.NETWORTH > (SELECT MOVIEEXEC.NETWORTH
							   FROM MOVIEEXEC
							  WHERE MOVIEEXEC.NAME = 'Merv Griffin')