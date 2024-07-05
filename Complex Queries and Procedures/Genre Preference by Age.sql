WITH AgeGroups AS (
    SELECT 
        br.BorrowerID,
        b.BookID,
        b.Genre,
        CASE 
            WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            ELSE '31+'
        END AS AgeGroup
    FROM 
        Borrowers br
    JOIN 
        Loans l ON br.BorrowerID = l.BorrowerID
    JOIN 
        Books b ON l.BookID = b.BookID
)
SELECT 
    AgeGroup,
    Genre, 
    COUNT(*) AS GenreCount
FROM 
    AgeGroups
GROUP BY 
    AgeGroup, 
    Genre
HAVING 
    COUNT(*) > 0
ORDER BY 
    AgeGroup, 
    GenreCount DESC;