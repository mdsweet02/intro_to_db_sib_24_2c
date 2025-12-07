DECLARE @gr INT = 1;  -- код i-ой группы (KodGruppy)

SELECT
    rs.DataZanyatiya      AS DataEkzamena,
    rs.VremyaNachala,
    d.Nazvanie            AS Predmet,
    rs.Auditoriya,
    s.FIO                 AS Prepodavatel
FROM dbo.Raspisanie_sessii rs
JOIN dbo.Discipliny    d  ON d.KodPredmeta      = rs.KodPredmeta
JOIN dbo.Sotrudniki    s  ON s.KodSotrudnika    = rs.KodPrepodavatelja
JOIN dbo.VidyKontrolya vk ON vk.KodVidyKontrolya = rs.KodVidyKontrolya
WHERE rs.KodGruppy = @gr
  AND vk.Nazvanie = N'экзамен'
ORDER BY rs.DataZanyatiya, rs.VremyaNachala;
