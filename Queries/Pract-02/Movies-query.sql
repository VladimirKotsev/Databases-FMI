USE movies

--1. Напишете заявка, която извежда имената на актьорите мъже, участвали във филма The Usual Suspects.
SELECT MOVIESTAR.NAME
  FROM STARSIN, MOVIE, MOVIESTAR
 WHERE MOVIESTAR.GENDER = 'M' AND
	   MOVIE.TITLE = 'The Usual Suspects' AND
	   MOVIE.TITLE = STARSIN.MOVIETITLE AND
	   MOVIESTAR.NAME = STARSIN.STARNAME;

--2. Напишете заявка, която извежда имената на актьорите, участвали във филми от 1995, продуцирани от студио MGM.
SELECT MOVIESTAR.NAME AS name
  FROM STARSIN, MOVIE, MOVIESTAR
 WHERE MOVIE.STUDIONAME = 'MGM' AND
  	   STARSIN.MOVIETITLE = MOVIE.TITLE AND
	   STARSIN.STARNAME = MOVIESTAR.NAME AND
	   MOVIE.YEAR = 1995

--3. Напишете заявка, която извежда имената на продуцентите, които са продуцирали филми на студио MGM.
SELECT DISTINCT MOVIEEXEC.NAME 
FROM MOVIEEXEC, MOVIE
WHERE MOVIE.STUDIONAME = 'MGM' AND
	  MOVIE.PRODUCERC# = MOVIEEXEC.CERT#

--4. Напишете заявка, която извежда имената на всички филми с дължина, по-голяма от дължината на филма Star Wars.
SELECT MOVIE.TITLE 
  FROM MOVIE
 WHERE MOVIE.LENGTH > (SELECT MOVIE.LENGTH FROM MOVIE WHERE MOVIE.TITLE='Star Wars')

--5. Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT MOVIEEXEC.NAME 
  FROM MOVIEEXEC
 WHERE MOVIEEXEC.NETWORTH > (SELECT MOVIEEXEC.NETWORTH FROM MOVIEEXEC WHERE MOVIEEXEC.NAME = 'Stephen Spielberg')