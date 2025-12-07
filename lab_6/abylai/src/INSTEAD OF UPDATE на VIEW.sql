CREATE TRIGGER dbo.trg_vStudUpd
ON dbo.v_StudentyGruppy
INSTEAD OF UPDATE
AS
BEGIN
    UPDATE s
    SET
        s.FIO       = i.FIO,
        s.KodGruppy = i.KodGruppy
    FROM dbo.Studenty s
    JOIN inserted i
        ON s.ZachetnayaKnyzhka = i.ZachetnayaKnyzhka;
END;
GO
