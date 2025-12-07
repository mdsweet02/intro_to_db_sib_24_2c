CREATE PROCEDURE dbo.GetAvgBall
    @KodGruppy INT,
    @KodPredmeta INT
AS
BEGIN
    SELECT
        AVG(
            (ev.KolvoPyaterok * 5 +
             ev.KolvoChetvyorek * 4 +
             ev.KolvoTroek * 3 +
             ev.KolvoNeattestovannyh * 2 +
             ev.KolvoNejavok * 0.0)
            /
            NULLIF(ev.KolvoPyaterok + ev.KolvoChetvyorek +
                   ev.KolvoTroek + ev.KolvoNeattestovannyh +
                   ev.KolvoNejavok, 0)
        ) AS AvgScore
    FROM dbo.ekzamenacionnaya_vedomost ev
    WHERE ev.KodGruppy = @KodGruppy
      AND ev.KodPredmeta = @KodPredmeta;
END;
GO
