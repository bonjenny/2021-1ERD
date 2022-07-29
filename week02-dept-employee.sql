/* �μ�, ��� ���̺� */
-- (dept-employee.sql)

-- �μ�(�μ��ڵ�, �μ���, ��ġ)
-- ���(�����ȣ, �̸�, ����, �Ի���, �ּ�, �μ��ڵ�)

DROP TABLE ���;
DROP TABLE �μ�;

CREATE TABLE �μ� (
	�μ��ڵ�	char(2)	NOT NULL,
	�μ���	varchar(12),
	��ġ	varchar(10),
	PRIMARY KEY(�μ��ڵ�)
);

CREATE TABLE ��� (
	�����ȣ	int	NOT NULL,
	�̸�	varchar(12),
	����	char(3),
	�Ի���	char(10),
	�ּ�	varchar(50),
	�μ��ڵ�	char(2),
	PRIMARY KEY(�����ȣ),
	FOREIGN KEY (�μ��ڵ�) REFERENCES �μ�(�μ��ڵ�)
);

-- �μ�(�μ��ڵ�, �μ���, ��ġ)
INSERT INTO �μ� VALUES('AA','�ѹ���','����');
INSERT INTO �μ� VALUES('BB','������','����');
INSERT INTO �μ� VALUES('CC','��ȹ��','����');

-- ���(�����ȣ, �̸�, ����, �Ի���, �ּ�, �μ��ڵ�)
INSERT INTO ��� VALUES(1111,'ȫ�浿','��','2004-08-26','����� ���빮�� ����','AA');
INSERT INTO ��� VALUES(2222,'�Ӳ���','��','2005-02-23','�λ�� �ؿ�뱸','AA');
INSERT INTO ��� VALUES(3333,'����ȣ','��','2004-08-26','��⵵ ������ �д籸','BB');
INSERT INTO ��� VALUES(4444,'������','��','2005-08-22','����� ������ ������','BB');
INSERT INTO ��� VALUES(5555,'���θ�','��','2006-02-23','����� �������� ���ǵ���','AA');
INSERT INTO ��� VALUES(6666,'�ŵ���','��','2006-02-20','����� ���۱� �Ŵ�浿','BB');

COMMIT;

-- text���� ���̺��� ������ ��� '�ּ�'�� �ʹ� ��� ������ 30�ڸ� �����޶�� ����
COL �ּ� FORMAT a30

SELECT * FROM �μ�;
SELECT * FROM ���;

-- [����01-2] 1) ����� ��� ������ ���̽ÿ�
SELECT * FROM ���;

-- [����01-2] 2) �ŵ��� ����� �ּҴ� �����ΰ�?
SELECT	�ּ�
FROM	���
WHERE	�̸�='�ŵ���';

-- [����01-2] 3) ������ '��'�̰� �μ��ڵ尡 'BB'�� ����� �˻��Ͻÿ�
SELECT	*
FROM	���
WHERE	����='��' AND �μ��ڵ�='BB'

-- [����01-2] 4) ����� �̸�, ������ ���̵� ����̸��� �����ټ����� ���̽ÿ�
SELECT	�̸�, ����
FROM	���
ORDER BY 1;

-- [����01-2] 5) �μ��ڵ�� �� �μ��� ���� ������� �ο����� ���̽ÿ�
SELECT	�μ��ڵ�, COUNT(*) �ο���
FROM	���
GROUP BY �μ��ڵ�;

-- [����01-2] 6) ����̸��� �μ��̸��� ���̽ÿ�
SELECT	�μ�.�μ���, ���.�̸�
FROM	�μ� JOIN ���
ON �μ�.�μ��ڵ� = ���.�μ��ڵ�;

-- [����01-2] 6) ����̸��� �μ��̸��� ���̽ÿ� - �Ǵٸ� ���
SELECT	���.�̸�, �μ�.�μ���
FROM	���, �μ�
ON ���.�μ��ڵ� = �μ�.�μ��ڵ�;