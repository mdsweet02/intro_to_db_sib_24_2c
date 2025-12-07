CREATE TRIGGER dbo.trg_ekzamen_ved_ins
ON dbo.ekzamenachionnaya_vedomost
AFTER INSERT
AS
BEGIN
    INSERT INTO dbo.Ekzamenachionnaya_vedomost_log
        (Operation, NomVedomosti, DataVedomosti, KodGruppy, KodPredmeta)
    SELECT
        N'INSERT',
        i.NomVedomosti,
        i.DataVedomosti,
        i.KodGruppy,
        i.KodPredmeta
    FROM inserted i;
END;
GO
