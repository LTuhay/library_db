DROP FUNCTION IF EXISTS fn_BookBorrowingFrequency;
GO

CREATE FUNCTION fn_BookBorrowingFrequency (@BookId INT)
RETURNS INT
AS
BEGIN

	DECLARE @BorrowingFrequency INT;

	SELECT @BorrowingFrequency = COUNT(*)
	FROM Loans
	WHERE BookID = @BookId

	RETURN @BorrowingFrequency;

END
GO