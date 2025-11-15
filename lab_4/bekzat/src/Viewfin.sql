CREATE VIEW dbo.vw_Оплата__за_первое_число 
AS select Дата, Сумма
From dbo.Оплата
Where day(Дата)=1;

select * from dbo.vw_Оплата__за_первое_число

CREATE VIEW dbo.vw_Первый_заказ
AS
SELECT 
    z.*,
    u.[Наименование] AS Наименование_услуги,
    s.[Наименование] AS Наименование_детали
FROM dbo.Заказ z
LEFT JOIN dbo.Заказ_услуги zu
       ON zu.[№ заказа] = z.[№ заказа]
LEFT JOIN dbo.Услуги u
       ON u.[код услуги] = zu.[код услуги]
LEFT JOIN dbo.Заказ_материалы zm
       ON zm.[№ заказа] = z.[№ заказа]
LEFT JOIN dbo.Склад s
       ON s.[код детали/агрегата] = zm.[код детали/агрегата]
WHERE z.[№ заказа] = 1;

select * from dbo.vw_Первый_заказ

CREATE VIEW dbo.vw_Подразделения_с_заказом_этого_года
AS SELECT  p.[Наименование] AS Наименование_подразделения,
       z.[Дата] AS Дата_заказа
FROM dbo.Подразделения p
JOIN dbo.Работники r
       ON r.[Код работника] = p.[Код работника]
JOIN dbo.Заказ_услуги zu
       ON zu.[Код работника] = r.[Код работника]   
JOIN dbo.Заказ z
       ON z.[№ заказа] = zu.[№ заказа]
WHERE YEAR(z.[Дата]) = 2025;

select * from dbo.vw_Подразделения_с_заказом_этого_года


