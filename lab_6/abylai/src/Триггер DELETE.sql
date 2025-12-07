CREATE TRIGGER dbo.trg_ekzamen_ved_del
ON dbo.ekzamenachionnaya_vedomost
AFTER DELETE
AS
BEGIN
    INSERT INTO dbo.ekzamenacionnaya_vedomost_log
        (Operation, NomVedomosti, DataVedomosti, KodGruppy, KodPredmeta)
    SELECT
        N'DELETE',
        d.NomVedomosti,
        d.DataVedomosti,
        d.KodGruppy,
        d.KodPredmeta
    FROM deleted d;
END;
GO
