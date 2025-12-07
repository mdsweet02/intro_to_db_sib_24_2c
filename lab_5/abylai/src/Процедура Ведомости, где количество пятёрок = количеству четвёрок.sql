CREATE PROCEDURE dbo.GetEqualMarksVedomosti
AS
BEGIN
    SELECT *
    FROM dbo.ekzamenacionnaya_vedomost
    WHERE KolvoPyaterok = KolvoChetvyorek;
END;
GO