USE pc;

--1. Напишете заявка, която извежда средната честота на персоналните компютри.
SELECT ROUND(AVG(pc.speed), 2) AS [Avg speed]
  FROM dbo.pc

--2. Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител.
  SELECT product.maker, AVG(laptop.screen) AS [avg screen size]
	FROM laptop
	JOIN product ON product.model = laptop.model
GROUP BY product.maker

--3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.
SELECT ROUND(AVG(laptop.speed), 2) AS [avg laptop speed]
  FROM laptop
 WHERE laptop.price > 1000

--4. Напишете заявка, която извежда средната цена на персоналните компютри, произведени от производител ‘A’.
SELECT AVG(pc.price) AS [avg price]
  FROM pc
  JOIN product ON product.model = pc.model
 WHERE product.maker = 'A'

--5. Напишете заявка, която извежда средната цена на персоналните компютри и лаптопите за производител ‘B’.
   SELECT (SUM(pc.price) + SUM(laptop.price)) / COUNT(*) AS [avg price]
	 FROM pc
FULL JOIN product ON product.model = pc.model
FULL JOIN laptop ON laptop.model = product.model
	WHERE product.maker = 'B'

--6. Напишете заявка, която извежда средната цена на персоналните компютри според различните им честоти.
  SELECT pc.speed, AVG(pc.price) AS [avg price]
	FROM pc
GROUP BY pc.speed

--7. Напишете заявка, която извежда производителите, които са произвели поне 3 различни персонални компютъра (с различен код).
  SELECT product.maker, COUNT(pc.code) AS [count of pc]
	FROM pc
	JOIN product ON pc.model = product.model
GROUP BY product.maker
  HAVING COUNT(pc.code) >= 3

--8. Напишете заявка, която извежда производителите с най-висока цена на персонален компютър.
  SELECT TOP 1 product.maker, MAX(pc.price) AS [max price]
	FROM pc
	JOIN product ON pc.model = product.model
GROUP BY product.maker


--9. Напишете заявка, която извежда средната цена на персоналните компютри за всяка честота по-голяма от 800.
SELECT pc.speed, AVG(pc.price) AS [avg price]
  FROM pc
   WHERE pc.speed > 800
GROUP BY pc.speed

--10.Напишете заявка, която извежда средния размер на диска на тези персонални компютри, произведени от производители, които произвеждат и принтери.
--Резултатът да се изведе за всеки отделен производител.
  SELECT product.maker, AVG(pc.hd) AS [avg storage]
	FROM pc
	JOIN product ON pc.model = product.model
   WHERE product.maker IN (SELECT DISTINCT product.maker 
							 FROM printer 
							 JOIN product ON printer.model = product.model)
GROUP BY product.maker
