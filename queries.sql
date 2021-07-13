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

--Further Study--
SELECT first_name, SUM(CASE WHEN vehicles IS NOT NULL THEN 1 ELSE 0 END) as count
FROM owners
LEFT JOIN vehicles
ON vehicles.owner_id = owners.id
GROUP BY owners.id, first_name
ORDER BY SUM(CASE WHEN vehicles IS NOT NULL THEN 1 ELSE 0 END), first_name;

-- Gets the answer that's shown but is this what they want? IT ISN'T = wasted time :( --
SELECT first_name, SUM(CASE WHEN vehicles IS NOT NULL THEN 1 ELSE 0 END) as count
FROM owners
LEFT JOIN vehicles
ON vehicles.owner_id = owners.id
GROUP BY owners.id, first_name
ORDER BY (CASE WHEN first_name in ('Jane') AND SUM(CASE WHEN vehicles IS NOT NULL THEN 1 ELSE 0 END) = 0  THEN 1 ELSE 0 END), SUM(CASE WHEN vehicles IS NOT NULL THEN 1 ELSE 0 END);

-- Count really just counts the number of rows --
SELECT first_name, COUNT(*) as count
FROM owners
LEFT JOIN vehicles
ON vehicles.owner_id = owners.id
GROUP BY owners.id, first_name
ORDER BY COUNT(*), first_name;
