SELECT 
    ev.NomVedomosti,
    ev.DataVedomosti,
    Gruppy.Nazvanie AS Группа,
    Discipliny.Nazvanie AS Дисциплина,
    ev.KolvoPyaterok,
    ev.KolvoChetvyorek,
    ev.KolvoTroek,
    ev.KolvoNejavok,
    ev.KolvoNeattestovannyh
FROM Ekzamenachionnaya_vedomost ev
JOIN Gruppy 
    ON ev.KodGruppy = Gruppy.KodGruppy
JOIN Discipliny 
    ON ev.KodPredmeta = Discipliny.KodPredmeta
WHERE ev.DataVedomosti = '2025-06-01'     -- ← i-я дата
  AND ev.KodPredmeta = 1        -- ← j-й предмет
  AND ev.KodPredmeta = 1;         -- ← k-я группа
