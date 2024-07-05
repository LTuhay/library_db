IF NOT EXISTS (
    SELECT * 
    FROM sys.objects 
    WHERE object_id = OBJECT_ID(N'fn_BookBorrowingFrequency') 
    AND type = N'FN'
)
BEGIN
    EXEC('CREATE FUNCTION fn_BookBorrowingFrequency(@BookId INT) RETURNS INT AS BEGIN RETURN 0 END')
END
GO

ALTER FUNCTION fn_BookBorrowingFrequency
(
    @BookId INT
)
RETURNS INT
AS
BEGIN
    DECLARE @BorrowingFrequency INT;

    SELECT @BorrowingFrequency = COUNT(*)
    FROM Loans
    WHERE BookID = @BookId;

    RETURN @BorrowingFrequency;
END
GO
