-- ���� 1: �������� ���� ������
-- ������������ ������ �2
-- �������� ���� ������ "����������_�������" � ������

-- ������� ���� ���� ���
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = '����������_�������')
    CREATE DATABASE ����������_�������
GO

USE ����������_�������
GO

-- =============================================
-- ���� 4: �������� ������ ���� ������
-- =============================================

-- ������� ������� ���� �� ���
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '�������' AND type = 'U')
CREATE TABLE ������� (
    ���_������� INT NOT NULL PRIMARY KEY,
    ������������ NVARCHAR(100) NOT NULL,
    ����_�������� DATE DEFAULT GETDATE()
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '�������������' AND type = 'U')
CREATE TABLE ������������� (
    ���_������������� INT NOT NULL PRIMARY KEY,
    ��� NVARCHAR(100) NOT NULL,
    ��������� NVARCHAR(50) DEFAULT '�������������',
    ���_������� INT,
    ������ DECIMAL(3,2) DEFAULT 1.0 CHECK (������ BETWEEN 0.25 AND 2.0)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '������' AND type = 'U')
CREATE TABLE ������ (
    ���_������ INT NOT NULL PRIMARY KEY,
    ������������ NVARCHAR(50) NOT NULL UNIQUE,
    ���_������� INT,
    ���� TINYINT DEFAULT 1 CHECK (���� BETWEEN 1 AND 6)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '��������' AND type = 'U')
CREATE TABLE �������� (
    ���_�������� INT NOT NULL PRIMARY KEY,
    ������������ NVARCHAR(100) NOT NULL,
    ���_������� INT,
    ����_������ SMALLINT DEFAULT 0 CHECK (����_������ >= 0),
    ����_������� SMALLINT DEFAULT 0 CHECK (����_������� >= 0)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '���_�������' AND type = 'U')
CREATE TABLE ���_������� (
    ���_���� INT NOT NULL PRIMARY KEY,
    ������������ NVARCHAR(20) NOT NULL CHECK (������������ IN ('������', '��������', '������������', '�������'))
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '������_�������' AND type = 'U')
CREATE TABLE ������_������� (
    ���_������� INT NOT NULL PRIMARY KEY,
    ������������ NVARCHAR(10) NOT NULL,
    �����_������ TIME NOT NULL,
    �����_��������� TIME NOT NULL
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '���������' AND type = 'U')
CREATE TABLE ��������� (
    ���_��������� INT NOT NULL PRIMARY KEY,
    �����_��������� NVARCHAR(10) NOT NULL,
    ���_��������� NVARCHAR(20) DEFAULT '�������' CHECK (���_��������� IN ('�������', '����������', '�����������', '������������ �����')),
    ����������� SMALLINT DEFAULT 20 CHECK (����������� BETWEEN 10 AND 300)
)
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = '����������' AND type = 'U')
CREATE TABLE ���������� (
    ���_������� INT IDENTITY(1,1) PRIMARY KEY,
    ����_������� DATE NOT NULL,
    ���_������� INT NOT NULL,
    ���_������ INT NOT NULL,
    ���_�������� INT NOT NULL,
    ���_������������� INT NOT NULL,
    ���_��������� INT NOT NULL,
    ���_���� INT NOT NULL
)
GO

-- =============================================
-- ���� 5: �������� ������� ������ � ���������
-- =============================================

-- ������� ����� ��� ������� �������������
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_�������������_�������')
BEGIN
    ALTER TABLE ������������� 
    ADD CONSTRAINT FK_�������������_������� 
    FOREIGN KEY (���_�������) REFERENCES �������(���_�������)
    ON DELETE SET NULL
END
GO

-- ������� ����� ��� ������� ������
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_������_�������')
BEGIN
    ALTER TABLE ������ 
    ADD CONSTRAINT FK_������_������� 
    FOREIGN KEY (���_�������) REFERENCES �������(���_�������)
    ON DELETE SET NULL
END
GO

-- ������� ����� ��� ������� ��������
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_��������_�������')
BEGIN
    ALTER TABLE �������� 
    ADD CONSTRAINT FK_��������_������� 
    FOREIGN KEY (���_�������) REFERENCES �������(���_�������)
    ON DELETE SET NULL
END
GO

-- ������� ����� ��� ������� ����������
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_������')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_������ 
    FOREIGN KEY (���_�������) REFERENCES ������_�������(���_�������)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_������')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_������ 
    FOREIGN KEY (���_������) REFERENCES ������(���_������)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_��������')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_�������� 
    FOREIGN KEY (���_��������) REFERENCES ��������(���_��������)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_�������������')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_������������� 
    FOREIGN KEY (���_�������������) REFERENCES �������������(���_�������������)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_���������')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_��������� 
    FOREIGN KEY (���_���������) REFERENCES ���������(���_���������)
    ON DELETE CASCADE
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK_����������_���')
BEGIN
    ALTER TABLE ���������� 
    ADD CONSTRAINT FK_����������_��� 
    FOREIGN KEY (���_����) REFERENCES ���_�������(���_����)
    ON DELETE CASCADE
