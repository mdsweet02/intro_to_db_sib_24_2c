CREATE TRIGGER dbo.trg_vStudIns
ON dbo.v_StudentyGruppy
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO dbo.Studenty (ZachetnayaKnyzhka, FIO, KodGruppy, KodVidaObucheniya)
    SELECT
        i.ZachetnayaKnyzhka,
        i.FIO,
        i.KodGruppy,
        1               -- условно ставим вид обучения по умолчанию
    FROM inserted i;
END;
GO
