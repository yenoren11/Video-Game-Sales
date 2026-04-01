CREATE DATABASE video_game_sales

USE video_game_sales

SELECT * FROM vgsales_cleaned

-- Top 10 best-selling games by region
SELECT TOP 10 
	Name, Platform, Year, Genre, Publisher, NA_Sales
FROM vgsales_cleaned
ORDER BY NA_Sales DESC
GO

SELECT TOP 10 
	Name, Platform, Year, Genre, Publisher, EU_Sales
FROM vgsales_cleaned
ORDER BY EU_Sales DESC
GO

SELECT TOP 10 
	Name, Platform, Year, Genre, Publisher, JP_Sales
FROM vgsales_cleaned
ORDER BY JP_Sales DESC
GO

SELECT TOP 10 Name, Platform, Year, Genre, Publisher, Other_Sales
FROM vgsales_cleaned
ORDER BY Other_Sales DESC
GO

-- Top 10 best-selling games globally
SELECT TOP 10
	Name, SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Name
ORDER BY Total_Global_Sales DESC
GO

-- Analysis by platform, genre and publisher
SELECT TOP 10
	Platform, SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Platform
ORDER BY Total_Global_Sales DESC
GO

SELECT TOP 10
	Genre, SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Genre
ORDER BY Total_Global_Sales DESC
GO

SELECT TOP 10
	Publisher, SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC
GO
-- Regional comparison
SELECT 
	SUM(NA_Sales) AS NA,
	SUM(EU_Sales) AS EU,
	SUM(JP_Sales) AS JP,
	SUM(Other_Sales) AS Other
FROM vgsales_cleaned
GO

-- Trends by year
SELECT 
	Year,
	SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Year
ORDER BY Year
GO

-- Top games of the year
WITH RankedGames AS (
	SELECT 
		Year,
		Name,
		Global_Sales,
		ROW_NUMBER() OVER (PARTITION BY Year ORDER BY Global_Sales DESC) AS rn
	FROM vgsales_cleaned
)
SELECT 
	Year, Name, Global_Sales
FROM RankedGames
WHERE rn = 1
ORDER BY Year
GO

-- Platform and genre by region
SELECT 
	Genre,
	SUM(NA_Sales) AS NA,
	SUM(EU_Sales) AS EU,
	SUM(JP_Sales) AS JP
FROM vgsales_cleaned
GROUP BY Genre
ORDER BY NA DESC
GO

SELECT 
	Platform,
	SUM(NA_Sales) AS NA,
	SUM(EU_Sales) AS EU,
	SUM(JP_Sales) AS JP
FROM vgsales_cleaned
GROUP BY Platform
ORDER BY NA DESC
GO

-- Genre trends by year
SELECT 
	Year,
	Genre,
	SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales_cleaned
GROUP BY Year, Genre
ORDER BY Year, Total_Global_Sales DESC
GO

-- The best platform of the year
WITH PlatformRank AS (
	SELECT 
		Year, Platform,
		SUM(Global_Sales) AS Total_Global_Sales,
		ROW_NUMBER() OVER (PARTITION BY Year ORDER BY SUM(Global_Sales) DESC) AS rn
	FROM vgsales_cleaned
	GROUP BY Year, Platform
)
SELECT Year, Platform, Total_Global_Sales
FROM PlatformRank
WHERE rn = 1
ORDER BY Year
GO

-- Total sales by game
SELECT 
    Name,
    SUM(Global_Sales) AS Total_Sales,
    COUNT(DISTINCT Platform) AS Num_Platforms
FROM vgsales_cleaned
GROUP BY Name
GO

-- The best game by genre
WITH RankedGenre AS (
    SELECT 
        Genre,
        Name,
        SUM(Global_Sales) AS Sales,
        ROW_NUMBER() OVER (PARTITION BY Genre ORDER BY SUM(Global_Sales) DESC) AS rn
    FROM vgsales_cleaned
    GROUP BY Genre, Name
)
SELECT Genre, Name, Sales
FROM RankedGenre
WHERE rn = 1
GO