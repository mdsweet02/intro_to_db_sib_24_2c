CREATE TRIGGER dbo.trg_vStudDel
ON dbo.v_StudentyGruppy
INSTEAD OF DELETE
AS
BEGIN
    DELETE s
    FROM dbo.Studenty s
    JOIN deleted d
        ON s.ZachetnayaKnyzhka = d.ZachetnayaKnyzhka;
END;
GO
