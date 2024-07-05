CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
	SELECT b.BookID, b.Title, bo.FirstName, bo.LastName, l.DateBorrowed
	FROM Books b
	JOIN Loans l
	ON b.BookID = l.BookID
	JOIN Borrowers bo
	ON bo.BorrowerID = l.BorrowerID
	WHERE l.DateBorrowed BETWEEN @StartDate AND @EndDate
	ORDER BY l.DateBorrowed;
END
GO