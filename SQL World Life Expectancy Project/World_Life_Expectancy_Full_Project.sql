USE world_life_expectancy;

## PART 1
# Data Cleaning

# Basic Query
SELECT * 
FROM world_life_expectancy;

# Checking for Duplicates
SELECT Country, Year, 
	CONCAT(Country, Year) AS Country_Year_Id, 
	COUNT(CONCAT(Country, Year)) AS Count_of_Country_Year_Id
FROM world_life_expectancy
GROUP BY Country, Year, 
	CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1
;

# Identifying rows with duplicates using Row_ID column
SELECT *
FROM 
	(SELECT Row_ID, 
		CONCAT(Country, Year) AS Country_Year_Id,
	ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY Row_ID) AS Row_Num
	FROM world_life_expectancy
	) AS Row_Table
WHERE Row_Num > 1
;

# Deleting the Duplicates
DELETE FROM world_life_expectancy
WHERE 
	Row_ID IN (
	SELECT Row_ID
	FROM (
		SELECT Row_ID, 
			CONCAT(Country, Year) AS Country_Year_Id,
		ROW_NUMBER() OVER(PARTITION BY CONCAT(Country, Year) ORDER BY Row_ID) AS Row_Num
		FROM world_life_expectancy
	) AS Row_Table
	WHERE Row_Num > 1
)
;

# Checking for Missing Values
SELECT * 
FROM world_life_expectancy
WHERE status = ''
;

# Populating the Missing Values
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.sTATUS = 'Developing'
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.sTATUS = 'Developed'
;

# Filling missing Life Expectancy using adjacent years
SELECT t1.Country, t1.Year, t1.`Life Expectancy`,
t2.Country, t2.Year, t2.`Life Expectancy`,
t3.Country, t3.Year, t3.`Life Expectancy`,
ROUND((t2.`Life Expectancy` + t3.`Life Expectancy`)/2,1) AS avg_Life_Expectancy
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = ''
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life Expectancy` + t3.`Life Expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;

## PART 2
# Exploratory Data Analysis (EDA)

# Exploring which countries have done really good in increasing their life expectancy
SELECT Country, 
MIN(`Life Expectancy`) AS MIN_Life_Exp, 
MAX(`Life Expectancy`) AS MAX_Life_Exp,
ROUND(MAX(`Life Expectancy`) - MIN(`Life Expectancy`),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MIN(`Life Expectancy`) <> 0 AND MAX(`Life Expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC
;

# Exploring the trend of average life expectancy over the years
SELECT Year, ROUND(AVG(`Life Expectancy`),2) AS Avg_Life_Exp
FROM world_life_expectancy
GROUP BY year
ORDER BY Year DESC
;

# Exploring the correlation between GDP and Average life expectancy by Country
SELECT Country, 
ROUND(AVG(`Life Expectancy`),1) AS Life_Exp,
ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0 AND GDP > 0
ORDER BY GDP DESC
;

# Comparing Life Expectancy for Countries with High GDP vs those with Low GDP
SELECT
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >= 1500 THEN `Life Expectancy` ELSE NULL END),2) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP < 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP < 1500 THEN `Life Expectancy` ELSE NULL END),2) Low_GDP_Life_Expectancy
FROM world_life_expectancy
;

# Exploring Life Expectancy for Developing Countries VS Developed Countries
SELECT Status, COUNT(DISTINCT Country) AS Num_of_Countries, 
ROUND(AVG(`Life Expectancy`),1) AS Average_Life_Exp
FROM world_life_expectancy
GROUP BY Status
;
