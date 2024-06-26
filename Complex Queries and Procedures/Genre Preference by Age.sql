SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
        ELSE '31+'
    END AS AgeGroup,
    b.Genre, 
    COUNT(l.LoanID) AS GenreCount
FROM 
    Loans l
JOIN 
    Borrowers br ON l.BorrowerID = br.BorrowerID
JOIN 
    Books b ON l.BookID = b.BookID
GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
        WHEN DATEDIFF(YEAR, br.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
        ELSE '31+'
    END, 
    b.Genre
ORDER BY 
    AgeGroup, 
    GenreCount DESC;
