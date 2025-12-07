SELECT DISTINCT
    s.ZachetnayaKnyzhka,
    s.FIO,
    s.KodGruppy
FROM dbo.rezultat_o ro
JOIN dbo.Ochenki o
      ON o.KodOtsenki = ro.KodOtsenki
JOIN dbo.Studenty s
      ON s.ZachetnayaKnyzhka = ro.KodStudenta
WHERE o.PriznakTipa = N'неудовлетворительная';
