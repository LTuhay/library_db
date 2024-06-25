WITH ActiveBorrowers AS (
    SELECT 
        BorrowerID, 
        COUNT(*) AS BorrowedBooksCount,
        SUM(CASE WHEN DateReturned IS NULL THEN 1 ELSE 0 END) AS UnreturnedBooksCount
    FROM 
        Loans
    GROUP BY 
        BorrowerID
)
SELECT 
    b.BorrowerID, 
    br.FirstName, 
    br.LastName, 
    br.Email
FROM 
    ActiveBorrowers b
JOIN 
    Borrowers br ON b.BorrowerID = br.BorrowerID
WHERE 
    b.BorrowedBooksCount >= 2 
    AND b.UnreturnedBooksCount > 0;
