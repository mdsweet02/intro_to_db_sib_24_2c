CREATE TRIGGER dbo.trg_ekzamen_ved_upd
ON dbo.ekzamenachionnaya_vedomost
AFTER UPDATE
AS
BEGIN
    INSERT INTO dbo.ekzamenacionnaya_vedomost_log
        (Operation, NomVedomosti, DataVedomosti, KodGruppy, KodPredmeta)
    SELECT
        N'UPDATE',
        i.NomVedomosti,
        i.DataVedomosti,
        i.KodGruppy,
        i.KodPredmeta
    FROM inserted i;
END;
GO
