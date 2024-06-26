WITH LoanDays AS (
    SELECT 
        DATENAME(WEEKDAY, DateBorrowed) AS DayOfWeek,
        COUNT(*) AS LoanCount
    FROM 
        Loans
    GROUP BY 
        DATENAME(WEEKDAY, DateBorrowed)
),
TotalLoans AS (
    SELECT 
        SUM(LoanCount) AS TotalLoanCount
    FROM 
        LoanDays
)
SELECT 
    ld.DayOfWeek,
    ld.LoanCount,
    CAST((ld.LoanCount * 100.0 / tl.TotalLoanCount) AS DECIMAL(5, 2)) AS LoanPercentage
FROM 
    LoanDays ld
CROSS JOIN 
    TotalLoans tl
ORDER BY 
    LoanPercentage DESC;