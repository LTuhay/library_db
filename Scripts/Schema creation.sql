CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Author NVARCHAR(255),
    ISBN NVARCHAR(20) UNIQUE,
    PublishedDate DATE,
    Genre NVARCHAR(100),
    ShelfLocation NVARCHAR(50),
    CurrentStatus NVARCHAR(10) CHECK (CurrentStatus IN ('Available', 'Borrowed'))
);

CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    Email NVARCHAR(255) UNIQUE,
    DateOfBirth DATE,
    MembershipDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    BookID INT,
    BorrowerID INT,
    DateBorrowed DATE,
    DueDate DATE,
    DateReturned DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);