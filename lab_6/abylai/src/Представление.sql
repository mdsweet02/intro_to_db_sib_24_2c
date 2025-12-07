CREATE VIEW dbo.v_StudentyGruppy
AS
SELECT
    s.ZachetnayaKnyzhka,
    s.FIO,
    s.KodGruppy,
    g.Nazvanie AS NazvanieGruppy
FROM dbo.Studenty s
JOIN dbo.Gruppy  g ON g.KodGruppy = s.KodGruppy;
GO
