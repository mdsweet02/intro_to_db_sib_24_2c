CREATE TABLE dbo.ekzamenacionnaya_vedomost_log
(
    LogID          INT IDENTITY(1,1) PRIMARY KEY,
    Operation      NVARCHAR(10),        -- INSERT / UPDATE / DELETE
    NomVedomosti   INT,
    DataVedomosti  DATE,
    KodGruppy      INT,
    KodPredmeta    INT,
    LogDate        DATETIME2 DEFAULT SYSDATETIME(),
    UserName       SYSNAME   DEFAULT SUSER_SNAME()
);
GO
