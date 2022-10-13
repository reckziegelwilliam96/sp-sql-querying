-- PART 1 --
--1--
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, false);
--2--
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, true);
--3--
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, false);
--4--
SELECT * FROM products;
--5--
SELECT names FROM products;
--6--
SELECT name, price FROM products;
--7--
INSERT INTO products (name, price, can_be_returned) VALUES ('counter', 85.50, false);
--8--
SELECT * FROM products WHERE can_be_returned = 't';
--9--
SELECT * FROM products WHERE price < 44.00;
--10--
SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;
--11--
UPDATE products SET price = price - 20.00;
--12--
DELETE FROM products WHERE price < 25.00;
--13--
UPDATE products SET price = price + 20.00;
--14--
UPDATE products SET can_be_returned = 't';

--PART 2--
--1--
SELECT * FROM analytics WHERE id = 1880;
--2--
SELECT id, app_name FROM analytics WHERE last_updated = '2018-08-01';
--3--
SELECT category, COUNT(category) FROM analytics GROUP BY category;
--4--
SELECT app_name, reviews FROM analytics LIMIT 5;
--5--
SELECT app_name, reviews FROM analytics WHERE rating > 4.8 LIMIT 1;
--6--
SELECT category, AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;
--7--
SELECT app_name, MAX(price), rating FROM analytics WHERE rating < 3 GROUP BY app_name, rating, price ORDER BY price DESC LIMIT 1;
--8--
SELECT app_name, min_installs, rating 
FROM analytics 
WHERE rating > 0 AND min_installs < 50
GROUP BY app_name, rating, min_installs ORDER BY rating DESC;
--9--
SELECT app_name, reviews, rating FROM analytics WHERE rating < 3 AND reviews < 10000;
--10--
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;
--11--
SELECT app_name, MAX(rating) FROM analytics WHERE price BETWEEN 0.10 AND 1.00 AND rating > 0 GROUP BY app_name, rating ORDER BY rating DESC LIMIT 10;
--12--
SELECT app_name, MIN(last_updated) FROM analytics GROUP BY app_name, last_updated ORDER BY last_updated ASC;
--13--
SELECT app_name, MAX(price) FROM analytics GROUP BY app_name, price ORDER BY price DESC LIMIT 1;
--14--
SELECT COUNT(reviews) FROM analytics;
--15--
SELECT category, COUNT(category) FROM analytics GROUP BY category HAVING COUNT(category) > 300;
--16--
SELECT app_name, reviews, min_installs, MAX(min_installs/reviews) AS prop 
FROM analytics 
WHERE min_installs >= 100000 
GROUP BY app_name, reviews, min_installs 
ORDER BY prop DESC;