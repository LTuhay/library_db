declare @BorrowerID int;
SET @BorrowerID = 1;

SELECT
	b.BookID, b.Title, b.Author, b.CurrentStatus, l.DateBorrowed, l.DueDate, l.DateReturned
FROM
	BOOKS b JOIN LOANS l ON b.BookID= l.BookID
WHERE
	l.BorrowerID = @BorrowerID;