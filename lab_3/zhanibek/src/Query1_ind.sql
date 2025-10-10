SELECT
    p.PositionName, 
    COUNT(e.EmployeeID) AS NumberOfHires 
FROM
    Employees AS e 
JOIN
    Positions AS p ON e.PositionID = p.PositionID 
WHERE
    YEAR(e.HireDate) = YEAR(GETDATE()) 
GROUP BY
    p.PositionName 
ORDER BY
    NumberOfHires DESC; 