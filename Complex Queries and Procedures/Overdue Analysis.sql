SELECT b.BookID, b.Title, bo.BorrowerID, bo.FirstName, bo.LastName, l.DueDate, DATEDIFF(DAY, l.DueDate, GETDATE()) AS OverdueDays
FROM Loans l
JOIN Books b
ON l.BookID=b.BookID
JOIN Borrowers bo
ON l.BorrowerID = bo.BorrowerID
where l.DateReturned IS NULL
AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 30
ORDER BY 
    OverdueDays DESC;
