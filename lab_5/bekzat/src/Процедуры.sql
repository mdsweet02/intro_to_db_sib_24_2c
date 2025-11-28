CREATE PROCEDURE GetWorkersBySubdivision
    @CodeSubdivision NVARCHAR(20)  
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [Код работника],
           ФИО,
           [Код подразделения],
           Должность
    FROM Работники
    WHERE [Код подразделения] = @CodeSubdivision;
END;
GO


EXEC GetWorkersBySubdivision '107l';


CREATE PROCEDURE GetPartsCost
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [Код детали/агрегата],
        Наименование,
        Цена * [Кол-во экземпляров] AS Стоимость
    FROM Склад;
END;
GO

EXEC GetPartsCost;

CREATE PROCEDURE InsertThreeSubdivisions
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 1;

    WHILE @i <= 3
    BEGIN
        INSERT INTO Подразделения (Код, Наименование, [Код работника], [Код руководителя_участка])
        VALUES (
            'NEW' + CAST(@i AS NVARCHAR(10)),                  
            'Новое подразделение ' + CAST(@i AS NVARCHAR(10)), 
            100 + @i,                                          
            200 + @i                                           
        );

        SET @i = @i + 1;
    END
END;
GO

EXEC InsertThreeSubdivisions;

CREATE PROCEDURE GetOrderBy1IIN
    @IIN NVARCHAR(20) 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [№ заказа],
        [ИИН клиента],
        [Дата],
        [Марка ТС],
        [Номер ТС],
        [Описание ТС],
        [Период выполнения заказа]
    FROM Заказ
    WHERE [ИИН клиента] = @IIN;
END;
GO


EXEC GetOrderBy1IIN '292923';

CREATE PROCEDURE GetWorkersCount
    @Total INT OUTPUT        
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @Total = COUNT(*)
    FROM Работники;
END;
GO

DECLARE @x INT;
EXEC GetWorkersCount @x OUTPUT;
SELECT @x AS Количество_Работников;

CREATE PROCEDURE GetCarBrands
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Код,
        Наименование,
        [Тип ТС]
    FROM [Марка ТС];
END;
GO

EXEC GetCarBrands;




