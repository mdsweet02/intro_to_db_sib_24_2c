SELECT
    FullName,
    BirthDate,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS CurrentAge 
FROM
    Employees
WHERE
    DATEDIFF(YEAR, BirthDate, GETDATE()) < 18 
    OR
    DATEDIFF(YEAR, BirthDate, GETDATE()) > 60; 