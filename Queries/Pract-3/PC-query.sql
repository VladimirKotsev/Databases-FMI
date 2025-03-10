USE pc

SELECT * FROM pc

--1. Напишете заявка, която извежда производителите на персонални компютри с честота над 500.
SELECT product.maker
  FROM product
 WHERE product.type = 'PC' AND
       product.model IN (SELECT pc.model FROM pc WHERE speed > 500)

--2. Напишете заявка, която извежда код, модел и цена на принтерите с найвисока цена.
SELECT printer.code, printer.model, printer.price
  FROM printer
 WHERE printer.price = (SELECT TOP 1 printer.price FROM printer ORDER BY printer.price DESC)

--3. Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от честотата на всички персонални компютри.
SELECT *
  FROM laptop
 WHERE laptop.speed < ALL (SELECT pc.speed FROM pc)
 
--4. Напишете заявка, която извежда модела и цената на продукта (PC, лаптоп или принтер) с най-висока цена.
SELECT TOP 1 model, price
	  FROM ((SELECT model, price  FROM pc) UNION 
		    (SELECT model, price  FROM laptop) UNION 
			(SELECT model, price  FROM printer) ) t
  ORDER BY price DESC

--5. Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.
SELECT product.maker
FROM product
WHERE product.model = (SELECT TOP 1 printer.model FROM printer WHERE printer.color='y' ORDER BY printer.price ASC)

--6. Напишете заявка, която извежда производителите на тези персонални компютри с най-малко RAM памет, които имат най-бързи процесори.
SELECT product.maker
  FROM product
 WHERE product.model IN (SELECT P.model 
						   FROM pc AS P 
						  WHERE P.speed = (SELECT TOP 1 pc.speed 
												 FROM pc 
												WHERE pc.ram= (SELECT TOP 1 pc.ram 
												 FROM pc 
											 ORDER BY pc.ram ASC) AND 
													  P.code = pc.code 
											 ORDER BY pc.ram ASC)) 

