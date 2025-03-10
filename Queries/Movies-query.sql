USE movies;


--1. Напишете заявка, която извежда името на продуцента и имената на филмите, продуцирани от продуцента на филма ‘Star Wars’.
SELECT MOVIE.TITLE, MOVIEEXEC.NAME
FROM MOVIE JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE MOVIEEXEC.CERT# = (SELECT TOP 1 MOVIE.PRODUCERC# FROM MOVIE WHERE MOVIE.TITLE = 'Star Wars')

--2. Напишете заявка, която извежда имената на продуцентите на филмите, в които е участвал ‘Harrison Ford’.
SELECT DISTINCT MOVIEEXEC.NAME
  FROM MOVIEEXEC 
  JOIN MOVIE ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
  JOIN STARSIN ON MOVIE.TITLE = STARSIN.MOVIETITLE
 WHERE STARSIN.STARNAME = 'Harrison Ford'

--3. Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
  SELECT DISTINCT MOVIE.STUDIONAME, STARSIN.STARNAME
    FROM STARSIN
    JOIN MOVIE ON MOVIE.TITLE = STARSIN.MOVIETITLE
ORDER BY MOVIE.STUDIONAME ASC,
		 STARSIN.STARNAME ASC

--4. Напишете заявка, която извежда имената на актьорите, участвали във филми на продуценти с най-големи нетни активи.
SELECT *
FROM MOVIEEXEC

SELECT STARSIN.STARNAME, MOVIEEXEC.NETWORTH, STARSIN.MOVIETITLE
  FROM STARSIN
  JOIN MOVIE ON MOVIE.TITLE = STARSIN.MOVIETITLE
  JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
 WHERE MOVIEEXEC.CERT# = (SELECT TOP 1 MOVIEEXEC.CERT#
						    FROM MOVIEEXEC
						ORDER BY MOVIEEXEC.NETWORTH DESC)

--5. Напишете заявка, която извежда имената на актьорите, които не са участвали в нито един филм.
   SELECT MOVIESTAR.NAME
	 FROM MOVIESTAR
LEFT JOIN STARSIN ON MOVIESTAR.NAME = STARSIN.STARNAME
    WHERE STARSIN.MOVIETITLE IS NULL
