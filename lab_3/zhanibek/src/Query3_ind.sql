SELECT
    FullName,
    Address,
    Gender
FROM
    Employees
WHERE
    Gender = N'Мужской' 
    AND
    Address = N'ул. Степная 5'; 