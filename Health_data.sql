SELECT * FROM life_expectancy.healthdata;

-- I want to be able to see all table of all countires that have a stats of 'Developing' in 2014
SELECT * FROM life_expectancy.healthdata
WHERE year = 2014 and status = 'Developing';

-- Select all the data where infant deaths equals 64.  This should retun 
SELECT * FROM life_expectancy.healthdata
WHERE infant_deaths = 64;

SELECT * FROM life_expectancy.healthdata
WHERE country = 'Botswana';

-- Catergorise Coutries by first letter
SELECT country, 
CASE
WHEN country LIKE 'a%' THEN 'A'
WHEN country LIKE '%b%' THEN 'B'
ELSE 'Other Countries'
END AS 'Country 1st Letter' 
FROM life_expectancy.healthdata;

-- Find the Average Life Expectancy by  For Developed Countries and order from largest to smallest
select country, AVG(life_expectancy) AS ' Average Life Expectancy'
FROM life_expectancy.healthdata
WHERE status = 'Developed'
GROUP BY country
ORDER BY 2 desc; 
-- 2 means order based on the 2nd column.  Ify ou had used 1 it would order baed on the 1st column

-- Find the Average Life Expectancy by  For Developing Countries and order from smallest to largest
select country, AVG(life_expectancy) AS ' Average Life Expectancy'
FROM life_expectancy.healthdata
WHERE status = 'Developing'
GROUP BY country
ORDER BY 2 asc; 
-- 2 means order based on the 2nd column.  Ify ou had used 1 it would order baed on the 1st column

-- Find the total amount by customer and order from largest to smallest
select life_expectancy, SUM(amount) AS ' total amount spent by customer'
FROM classicmodels.payments
GROUP BY country
ORDER BY 2 ASC; -- 2 means order based on the 2nd column.  Ify ou had used 1 it would order baed on the 1st column

-- What is the total GDP of Afganistan from 2000 - 2015
select country, SUM(GDP) AS ' Total GDP'
FROM life_expectancy.healthdata
WHERE country = 'Afghanistan'
GROUP BY country
ORDER BY 2 asc; 
