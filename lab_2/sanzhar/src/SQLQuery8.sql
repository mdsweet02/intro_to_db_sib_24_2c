-----------------------------------------
-- 1. Создание базы данных
-----------------------------------------
CREATE DATABASE Ugol;
GO

USE Ugol;
GO

-----------------------------------------
-- 2. Таблица: Уголь
-----------------------------------------
CREATE TABLE Ugol (
    MarkaUglia        VARCHAR(50) PRIMARY KEY,
    Zolnost           DECIMAL(5,2),
    Vlazhnost         DECIMAL(5,2),
    TeplotaSgoraniya  INT
);
GO

-----------------------------------------
-- 3. Таблица: Пенсионный фонд
-----------------------------------------
CREATE TABLE PensionnyiFond (
    KodFonda      INT PRIMARY KEY,
    Naimenovanie  VARCHAR(100)
);
GO

-----------------------------------------
-- 4. Таблица: Должности
-----------------------------------------
CREATE TABLE Dolzhnosti (
    KodDolzhnosti INT PRIMARY KEY,
    Naimenovanie  VARCHAR(100)
);
GO

-----------------------------------------
-- 5. Таблица: Работники
-----------------------------------------
CREATE TABLE Rabotniki (
    TabNomer          INT PRIMARY KEY,
    FIO               VARCHAR(150),
    IIN               CHAR(12) UNIQUE,
    SIK               VARCHAR(20),
    KodDolzhnosti     INT,
    KodFonda          INT,

    FOREIGN KEY (KodDolzhnosti) REFERENCES Dolzhnosti(KodDolzhnosti),
    FOREIGN KEY (KodFonda) REFERENCES PensionnyiFond(KodFonda)
);
GO

-----------------------------------------
-- 6. Таблица: Самосвалы
-----------------------------------------
CREATE TABLE Samosvaly (
    KodSamosvala  INT PRIMARY KEY,
    Nazvanie      VARCHAR(100),
    Tonnazh       INT
);
GO

-----------------------------------------
-- 7. Таблица: Экскаваторы
-----------------------------------------
CREATE TABLE Ekskavatory (
    KodEkskavatora INT PRIMARY KEY,
    Nazvanie       VARCHAR(100),
    ObemKovsha     DECIMAL(10,2)
);
GO

-----------------------------------------
-- 8. Таблица: Добыча — вывоз
-----------------------------------------
CREATE TABLE DobychaVyvoz (
    NomerReisa     INT PRIMARY KEY,
    Data           DATE,
    Smena          INT,
    Obem           DECIMAL(10,2),
    MarkaUglia     VARCHAR(50),

    FOREIGN KEY (MarkaUglia) REFERENCES Ugol(MarkaUglia)
);
GO

-----------------------------------------
-- 9. Таблица: Добыча — экскаватор
-----------------------------------------
CREATE TABLE DobychaEkskavator (
    NomerReisa       INT,
    KodEkskavatora   INT,
    TabNomer         INT,

    PRIMARY KEY (NomerReisa),
    FOREIGN KEY (NomerReisa)     REFERENCES DobychaVyvoz(NomerReisa),
    FOREIGN KEY (KodEkskavatora) REFERENCES Ekskavatory(KodEkskavatora),
    FOREIGN KEY (TabNomer)       REFERENCES Rabotniki(TabNomer)
);
GO

-----------------------------------------
-- 10. Таблица: Вывоз — самосвал
-----------------------------------------
CREATE TABLE VyvozSamosval (
    NomerReisa      INT,
    KodSamosvala    INT,
    TabNomer        INT,

    PRIMARY KEY (NomerReisa),
    FOREIGN KEY (NomerReisa)   REFERENCES DobychaVyvoz(NomerReisa),
    FOREIGN KEY (KodSamosvala) REFERENCES Samosvaly(KodSamosvala),
    FOREIGN KEY (TabNomer)     REFERENCES Rabotniki(TabNomer)
);
GO

-----------------------------------------
-- 11. Таблица: Учет рабочего времени
-----------------------------------------
CREATE TABLE Uchet (
    Data        DATE,
    Smena       INT,
    TabNomer    INT,
    KolvoChasov DECIMAL(5,2),

    PRIMARY KEY (Data, Smena, TabNomer),
    FOREIGN KEY (TabNomer) REFERENCES Rabotniki(TabNomer)
);
GO

INSERT INTO Ugol VALUES
('A', 12.5, 5.2, 4500),
('B', 10.0, 4.0, 5000),
('C', 15.0, 6.0, 4200),
('D', 8.0, 3.0, 5200),
('E', 20.0, 10.0, 3800),
('F', 11.3, 5.5, 4600),
('G', 9.8, 4.7, 4950),
('H', 16.2, 8.1, 4100),
('I', 7.5, 3.5, 5300),
('J', 13.7, 6.3, 4400);


INSERT INTO PensionnyiFond VALUES
(1, 'ЕНПФ'), (2, 'НПФ КазахМыс'), (3, 'Freedom PF'), (4, 'Халык PF'),
(5, 'Eurasian PF'), (6, 'Samruk PF'), (7, 'Kaspi PF'), (8, 'Baqyty PF'),
(9, 'Future PF'), (10, 'Union PF');



