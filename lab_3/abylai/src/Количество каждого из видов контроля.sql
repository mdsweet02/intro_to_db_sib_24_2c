SELECT
    ev.DataVedomosti           AS DataKontrolya,
    vk.Nazvanie                AS VidKontrolya,
    COUNT(*)                   AS Kolichestvo
FROM dbo.Ekzamenachionnaya_vedomost ev   -- <<< ÈÌß ÒÂÎÅÉ ÂÅÄÎÌÎÑÒÈ
JOIN dbo.VidyKontrolya vk
      ON vk.KodVidyKontrolya = ev.KodVidyKontrolya
GROUP BY
    ev.DataVedomosti,
    vk.Nazvanie
ORDER BY
    ev.DataVedomosti,
    vk.Nazvanie;
