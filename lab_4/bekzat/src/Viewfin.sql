CREATE VIEW dbo.vw_edк
AS select zu.[ФИО] AS Клиент, c.[Дата] AS Дата, c.[Сумма] AS Оплата
From dbo.Оплата c
LEFT JOIN dbo.Клиенты zu
       ON zu.[ИИН клиента] = c.[ИИН клиента]
Where day(c.[Дата])=1;

select * from dbo.vw_edк

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

CREATE VIEW dbo.vw_Marks
AS select Наименование, [Тип ТС]
From dbo.[Марка ТС]

Where ([Тип ТС])='Мотоцикл';

select * from dbo.vw_Mark

CREATE VIEW dbo.vw_raby
AS select c.[ФИО] AS Работник, zu.[Наименование] AS Подразделение
From dbo.Работники c
LEFT JOIN dbo.Подразделения zu
       ON zu.[Код работника] = c.[Код работника]

 select * from dbo.vw_raby