INSERT INTO Dolzhnosti VALUES
(101, 'Горняк'), (102, 'Механик'), (103, 'Водитель'),
(104, 'Инженер'), (105, 'Мастер смены'), (106, 'Электрик'),
(107, 'Техник'), (108, 'Бульдозерист'),
(109, 'Диспетчер'), (110, 'Геолог');


INSERT INTO Rabotniki VALUES
(1, 'Иванов И.И.',  '990101123456', 'S001', 101, 1),
(2, 'Петров П.П.',  '990102123457', 'S002', 103, 2),
(3, 'Семенов С.С.', '990103123458', 'S003', 102, 3),
(4, 'Ахметов А.А.', '990104123459', 'S004', 104, 4),
(5, 'Ким Д.Д.',     '990105123450', 'S005', 101, 5),
(6, 'Танатар Т.Т.', '990106123451', 'S006', 103, 6),
(7, 'Серик С.С.',   '990107123452', 'S007', 105, 7),
(8, 'Жумабек Ж.Ж.', '990108123453', 'S008', 106, 8),
(9, 'Ли Л.Л.',      '990109123454', 'S009', 107, 9),
(10,'Нурлан Н.Н.',  '990110123455', 'S010', 103, 10);


INSERT INTO Samosvaly VALUES
(201, 'BelAZ-75131', 130),
(202, 'BelAZ-7540', 45),
(203, 'CAT 785D', 140),
(204, 'Komatsu HD785', 90),
(205, 'CAT 777F', 100),
(206, 'Shacman SX', 35),
(207, 'БелАЗ-7555', 55),
(208, 'Terex TR100', 91),
(209, 'Volvo A40G', 40),
(210, 'CAT 773G', 56);


INSERT INTO Ekskavatory VALUES
(301, 'Hitachi EX1200', 6.5),
(302, 'Komatsu PC2000', 12.0),
(303, 'CAT 6020B', 12.2),
(304, 'Liebherr R9250', 15.0),
(305, 'Hitachi EX5600', 34.0),
(306, 'CAT 6040', 18.0),
(307, 'Komatsu PC800', 3.5),
(308, 'Doosan DX800', 4.5),
(309, 'Volvo EC950F', 6.0),
(310, 'Liebherr R9800', 42.0);




INSERT INTO DobychaVyvoz VALUES
(1, '2025-01-01', 1, 120, 'A'),
(2, '2025-01-01', 1, 140, 'B'),
(3, '2025-01-01', 2, 150, 'C'),
(4, '2025-01-01', 2, 110, 'D'),
(5, '2025-01-02', 1, 160, 'E'),
(6, '2025-01-02', 1, 130, 'F'),
(7, '2025-01-02', 2, 170, 'G'),
(8, '2025-01-02', 2, 125, 'H'),
(9, '2025-01-03', 1, 115, 'I'),
(10,'2025-01-03', 1, 150, 'J'),
(11,'2025-01-03', 2, 155, 'A'),
(12,'2025-01-04', 2, 140, 'B'),
(13,'2025-01-04', 1, 165, 'C'),
(14,'2025-01-04', 1, 175, 'D'),
(15,'2025-01-05', 2, 180, 'E'),
(16,'2025-01-05', 2, 145, 'F'),
(17,'2025-01-06', 1, 160, 'G'),
(18,'2025-01-06', 1, 190, 'H'),
(19,'2025-01-06', 2, 200, 'I'),
(20,'2025-01-06', 2, 210, 'J');



INSERT INTO DobychaEkskavator VALUES
(1, 301, 1),  (2, 302, 2),  (3, 303, 3),  (4, 304, 4),
(5, 305, 5),  (6, 306, 6),  (7, 307, 7),  (8, 308, 8),
(9, 309, 9),  (10, 310, 10),
(11, 301, 1), (12, 302, 2), (13, 303, 3), (14, 304, 4),
(15, 305, 5), (16, 306, 6), (17, 307, 7), (18, 308, 8),
(19, 309, 9), (20, 310, 10);


INSERT INTO Uchet VALUES
('2025-01-01', 1, 1, 8), ('2025-01-01', 1, 2, 8),
('2025-01-01', 2, 3, 8), ('2025-01-01', 2, 4, 8),
('2025-01-02', 1, 5, 8), ('2025-01-02', 1, 6, 8),
('2025-01-02', 2, 7, 8), ('2025-01-02', 2, 8, 8),
('2025-01-03', 1, 9, 8), ('2025-01-03', 1, 10, 8),
('2025-01-03', 2, 1, 8), ('2025-01-03', 2, 2, 8),
('2025-01-04', 1, 3, 8), ('2025-01-04', 1, 4, 8),
('2025-01-04', 2, 5, 8), ('2025-01-04', 2, 6, 8),
('2025-01-05', 1, 7, 8), ('2025-01-05', 1, 8, 8),
('2025-01-05', 2, 9, 8), ('2025-01-05', 2, 10, 8);
