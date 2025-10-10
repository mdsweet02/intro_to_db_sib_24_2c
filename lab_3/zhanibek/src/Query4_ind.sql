SELECT DISTINCT
    pc.CategoryName 
FROM
    Employees AS e
JOIN
    Positions AS p ON e.PositionID = p.PositionID
JOIN
    PositionCategories AS pc ON p.CategoryID = pc.CategoryID 
WHERE
    e.DepartmentID = 20;