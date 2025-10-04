EXEC sp_spaceused ;

--—жатие базы данных до 25%
DBCC SHRINKDATABASE('<фио_студента>_1', 25);