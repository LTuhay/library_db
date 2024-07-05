
CREATE INDEX idx_books_title ON Books (Title);
CREATE INDEX idx_books_author ON Books (Author);
CREATE INDEX idx_books_isbn ON Books (ISBN);
CREATE INDEX idx_books_genre ON Books (Genre);
CREATE INDEX idx_books_currentstatus ON Books (CurrentStatus);
CREATE INDEX idx_books_publisheddate ON Books (PublishedDate);


CREATE INDEX idx_borrowers_lastname_firstname ON Borrowers (LastName, FirstName); 
CREATE INDEX idx_borrowers_email_partial ON Borrowers (Email);  
CREATE INDEX idx_borrowers_dateofbirth ON Borrowers (DateOfBirth);
CREATE INDEX idx_borrowers_membershipdate ON Borrowers (MembershipDate);


CREATE INDEX idx_loans_dateborrowed ON Loans (DateBorrowed);
CREATE INDEX idx_loans_duedate ON Loans (DueDate);
CREATE INDEX idx_loans_datereturned ON Loans (DateReturned);
CREATE INDEX idx_loans_bookid_borrowerid ON Loans (BookID, BorrowerID);
CREATE INDEX idx_loans_borrowerid_bookid ON Loans (BorrowerID, BookID);

CREATE INDEX idx_auditlog_bookid ON AuditLog (BookID);

CREATE UNIQUE INDEX pk_books ON Books (BookID);
CREATE UNIQUE INDEX pk_borrowers ON Borrowers (BorrowerID);
CREATE UNIQUE INDEX pk_loans ON Loans (LoanID);

CREATE INDEX idx_loans_borrowerid_dateborrowed_datereturned ON Loans (BorrowerID, DateBorrowed, DateReturned);
CREATE INDEX idx_loans_loanid_duedate_datereturned ON Loans (LoanID, DueDate, DateReturned);
CREATE INDEX idx_loans_duedate_datereturned ON Loans (DueDate, DateReturned);