CREATE FUNCTION dbo.GetStudentName
(
    @Zach NVARCHAR(20)
)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @Result NVARCHAR(200);

    SELECT @Result = FIO
    FROM dbo.Studenty
    WHERE ZachetnayaKnyzhka = @Zach;

    RETURN @Result;
END;
GO
