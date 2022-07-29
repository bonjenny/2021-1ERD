
/* ================ week11-ex08-04.sql ================ */

-- 04) Quiz08-04
-- ����(�����ȣ, ����)
-- �λ�(����, �Ҽ�, �����ȣ)

drop table �λ�;
drop table ����;

CREATE TABLE ���� (
    �����ȣ CHAR(2) NOT NULL ,
    ���� CHAR(1) NULL ,
    PRIMARY KEY (�����ȣ)
);

CREATE TABLE �λ� (
    ���� nvarchar2(3) NOT NULL ,
    �Ҽ� nvarchar2(3) NULL ,
    �����ȣ CHAR(2) NULL ,
    PRIMARY KEY (����) ,
    FOREIGN KEY (�����ȣ) REFERENCES ���� (�����ȣ) 
    ON DELETE SET NULL
);

insert into ���� values('23','A');
insert into ���� values('25','B');
insert into ���� values('43','C');
insert into ���� values('56','D');

insert into �λ� values('���̼�','�ѹ���','25');
insert into �λ� values('������','�����','56');
insert into �λ� values('������','������','23');
insert into �λ� values('������','������','43');

select * from ����;
select * from �λ�;


-- 1) ����, �Ҽ�, ���������� �˻��϶�
SELECT   ����, �Ҽ�, ���� as ��������
FROM     ����, �λ�
WHERE    ����.�����ȣ = �λ�.�����ȣ;


-- 2) �������� ����, �Ҽ�, ���������� �˻��϶�
SELECT   ����, �Ҽ�, ���� as ��������
FROM     ����, �λ�
WHERE    ����.�����ȣ = �λ�.�����ȣ
         and ����='������';


-- [Quiz08-04] ����ó�������� �ʱ�
-- ����(�����ȣ, ����)
-- �λ�(����, �Ҽ�, �����ȣ)

select ����
from ����
where �����ȣ = (select �����ȣ from �λ� where ����='������');

-- �̸� �߿� '��' �� ���� ����� ����, �ҼӰ� ���� ������ �˻��϶�
select t.����, t.�Ҽ�, ����
from (select ����, �Ҽ�, �����ȣ
         from �λ�
         where ���� LIKE '%��%') t, ����
where t.�����ȣ = ����.�����ȣ;

/* =============================================== */