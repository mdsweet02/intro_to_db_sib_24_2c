CREATE TRIGGER trg_Update_Workers
ON Работники
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    
    INSERT INTO Лог_действий (Таблица, Действие, ДатаВремя)
    VALUES ('Работники', 'UPDATE', GETDATE());
END;
GO

UPDATE Работники
SET Должность = 'Менеджер'
WHERE [Код работника] = '527t';

SELECT * FROM Лог_действий
WHERE Таблица = 'Работники' AND Действие = 'UPDATE';


CREATE TRIGGER trg_Insert_CarBrands
ON [Марка ТС]
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;


    INSERT INTO Лог_действий (Таблица, Действие, ДатаВремя)
    VALUES ('МаркаТС', 'INSERT', GETDATE());
END;
GO

INSERT INTO [Марка ТС] (Код, Наименование, [Тип ТС])
VALUES (120, 'Toyota', 'Легковой');

CREATE TRIGGER trg_Delete_Subdivisions
ON Подразделения
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    
    INSERT INTO Лог_действий (Таблица, Действие, ДатаВремя)
    VALUES ('Подразделения', 'DELETE', GETDATE());
END;
GO

DELETE FROM Подразделения
WHERE Код = 'NEW1'

CREATE TABLE Лог_действий (
    ID INT IDENTITY PRIMARY KEY,
    Таблица NVARCHAR(100),
    Действие NVARCHAR(50),
    ДатаВремя DATETIME,
    КодРаботника INT NULL,
    ФИО NVARCHAR(200) NULL,
    КодПодразделения NVARCHAR(20) NULL,
    Должность NVARCHAR(100) NULL,
    Код INT NULL,
    Наименование NVARCHAR(200) NULL,
    ТипТС NVARCHAR(100) NULL,
    КодРуководителя_Участка INT NULL
);