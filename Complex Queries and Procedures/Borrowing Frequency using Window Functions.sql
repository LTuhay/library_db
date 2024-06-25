SELECT 
    br.BorrowerID, 
    br.FirstName, 
    br.LastName, 
    COUNT(l.LoanID) AS BorrowingFrequency,
    RANK() OVER (ORDER BY COUNT(l.LoanID) DESC) AS BorrowingRank
FROM 
    Borrowers br
JOIN 
    Loans l ON br.BorrowerID = l.BorrowerID
GROUP BY 
    br.BorrowerID, 
    br.FirstName, 
    br.LastName
ORDER BY 
    BorrowingFrequency DESC;
