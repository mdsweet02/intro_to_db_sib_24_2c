-- БЛОК 1: СОЗДАНИЕ БАЗЫ ДАННЫХ
-- Лабораторная работа №2
-- Создание базы данных "Расписание_занятий" и таблиц

-- Создаем базу если нет
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Расписание_занятий')
    CREATE DATABASE Расписание_занятий
GO

USE Расписание_занятий
GO

-- =============================================
-- БЛОК 4: СОЗДАНИЕ ТАБЛИЦ БАЗЫ ДАННЫХ
-- =============================================

-- Создаем таблицы если их нет
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Кафедры' AND type = 'U')
CREATE TABLE Кафедры (
    Код_кафедры INT NOT NULL PRIMARY KEY,
    Наименование NVARCHAR(100) NOT NULL,
    Дата_создания DATE DEFAULT GETDATE()
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Преподаватели' AND type = 'U')
CREATE TABLE Преподаватели (
    Код_преподавателя INT NOT NULL PRIMARY KEY,
    ФИО NVARCHAR(100) NOT NULL,
    Должность NVARCHAR(50) DEFAULT 'Преподаватель',
    Код_кафедры INT,
    Ставка DECIMAL(3,2) DEFAULT 1.0 CHECK (Ставка BETWEEN 0.25 AND 2.0)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Группы' AND type = 'U')
CREATE TABLE Группы (
    Код_группы INT NOT NULL PRIMARY KEY,
    Наименование NVARCHAR(50) NOT NULL UNIQUE,
    Код_кафедры INT,
    Курс TINYINT DEFAULT 1 CHECK (Курс BETWEEN 1 AND 6)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Предметы' AND type = 'U')
CREATE TABLE Предметы (
    Код_предмета INT NOT NULL PRIMARY KEY,
    Наименование NVARCHAR(100) NOT NULL,
    Код_кафедры INT,
    Часы_лекций SMALLINT DEFAULT 0 CHECK (Часы_лекций >= 0),
    Часы_практик SMALLINT DEFAULT 0 CHECK (Часы_практик >= 0)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Тип_занятий' AND type = 'U')
CREATE TABLE Тип_занятий (
    Код_типа INT NOT NULL PRIMARY KEY,
    Наименование NVARCHAR(20) NOT NULL CHECK (Наименование IN ('Лекция', 'Практика', 'Лабораторная', 'Семинар'))
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Период_занятий' AND type = 'U')
CREATE TABLE Период_занятий (
    Код_периода INT NOT NULL PRIMARY KEY,
    Наименование NVARCHAR(10) NOT NULL,
    Время_начала TIME NOT NULL,
    Время_окончания TIME NOT NULL
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Аудитории' AND type = 'U')
CREATE TABLE Аудитории (
    Код_аудитории INT NOT NULL PRIMARY KEY,
    Номер_аудитории NVARCHAR(10) NOT NULL,
    Тип_аудитории NVARCHAR(20) DEFAULT 'Учебная' CHECK (Тип_аудитории IN ('Учебная', 'Лекционная', 'Лаборатория', 'Компьютерный класс')),
    Вместимость SMALLINT DEFAULT 20 CHECK (Вместимость BETWEEN 10 AND 300)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Расписание' AND type = 'U')
CREATE TABLE Расписание (
    Код_занятия INT IDENTITY(1,1) PRIMARY KEY,
    Дата_занятия DATE NOT NULL,
    Код_периода INT NOT NULL,
    Код_группы INT NOT NULL,
    Код_предмета INT NOT NULL,
    Код_преподавателя INT NOT NULL,
    Код_аудитории INT NOT NULL,
    Код_типа INT NOT NULL
)
GO

-- =============================================
-- БЛОК 5: СОЗДАНИЕ ВНЕШНИХ КЛЮЧЕЙ И ОТНОШЕНИЙ
-- =============================================

-- Внешние ключи для таблицы Преподаватели
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Преподаватели_Кафедры')
BEGIN
    ALTER TABLE Преподаватели 
    ADD CONSTRAINT FK_Преподаватели_Кафедры 
    FOREIGN KEY (Код_кафедры) REFERENCES Кафедры(Код_кафедры)
    ON DELETE SET NULL
END
GO

-- Внешние ключи для таблицы Группы
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Группы_Кафедры')
BEGIN
    ALTER TABLE Группы 
    ADD CONSTRAINT FK_Группы_Кафедры 
    FOREIGN KEY (Код_кафедры) REFERENCES Кафедры(Код_кафедры)
    ON DELETE SET NULL
END
GO

-- Внешние ключи для таблицы Предметы
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Предметы_Кафедры')
BEGIN
    ALTER TABLE Предметы 
    ADD CONSTRAINT FK_Предметы_Кафедры 
    FOREIGN KEY (Код_кафедры) REFERENCES Кафедры(Код_кафедры)
    ON DELETE SET NULL
END
GO

-- Внешние ключи для таблицы Расписание
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Период')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Период 
    FOREIGN KEY (Код_периода) REFERENCES Период_занятий(Код_периода)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Группы')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Группы 
    FOREIGN KEY (Код_группы) REFERENCES Группы(Код_группы)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Предметы')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Предметы 
    FOREIGN KEY (Код_предмета) REFERENCES Предметы(Код_предмета)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Преподаватели')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Преподаватели 
    FOREIGN KEY (Код_преподавателя) REFERENCES Преподаватели(Код_преподавателя)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Аудитории')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Аудитории 
    FOREIGN KEY (Код_аудитории) REFERENCES Аудитории(Код_аудитории)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_Расписание_Тип')
BEGIN
    ALTER TABLE Расписание 
    ADD CONSTRAINT FK_Расписание_Тип 
    FOREIGN KEY (Код_типа) REFERENCES Тип_занятий(Код_типа)
    ON DELETE CASCADE
END
GO

-- =============================================
-- БЛОК 6: СОЗДАНИЕ ИНДЕКСОВ ДЛЯ ВНЕШНИХ КЛЮЧЕЙ
-- =============================================

-- СОЗДАНИЕ НЕУНИКАЛЬНЫХ ИНДЕКСОВ ДЛЯ ВНЕШНИХ КЛЮЧЕЙ
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Период' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Период ON Расписание(Код_периода)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Группы' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Группы ON Расписание(Код_группы)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Предметы' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Предметы ON Расписание(Код_предмета)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Преподаватели' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Преподаватели ON Расписание(Код_преподавателя)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Аудитории' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Аудитории ON Расписание(Код_аудитории)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Расписание_Тип' AND object_id = OBJECT_ID('Расписание'))
    CREATE NONCLUSTERED INDEX IX_Расписание_Тип ON Расписание(Код_типа)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Преподаватели_Кафедры' AND object_id = OBJECT_ID('Преподаватели'))
    CREATE NONCLUSTERED INDEX IX_Преподаватели_Кафедры ON Преподаватели(Код_кафедры)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Группы_Кафедры' AND object_id = OBJECT_ID('Группы'))
    CREATE NONCLUSTERED INDEX IX_Группы_Кафедры ON Группы(Код_кафедры)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Предметы_Кафедры' AND object_id = OBJECT_ID('Предметы'))
    CREATE NONCLUSTERED INDEX IX_Предметы_Кафедры ON Предметы(Код_кафедры)
GO

-- =============================================
-- БЛОК 7: ЗАПОЛНЕНИЕ ТАБЛИЦ ТЕСТОВЫМИ ДАННЫМИ
-- =============================================

-- Вставляем данные только если таблицы пустые
IF NOT EXISTS (SELECT 1 FROM Кафедры)
BEGIN
    INSERT INTO Кафедры (Код_кафедры, Наименование, Дата_создания) VALUES
    (1, 'Кафедра информатики и вычислительной техники', '2000-09-01'),
    (2, 'Кафедра математики', '1998-08-15'),
    (3, 'Кафедра физики', '1995-07-20'),
    (4, 'Кафедра иностранных языков', '2005-03-10'),
    (5, 'Кафедра экономики', '2008-11-25'),
    (6, 'Кафедра программирования', '2010-01-30'),
    (7, 'Кафедра сетевых технологий', '2012-06-18'),
    (8, 'Кафедра базы данных', '2013-09-05'),
    (9, 'Кафедра веб-разработки', '2014-02-14'),
    (10, 'Кафедра искусственного интеллекта', '2015-10-08'),
    (11, 'Кафедра кибербезопасности', '2018-12-12')
END
GO

IF NOT EXISTS (SELECT 1 FROM Преподаватели)
BEGIN
    INSERT INTO Преподаватели (Код_преподавателя, ФИО, Должность, Код_кафедры, Ставка) VALUES
    (1, 'Иванов А.С.', 'Профессор', 1, 1.5),
    (2, 'Петрова М.И.', 'Доцент', 1, 1.0),
    (3, 'Сидоров В.П.', 'Преподаватель', 2, 0.75),
    (4, 'Козлова Е.В.', 'Доцент', 3, 1.0),
    (5, 'Николаев Д.С.', 'Профессор', 4, 1.5),
    (6, 'Федорова О.П.', 'Преподаватель', 5, 1.0),
    (7, 'Морозов И.А.', 'Доцент', 6, 1.0),
    (8, 'Волкова Т.М.', 'Преподаватель', 7, 0.5),
    (9, 'Белов С.К.', 'Профессор', 8, 1.5),
    (10, 'Григорьева Л.Н.', 'Доцент', 9, 1.0)
END
GO

IF NOT EXISTS (SELECT 1 FROM Группы)
BEGIN
    INSERT INTO Группы (Код_группы, Наименование, Код_кафедры, Курс) VALUES
    -- 4 курс (выпуск 2025)
    (1, 'ИВТ-22-1', 1, 4),
    (2, 'ИВТ-22-2', 1, 4),
    (3, 'ПИ-22-1', 6, 4),
    (4, 'ПИ-22-2', 6, 4),
    (5, 'КБ-22-1', 11, 4),
    -- 3 курс (выпуск 2026)
    (6, 'ИВТ-23-1', 1, 3),
    (7, 'ИВТ-23-2', 1, 3),
    (8, 'ПИ-23-1', 6, 3),
    (9, 'ПИ-23-2', 6, 3),
    (10, 'КБ-23-1', 11, 3),
    -- 2 курс (выпуск 2027)
    (11, 'ИВТ-24-1', 1, 2),
    (12, 'ИВТ-24-2', 1, 2),
    -- 1 курс (выпуск 2028)
    (13, 'ИВТ-25-1', 1, 1),
    (14, 'ИВТ-25-2', 1, 1),
    (15, 'ПИ-25-1', 6, 1),
    (16, 'КБ-25-1', 11, 1)
END
GO

IF NOT EXISTS (SELECT 1 FROM Предметы)
BEGIN
    INSERT INTO Предметы (Код_предмета, Наименование, Код_кафедры, Часы_лекций, Часы_практик) VALUES
    (1, 'Базы данных', 8, 36, 36),
    (2, 'Программирование', 6, 54, 54),
    (3, 'Математический анализ', 2, 72, 36),
    (4, 'Физика', 3, 54, 36),
    (5, 'Английский язык', 4, 36, 36),
    (6, 'Сетевые технологии', 7, 36, 36),
    (7, 'Веб-разработка', 9, 36, 54),
    (8, 'Искусственный интеллект', 10, 36, 36),
    (9, 'Кибербезопасность', 11, 36, 36),
    (10, 'Экономика', 5, 36, 18)
END
GO

IF NOT EXISTS (SELECT 1 FROM Тип_занятий)
BEGIN
    INSERT INTO Тип_занятий (Код_типа, Наименование) VALUES
    (1, 'Лекция'),
    (2, 'Практика'),
    (3, 'Лабораторная'),
    (4, 'Семинар')
END
GO

IF NOT EXISTS (SELECT 1 FROM Период_занятий)
BEGIN
    INSERT INTO Период_занятий (Код_периода, Наименование, Время_начала, Время_окончания) VALUES
    (1, '1 пара', '08:30', '10:00'),
    (2, '2 пара', '10:10', '11:40'),
    (3, '3 пара', '12:10', '13:40'),
    (4, '4 пара', '14:00', '15:30'),
    (5, '5 пара', '15:40', '17:10'),
    (6, '6 пара', '17:20', '18:50')
END
GO

IF NOT EXISTS (SELECT 1 FROM Аудитории)
BEGIN
    INSERT INTO Аудитории (Код_аудитории, Номер_аудитории, Тип_аудитории, Вместимость) VALUES
    (1, '101', 'Лекционная', 150),
    (2, '102', 'Лекционная', 120),
    (3, '201', 'Учебная', 30),
    (4, '202', 'Учебная', 25),
    (5, '301', 'Компьютерный класс', 20),
    (6, '302', 'Компьютерный класс', 20),
    (7, '401', 'Лаборатория', 15),
    (8, '402', 'Лаборатория', 15),
    (9, '501', 'Учебная', 35),
    (10, '502', 'Учебная', 30)
END
GO

IF NOT EXISTS (SELECT 1 FROM Расписание)
BEGIN
    INSERT INTO Расписание (Дата_занятия, Код_периода, Код_группы, Код_предмета, Код_преподавателя, Код_аудитории, Код_типа) VALUES
    -- Занятия для групп 2022-2025 годов
    ('2025-02-01', 1, 1, 1, 9, 5, 1),
    ('2025-02-01', 2, 1, 1, 9, 5, 3),
    ('2025-02-01', 3, 2, 1, 9, 6, 1),
    ('2025-02-01', 4, 2, 1, 9, 6, 3),
    ('2025-02-02', 1, 3, 2, 7, 5, 1),
    ('2025-02-02', 2, 3, 2, 7, 5, 2),
    ('2025-02-02', 3, 4, 2, 7, 6, 1),
    ('2025-02-02', 4, 4, 2, 7, 6, 2),
    ('2025-02-03', 1, 5, 9, 10, 7, 1),
    ('2025-02-03', 2, 5, 9, 10, 7, 3),
    ('2025-02-03', 3, 6, 3, 3, 1, 1),
    ('2025-02-03', 4, 6, 3, 3, 3, 2),
    ('2025-02-04', 1, 7, 4, 4, 2, 1),
    ('2025-02-04', 2, 7, 4, 4, 4, 3),
    ('2025-02-04', 3, 8, 7, 10, 5, 1),
    ('2025-02-04', 4, 8, 7, 10, 5, 3),
    ('2025-02-05', 1, 9, 6, 8, 6, 1),
    ('2025-02-05', 2, 9, 6, 8, 6, 3),
    ('2025-02-05', 3, 10, 8, 10, 7, 1),
    ('2025-02-05', 4, 10, 8, 10, 7, 3),
    ('2025-02-06', 1, 11, 5, 5, 9, 1),
    ('2025-02-06', 2, 11, 5, 5, 9, 2),
    ('2025-02-06', 3, 12, 10, 6, 10, 1),
    ('2025-02-06', 4, 12, 10, 6, 10, 2),
    -- Дополнительные занятия для новых групп
    ('2025-02-07', 1, 13, 2, 7, 5, 1),
    ('2025-02-07', 2, 14, 2, 7, 6, 1),
    ('2025-02-07', 3, 15, 1, 9, 5, 1),
    ('2025-02-07', 4, 16, 9, 10, 7, 1)
END
GO

-- =============================================
-- БЛОК 8: ПРОВЕРКА РЕЗУЛЬТАТОВ
-- =============================================

-- Вывод информации о созданных объектах
SELECT 'База данных "Расписание_занятий" создана успешно!' as Результат
SELECT COUNT(*) as 'Количество таблиц' FROM sys.tables WHERE type = 'U'
SELECT name as 'Созданные таблицы' FROM sys.tables WHERE type = 'U' ORDER BY name

-- Проверка данных во ВСЕХ таблицах
SELECT 'Кафедры:' as Таблица, COUNT(*) as Количество_записей FROM Кафедры
UNION ALL
SELECT 'Преподаватели:', COUNT(*) FROM Преподаватели
UNION ALL  
SELECT 'Группы:', COUNT(*) FROM Группы
UNION ALL
SELECT 'Предметы:', COUNT(*) FROM Предметы
UNION ALL
SELECT 'Тип_занятий:', COUNT(*) FROM Тип_занятий
UNION ALL
SELECT 'Период_занятий:', COUNT(*) FROM Период_занятий
UNION ALL
SELECT 'Аудитории:', COUNT(*) FROM Аудитории
UNION ALL
SELECT 'Расписание:', COUNT(*) FROM Расписание
GO