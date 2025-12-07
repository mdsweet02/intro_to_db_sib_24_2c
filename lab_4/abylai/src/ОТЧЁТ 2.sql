DECLARE @aud NVARCHAR(20) = N'320';  -- i-я аудитория

SELECT
    rs.DataZanyatiya,
    rs.VremyaNachala,
    d.Nazvanie            AS Predmet,
    g.Nazvanie            AS Gruppa,
    s.FIO                 AS Prepodavatel
FROM dbo.Raspisanie_sessii rs
JOIN dbo.Discipliny    d  ON d.KodPredmeta      = rs.KodPredmeta
JOIN dbo.Gruppy        g  ON g.KodGruppy        = rs.KodGruppy
JOIN dbo.Sotrudniki    s  ON s.KodSotrudnika    = rs.KodPrepodavatelja
JOIN dbo.VidyKontrolya vk ON vk.KodVidyKontrolya = rs.KodVidyKontrolya
WHERE rs.Auditoriya = @aud
  AND vk.Nazvanie = N'экзамен'     -- только экзамены
ORDER BY rs.DataZanyatiya, rs.VremyaNachala;
