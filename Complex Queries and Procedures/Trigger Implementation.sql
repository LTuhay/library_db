IF NOT EXISTS (
    SELECT * 
    FROM sys.tables 
    WHERE name = 'AuditLog' 
    AND type = 'U'
)
BEGIN
    CREATE TABLE AuditLog (
        AuditID INT IDENTITY(1,1) PRIMARY KEY,
        BookID INT,
        StatusChange NVARCHAR(50),
        ChangeDate DATETIME DEFAULT GETDATE()
    );
END
GO


IF NOT EXISTS (
    SELECT * 
    FROM sys.triggers 
    WHERE name = 'trg_BookStatusChange'
)
BEGIN
    EXEC('CREATE TRIGGER trg_BookStatusChange
    ON Books
    AFTER UPDATE
    AS
    BEGIN
        IF UPDATE(CurrentStatus)
        BEGIN
            DECLARE @BookID INT, @OldStatus NVARCHAR(50), @NewStatus NVARCHAR(50);
            
            SELECT 
                @BookID = inserted.BookID, 
                @OldStatus = deleted.CurrentStatus, 
                @NewStatus = inserted.CurrentStatus
            FROM 
                inserted
            JOIN 
                deleted ON inserted.BookID = deleted.BookID;
            
            IF @OldStatus <> @NewStatus
            BEGIN
                INSERT INTO AuditLog (BookID, StatusChange, ChangeDate)
                VALUES (@BookID, CONCAT(''Changed from '', @OldStatus, '' to '', @NewStatus), GETDATE());
            END
        END
    END')
END
GO