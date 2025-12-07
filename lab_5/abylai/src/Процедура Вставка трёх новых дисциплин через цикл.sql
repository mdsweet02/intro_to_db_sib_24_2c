CREATE PROCEDURE dbo.InsertThreeDisciplines
AS
BEGIN
    DECLARE @i INT = 1;

    WHILE @i <= 3
    BEGIN
        INSERT INTO dbo.Discipliny (Nazvanie)
        VALUES (N'Новая дисциплина ' + CAST(@i AS NVARCHAR(10)));

        SET @i = @i + 1;
    END
END;
GO
