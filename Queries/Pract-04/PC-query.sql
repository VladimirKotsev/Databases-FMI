USE pc

--1. Напишете заявка, която извежда производител, модел и тип на продукт за тези производители, за които съответният продукт не се продава 
--(няма го в таблиците PC, Laptop или Printer)
   SELECT product.maker, product.model, product.type
     FROM product 
LEFT JOIN laptop ON laptop.model = product.model
LEFT JOIN pc ON pc.model = product.model
LEFT JOIN printer ON printer.model = product.model
	WHERE laptop.code IS NULL AND
		  pc.code IS NULL AND 
		  printer.code IS NULL

--2. Намерете всички производители, които правят както лаптопи, така и принтери.
   SELECT product.maker
     FROM product 
	 JOIN laptop ON laptop.model = product.model
INTERSECT
   SELECT product.maker
     FROM product 
	 JOIN printer ON printer.model = product.model

--3. Намерете размерите на тези твърди дискове, които се появяват в два или повече модела лаптопи.
SELECT DISTINCT L1.hd
  FROM laptop AS L1 
  JOIN laptop AS L2 ON L1.hd=L2.hd
 WHERE L1.code != L2.code

--4. Намерете всички модели персонални компютри, които нямат регистриран производител.
SELECT product.maker
  FROM pc LEFT JOIN product ON pc.model = product.model
 WHERE product.maker IS NULL