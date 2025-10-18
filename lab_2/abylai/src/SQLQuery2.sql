BACKUP DATABASE Муслиманов_Абылай
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Backup\Муслиманов_Абылай.bak'
WITH
	DESCRIPTION = 'Полная резервная копия базы Муслиманов_Абылай',
	INIT,
	EXPIREDATE = '2026-09-06',
	STATS = 10;