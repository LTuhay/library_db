DECLARE @Month INT = 6; 
DECLARE @Year INT = 2023;
SELECT 
    b.Genre, 
    COUNT(l.LoanID) AS LoansCount,
    RANK() OVER (ORDER BY COUNT(l.LoanID) DESC) AS GenreRank
FROM 
    Books b
JOIN 
    Loans l ON b.BookID = l.BookID
WHERE 
    MONTH(l.DateBorrowed) = @Month
    AND YEAR(l.DateBorrowed) = @Year
GROUP BY 
    b.Genre
ORDER BY 
    LoansCount DESC;
