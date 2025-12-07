DECLARE @word NVARCHAR(50) = N'Математика';  -- часть названия дисциплины

SELECT
    d.KodPredmeta,
    d.Nazvanie
FROM dbo.Ekzamenachionnaya_vedomost ev          -- <<< ИМЯ ТВОЕЙ ВЕДОМОСТИ
JOIN dbo.Discipliny d
      ON d.KodPredmeta = ev.KodPredmeta
JOIN dbo.VidyKontrolya vk
      ON vk.KodVidyKontrolya = ev.KodVidyKontrolya
WHERE d.Nazvanie LIKE N'%' + @word + N'%'
GROUP BY
    d.KodPredmeta,
    d.Nazvanie
HAVING
    SUM(CASE WHEN vk.Nazvanie = N'экзамен' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN vk.Nazvanie = N'зачет'  THEN 1 ELSE 0 END) > 0;
