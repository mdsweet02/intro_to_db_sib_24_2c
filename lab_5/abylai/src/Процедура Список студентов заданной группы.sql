CREATE PROCEDURE dbo.GetStudentsByGroup
    @KodGruppy INT
AS
BEGIN
    SELECT *
    FROM dbo.Studenty
    WHERE KodGruppy = @KodGruppy;
END;
GO
