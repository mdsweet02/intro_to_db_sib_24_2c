DECLARE @j   INT = 1;   -- код вида контроля
DECLARE @day INT = 1;  -- нужное число месяца

SELECT DISTINCT
    st.KodSotrudnika,
    st.FIO
FROM dbo.Ekzamenachionnaya_vedomost ev
JOIN dbo.Sotrudniki st
      ON st.KodSotrudnika = ev.KodPrepodavatelja
WHERE ev.KodVidyKontrolya = @j
  AND DAY(ev.DataVedomosti) = @day;
