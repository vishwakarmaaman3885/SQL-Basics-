                         --  Aggregation in SQL --
                         --  Assignment Solution --


-- Use “ ” Database to solve the following questions 
-- (Hint : World Database is inbuilt in SQL Workbench so use code “use world;” to make use of the database)

show databases;


SHOW TABLES;

select *
from city;

select *
from country;

select *
from countrylanguage;


-- Question 1 : Count how many cities are there in each country?
-- Solution-


SELECT co.Name AS Country,
COUNT(ci.ID) AS CityCount
FROM country as  co
LEFT JOIN city  as ci
ON co.Code = ci.CountryCode
GROUP BY co.Name
ORDER BY CityCount DESC;


-- Question 2 : Display all continents having more than 30 countries.
-- Solution

SELECT Continent,
COUNT(*) AS CountryCount
FROM country
GROUP BY Continent
HAVING COUNT(*) > 30
ORDER BY CountryCount DESC;



 -- Question 3 : List regions whose total population exceeds 200 million.
--  Solution-

SELECT Region,
SUM(Population) AS TotalPopulation
FROM country
GROUP BY Region
HAVING SUM(Population) > 200000000
ORDER BY TotalPopulation DESC;

-- Question 4 : Find the top 5 continents by average GNP per country.
-- Solution -

SELECT Continent,
avg(GNP) AS AvgGNPPerCountry
FROM country
GROUP BY Continent
ORDER BY AvgGNPPerCountry  desc
Limit 5;


-- Question 5 : Find the total number of official languages spoken in each continent.
-- Solution-

SELECT co.Continent,
COUNT(DISTINCT cl.Language) AS OfficialLanguageCount
FROM country co
JOIN countrylanguage cl
ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Continent
ORDER BY OfficialLanguageCount DESC;


-- Question 6 : Find the maximum and minimum GNP for each continent.
-- Solution-

SELECT Continent,
MAX(GNP) AS MaxGNP,
MIN(GNP) AS MinGNP
FROM country
GROUP BY Continent
ORDER BY Continent;

-- Question 7 : Find the country with the highest average city population.
-- Solution-

SELECT co.Name AS Country,
AVG(ci.Population) AS AvgCityPopulation
FROM country co
JOIN city ci
ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY AvgCityPopulation DESC
LIMIT 1;

-- Question 8 : List continents where the average city population is greater than 200,000.
-- Solution-

SELECT co.Continent,
AVG(ci.Population) AS AvgCityPopulation
FROM country co
JOIN city ci
ON co.Code = ci.CountryCode
GROUP BY co.Continent
HAVING AVG(ci.Population) > 200000
ORDER BY AvgCityPopulation DESC;


-- Question 9 : Find the total population and average life expectancy for each continent, ordered by average life 
-- expectancy descending.
-- Solution-

SELECT Continent,
SUM(Population) AS TotalPopulation,
AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
GROUP BY Continent
ORDER BY AvgLifeExpectancy DESC;


-- Question 10 : Find the top 3 continents with the highest average life expectancy, but only include those where 
-- the total population is over 200 million.
-- Solution-

SELECT Continent,
SUM(Population) AS TotalPopulation,
AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AvgLifeExpectancy DESC
LIMIT 3;






