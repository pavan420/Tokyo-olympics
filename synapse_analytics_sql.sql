SELECT TOP (100) [PersonName]
,[Country]
,[Discipline]
 FROM [OlympicDB].[dbo].[athletes]

 --Total meadals (Gold, Silver, Bronze) won by each country
 SELECT 
    TeamCountry,
    SUM(Gold) AS TotalGold,
    SUM(Silver) AS TotalSilver,
    SUM(Bronze) AS TotalBronze,
    SUM(Total) AS GrandTotalMedals
FROM medals
GROUP BY TeamCountry
ORDER BY GrandTotalMedals DESC;

--Top 5 countries by total medals
SELECT TOP 5 
    TeamCountry,
    Total
FROM medals
ORDER BY Total DESC;

--Count of teams per country
SELECT 
    Country,
    COUNT(DISTINCT TeamName) AS TeamCount
FROM teams
GROUP BY Country
ORDER BY TeamCount DESC;

--Countries with the highest number of gold medals
SELECT 
    TeamCountry,
    Gold
FROM medals
ORDER BY Gold DESC;

--List of athlete-coach pairs for the same discipline
SELECT 
    a.PersonName AS AthleteName,
    c.Name AS CoachName,
    a.Discipline
FROM athletes a
JOIN coaches c
ON a.Discipline = c.Discipline;
