USE pc

--1. Напишете заявка, която извежда производителя и честотата на лаптопите с размер на диска поне 9 GB.
SELECT product.maker, laptop.speed
  FROM product, laptop
 WHERE product.type = 'Laptop' AND
	   laptop.hd >= 9 AND
	   product.model = laptop.model

--2. Напишете заявка, която извежда модел и цена на продуктите, произведени от производител с име B.
SELECT DISTINCT product.model, laptop.price
  FROM product, laptop
 WHERE product.maker = 'B' AND
	   product.model = laptop.model
 UNION
SELECT DISTINCT product.model, pc.price
  FROM product, pc
 WHERE product.maker = 'B' AND
	   product.model = pc.model

--3. Напишете заявка, която извежда производителите, които произвеждат лаптопи, но не произвеждат персонални компютри.
SELECT maker
  FROM product
 WHERE product.type = 'Laptop'
EXCEPT
SELECT maker
  FROM product
 WHERE product.type = 'PC'

--4. Напишете заявка, която извежда размерите на тези дискове, които се предлагат в поне два различни персонални компютъра (два компютъра с различен код).
SELECT DISTINCT PC1.hd
  FROM pc AS PC1, pc AS PC2
 WHERE PC1.code != PC2.code AND
	   PC1.hd = PC2.hd

--5. Напишете заявка, която извежда двойките модели на персонални компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i).
SELECT DISTINCT PC1.model, PC2.model
  FROM pc AS PC1, pc AS PC2
 WHERE PC1.speed = PC2.speed AND
	   PC1.ram = PC2.ram AND
	   PC1.model != PC2.model
EXCEPT
SELECT PC1.model, PC2.model
  FROM pc AS PC1, pc AS PC2
 WHERE PC1.speed = PC2.speed AND 
	   PC1.ram = PC2.ram AND 
	   PC1.model != PC2.model AND 
	   PC1.model > PC2.model

--6. Напишете заявка, която извежда производителите на поне два различни персонални компютъра с честота поне 400.
SELECT TOP 2 product.maker
  FROM product, pc
 WHERE pc.speed >= 400 AND
	   pc.model = product.model
