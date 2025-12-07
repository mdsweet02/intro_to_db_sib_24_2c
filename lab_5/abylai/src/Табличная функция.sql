CREATE FUNCTION dbo.FindDisciplines
(
    @Search NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT KodPredmeta, Nazvanie
    FROM dbo.Discipliny
    WHERE Nazvanie LIKE '%' + @Search + '%'
);
GO
