SELECT 
    d.DepartmentName AS Подразделение,
    COUNT(e.EmployeeID) AS Количество_сотрудников,
    AVG(DATEDIFF(YEAR, e.BirthDate, GETDATE())) AS Средний_возраст
FROM 
    Departments d
LEFT JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentID, d.DepartmentName
ORDER BY 
    Количество_сотрудников DESC;