END
GO

-- =============================================
-- ���� 6: �������� �������� ��� ������� ������
-- =============================================

-- �������� ������������ �������� ��� ������� ������
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_������' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_������ ON ����������(���_�������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_������' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_������ ON ����������(���_������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_��������' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_�������� ON ����������(���_��������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_�������������' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_������������� ON ����������(���_�������������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_���������' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_��������� ON ����������(���_���������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_����������_���' AND object_id = OBJECT_ID('����������'))
    CREATE NONCLUSTERED INDEX IX_����������_��� ON ����������(���_����)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_�������������_�������' AND object_id = OBJECT_ID('�������������'))
    CREATE NONCLUSTERED INDEX IX_�������������_������� ON �������������(���_�������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_������_�������' AND object_id = OBJECT_ID('������'))
    CREATE NONCLUSTERED INDEX IX_������_������� ON ������(���_�������)
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_��������_�������' AND object_id = OBJECT_ID('��������'))
    CREATE NONCLUSTERED INDEX IX_��������_������� ON ��������(���_�������)
GO

-- =============================================
-- ���� 7: ���������� ������ ��������� �������
-- =============================================

-- ��������� ������ ������ ���� ������� ������
IF NOT EXISTS (SELECT 1 FROM �������)
BEGIN
    INSERT INTO ������� (���_�������, ������������, ����_��������) VALUES
    (1, '������� ����������� � �������������� �������', '2000-09-01'),
    (2, '������� ����������', '1998-08-15'),
    (3, '������� ������', '1995-07-20'),
    (4, '������� ����������� ������', '2005-03-10'),
    (5, '������� ���������', '2008-11-25'),
    (6, '������� ����������������', '2010-01-30'),
    (7, '������� ������� ����������', '2012-06-18'),
    (8, '������� ���� ������', '2013-09-05'),
    (9, '������� ���-����������', '2014-02-14'),
    (10, '������� �������������� ����������', '2015-10-08'),
    (11, '������� �����������������', '2018-12-12')
END
GO

IF NOT EXISTS (SELECT 1 FROM �������������)
BEGIN
    INSERT INTO ������������� (���_�������������, ���, ���������, ���_�������, ������) VALUES
    (1, '������ �.�.', '���������', 1, 1.5),
    (2, '������� �.�.', '������', 1, 1.0),
    (3, '������� �.�.', '�������������', 2, 0.75),
    (4, '������� �.�.', '������', 3, 1.0),
    (5, '�������� �.�.', '���������', 4, 1.5),
    (6, '�������� �.�.', '�������������', 5, 1.0),
    (7, '������� �.�.', '������', 6, 1.0),
    (8, '������� �.�.', '�������������', 7, 0.5),
    (9, '����� �.�.', '���������', 8, 1.5),
    (10, '���������� �.�.', '������', 9, 1.0)
END
GO

IF NOT EXISTS (SELECT 1 FROM ������)
BEGIN
    INSERT INTO ������ (���_������, ������������, ���_�������, ����) VALUES
    -- 4 ���� (������ 2025)
    (1, '���-22-1', 1, 4),
    (2, '���-22-2', 1, 4),
    (3, '��-22-1', 6, 4),
    (4, '��-22-2', 6, 4),
    (5, '��-22-1', 11, 4),
    -- 3 ���� (������ 2026)
    (6, '���-23-1', 1, 3),
    (7, '���-23-2', 1, 3),
    (8, '��-23-1', 6, 3),
    (9, '��-23-2', 6, 3),
    (10, '��-23-1', 11, 3),
    -- 2 ���� (������ 2027)
    (11, '���-24-1', 1, 2),
    (12, '���-24-2', 1, 2),
    -- 1 ���� (������ 2028)
    (13, '���-25-1', 1, 1),
    (14, '���-25-2', 1, 1),
    (15, '��-25-1', 6, 1),
    (16, '��-25-1', 11, 1)
END
GO

IF NOT EXISTS (SELECT 1 FROM ��������)
BEGIN
    INSERT INTO �������� (���_��������, ������������, ���_�������, ����_������, ����_�������) VALUES
    (1, '���� ������', 8, 36, 36),
    (2, '����������������', 6, 54, 54),
    (3, '�������������� ������', 2, 72, 36),
    (4, '������', 3, 54, 36),
    (5, '���������� ����', 4, 36, 36),
    (6, '������� ����������', 7, 36, 36),
    (7, '���-����������', 9, 36, 54),
    (8, '������������� ���������', 10, 36, 36),
    (9, '�����������������', 11, 36, 36),
    (10, '���������', 5, 36, 18)
END
GO

IF NOT EXISTS (SELECT 1 FROM ���_�������)
BEGIN
    INSERT INTO ���_������� (���_����, ������������) VALUES
    (1, '������'),
    (2, '��������'),
    (3, '������������'),
    (4, '�������')
END
GO

IF NOT EXISTS (SELECT 1 FROM ������_�������)
BEGIN
    INSERT INTO ������_������� (���_�������, ������������, �����_������, �����_���������) VALUES
    (1, '1 ����', '08:30', '10:00'),
    (2, '2 ����', '10:10', '11:40'),
    (3, '3 ����', '12:10', '13:40'),
    (4, '4 ����', '14:00', '15:30'),
    (5, '5 ����', '15:40', '17:10'),
    (6, '6 ����', '17:20', '18:50')
END
GO

IF NOT EXISTS (SELECT 1 FROM ���������)
BEGIN
    INSERT INTO ��������� (���_���������, �����_���������, ���_���������, �����������) VALUES
    (1, '101', '����������', 150),
    (2, '102', '����������', 120),
    (3, '201', '�������', 30),
    (4, '202', '�������', 25),
    (5, '301', '������������ �����', 20),
    (6, '302', '������������ �����', 20),
    (7, '401', '�����������', 15),
    (8, '402', '�����������', 15),
    (9, '501', '�������', 35),
    (10, '502', '�������', 30)
END
GO

IF NOT EXISTS (SELECT 1 FROM ����������)
BEGIN
    INSERT INTO ���������� (����_�������, ���_�������, ���_������, ���_��������, ���_�������������, ���_���������, ���_����) VALUES
    -- ������� ��� ����� 2022-2025 �����
    ('2025-02-01', 1, 1, 1, 9, 5, 1),
    ('2025-02-01', 2, 1, 1, 9, 5, 3),
    ('2025-02-01', 3, 2, 1, 9, 6, 1),
    ('2025-02-01', 4, 2, 1, 9, 6, 3),
    ('2025-02-02', 1, 3, 2, 7, 5, 1),
    ('2025-02-02', 2, 3, 2, 7, 5, 2),
    ('2025-02-02', 3, 4, 2, 7, 6, 1),
    ('2025-02-02', 4, 4, 2, 7, 6, 2),
    ('2025-02-03', 1, 5, 9, 10, 7, 1),
    ('2025-02-03', 2, 5, 9, 10, 7, 3),
    ('2025-02-03', 3, 6, 3, 3, 1, 1),
    ('2025-02-03', 4, 6, 3, 3, 3, 2),
    ('2025-02-04', 1, 7, 4, 4, 2, 1),
    ('2025-02-04', 2, 7, 4, 4, 4, 3),
    ('2025-02-04', 3, 8, 7, 10, 5, 1),
    ('2025-02-04', 4, 8, 7, 10, 5, 3),
    ('2025-02-05', 1, 9, 6, 8, 6, 1),
    ('2025-02-05', 2, 9, 6, 8, 6, 3),
    ('2025-02-05', 3, 10, 8, 10, 7, 1),
    ('2025-02-05', 4, 10, 8, 10, 7, 3),
    ('2025-02-06', 1, 11, 5, 5, 9, 1),
    ('2025-02-06', 2, 11, 5, 5, 9, 2),
    ('2025-02-06', 3, 12, 10, 6, 10, 1),
    ('2025-02-06', 4, 12, 10, 6, 10, 2),
    -- �������������� ������� ��� ����� �����
    ('2025-02-07', 1, 13, 2, 7, 5, 1),
    ('2025-02-07', 2, 14, 2, 7, 6, 1),
    ('2025-02-07', 3, 15, 1, 9, 5, 1),
    ('2025-02-07', 4, 16, 9, 10, 7, 1)
END
GO

-- =============================================
-- ���� 8: �������� �����������
-- =============================================

-- ����� ���������� � ��������� ��������
SELECT '���� ������ "����������_�������" ������� �������!' as ���������
SELECT COUNT(*) as '���������� ������' FROM sys.tables WHERE type = 'U'
SELECT name as '��������� �������' FROM sys.tables WHERE type = 'U' ORDER BY name

-- �������� ������ �� ���� ��������
SELECT '�������:' as �������, COUNT(*) as ����������_������� FROM �������
UNION ALL
SELECT '�������������:', COUNT(*) FROM �������������
UNION ALL  
SELECT '������:', COUNT(*) FROM ������
UNION ALL
SELECT '��������:', COUNT(*) FROM ��������
UNION ALL
SELECT '���_�������:', COUNT(*) FROM ���_�������
UNION ALL
SELECT '������_�������:', COUNT(*) FROM ������_�������
UNION ALL
SELECT '���������:', COUNT(*) FROM ���������
UNION ALL
SELECT '����������:', COUNT(*) FROM ����������
GO