DECLARE @a INT = 1;

SELECT
    s.ZachetnayaKnyzhka,
    s.FIO,
    s.KodGruppy,
    s.KodVidaObucheniya
FROM dbo.Studenty s
WHERE s.KodVidaObucheniya = @a;
