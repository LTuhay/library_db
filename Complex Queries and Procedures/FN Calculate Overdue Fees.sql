DROP FUNCTION IF EXISTS dbo.fn_CalculateOverdueFees;
GO

CREATE FUNCTION fn_CalculateOverdueFees (@LoanID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @DueDate DATE, @DateReturned DATE, @OverdueDays INT, @OverdueFee DECIMAL(10, 2);

    SELECT @DueDate = DueDate, @DateReturned = DateReturned
    FROM Loans
    WHERE LoanID = @LoanID;

    SET @DateReturned = ISNULL(@DateReturned, GETDATE());
    SET @OverdueDays = DATEDIFF(DAY, @DueDate, @DateReturned);

    IF @OverdueDays <= 30
        SET @OverdueFee = @OverdueDays * 1;
    ELSE
        SET @OverdueFee = (30 * 1) + ((@OverdueDays - 30) * 2);

    IF @OverdueDays <= 0
        SET @OverdueFee = 0;

    RETURN @OverdueFee;
END
GO
