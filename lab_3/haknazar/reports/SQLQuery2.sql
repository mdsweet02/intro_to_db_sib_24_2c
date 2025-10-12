SELECT 
    d.DepartmentName AS �������������,
    COUNT(e.EmployeeID) AS ����������_�����������,
    AVG(DATEDIFF(YEAR, e.BirthDate, GETDATE())) AS �������_�������
FROM 
    Departments d
LEFT JOIN 
    Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY 
    d.DepartmentID, d.DepartmentName
ORDER BY 
    ����������_����������� DESC;