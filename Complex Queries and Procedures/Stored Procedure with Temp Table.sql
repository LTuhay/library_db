DROP PROCEDURE IF EXISTS sp_BorrowersWithOverdueBooks;
GO

CREATE PROCEDURE sp_BorrowersWithOverdueBooks
AS
BEGIN

    CREATE TABLE #OverdueBorrowers (
        BorrowerID INT,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50)
    );

    INSERT INTO #OverdueBorrowers (BorrowerID, FirstName, LastName)
    SELECT br.BorrowerID, br.FirstName, br.LastName
    FROM Loans l
    JOIN Borrowers br ON l.BorrowerID = br.BorrowerID
    WHERE l.DateReturned IS NULL AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 0;

    SELECT DISTINCT ob.BorrowerID, ob.FirstName, ob.LastName, b.BookID, b.Title, l.DateBorrowed, l.DueDate, DATEDIFF(DAY, l.DueDate, GETDATE()) AS OverdueDays
    FROM #OverdueBorrowers ob
    JOIN Loans l ON ob.BorrowerID = l.BorrowerID
    JOIN Books b ON l.BookID = b.BookID
    WHERE l.DateReturned IS NULL AND DATEDIFF(DAY, l.DueDate, GETDATE()) > 0;

    DROP TABLE #OverdueBorrowers;
END
GO
