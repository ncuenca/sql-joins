-- write your queries here
--1.1--
SELECT *
FROM owners
LEFT JOIN vehicles
ON vehicles.owner_id = owners.id;

--1.2--
SELECT first_name, COUNT(*)
FROM owners
JOIN vehicles
ON vehicles.owner_id = owners.id
GROUP BY owners.id
ORDER BY COUNT(*) DESC;

--1.3--
SELECT first_name, ROUND(AVG(price)) as average_price, COUNT(*)
FROM owners
JOIN vehicles
ON vehicles.owner_id = owners.id
GROUP BY owners.id
HAVING COUNT(*) > 1 and AVG(price) > 10000
ORDER BY first_name DESC;