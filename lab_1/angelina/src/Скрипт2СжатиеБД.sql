EXEC sp_spaceused ;

--������ ���� ������ �� 25%
DBCC SHRINKDATABASE('<���_��������>_1', 25);