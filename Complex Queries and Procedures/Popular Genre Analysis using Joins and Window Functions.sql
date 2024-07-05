DECLARE @Month INT = 6; 
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
GROUP BY 
    b.Genre
ORDER BY 
    LoansCount DESC;
