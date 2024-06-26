SELECT b.Author, COUNT(l.LoanID) AS BorrowingCount
FROM Books b 
JOIN Loans l
ON b.BookID = l.BookID
GROUP BY Author
ORDER BY BorrowingCount desc;