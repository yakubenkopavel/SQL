use Kontinent
Go


--17
SELECT min(PL) AS Min_Ploshchad
from Tabl_Kontinent;
Go

--18
SELECT TOP 1 Nazvanie
FROM Tabl_Kontinent
where Kontinent IN ('Северная Америка', 'Южная Америка')
ORDER BY KolNas DESC;
Go

--19
SELECT ROUND(AVG(KolNas), 1) AS Srednee_Naselenie
FROM Tabl_Kontinent;
Go

--20
SELECT COUNT(*) AS Count_Countries_Ends_With_an
FROM Tabl_Kontinent
WHERE RIGHT(Nazvanie, 2) = 'ан' AND RIGHT(Nazvanie, 4) != 'стан';
Go

--21
SELECT COUNT(DISTINCT Kontinent) AS Count_Continents_With_Countries_Starts_With_R
FROM Tabl_Kontinent
WHERE LEFT(Nazvanie, 1) = 'Р';
Go

--22
SELECT COUNT(*) AS Count_Differences_Between_Max_and_Min_Area
FROM Tabl_Kontinent AS A, Tabl_Kontinent AS B
WHERE A.PL > B.PL;

--23
SELECT Kontinent, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent
WHERE KolNas > 100000000
GROUP BY Kontinent
ORDER BY Count_Countries;
Go

--24
SELECT LEN(Nazvanie) AS Length_of_Name, COUNT(*) AS Count_Countries
FROM Tabl_Kontinent
GROUP BY LEN(Nazvanie)
ORDER BY LEN(Nazvanie) DESC;
Go


--25
SELECT 
    'Мир' AS Kontinent,
    SUM(FLOOR(KolNas * 1.1)) AS Projected_Population
FROM Tabl_Kontinent;
Go

--26
SELECT Kontinent
FROM Tabl_Kontinent
GROUP BY Kontinent
HAVING MAX(PL) / MIN(PL) <= 10000;
Go

--27
SELECT AVG(LEN(Nazvanie)) AS Avg_Length_of_African_Country_Names
FROM Tabl_Kontinent
WHERE Kontinent = 'Африка';
Go

--28
SELECT Kontinent
FROM Tabl_Kontinent
WHERE KolNas > 1000000
GROUP BY Kontinent
HAVING AVG(KolNas / PL) > 30;
Go