
/* ================ week11-ex08-03.sql ================ */

-- 03) Quiz08-03
-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)
-- ���(����ȣ, ����̸�, ����)
-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)

drop table �⿬;
drop table ��ȭ;
drop table ���;

create table ��ȭ (
    ��ȭ�ڵ� char(4) NOT NULL PRIMARY KEY ,
    ��ȭ���� varchar(50) NOT NULL ,
    �帣 varchar(50) ,
    �������� int ,
    �󿵽ð� int 
);
insert into ��ȭ values('MC01','���ӽ�ĵ��','�ڹ̵�',12,108);
insert into ��ȭ values('MC02','�������α׳�','�ڹ̵�',15,122);
insert into ��ȭ values('MD01','Ű�ٸ�������','���',12,110);
insert into ��ȭ values('MD02','�ٺ�','���',12,99);

create table ��� (
    ����ȣ char(4) NOT NULL PRIMARY KEY ,
    ����̸� varchar(18) NOT NULL ,
    ���� char(3) 
);
insert into ��� values('a001','������','��');
insert into ��� values('a002','������','��');

create table �⿬ (
    �Ϸù�ȣ int ,
    ��ȭ�ڵ� char(4) NOT NULL ,
    ����ȣ char(4) NOT NULL , 
    �⿬�� int ,
    CONSTRAINT PK_�⿬_�Ϸù�ȣ PRIMARY KEY(�Ϸù�ȣ) ,
    FOREIGN KEY(��ȭ�ڵ�) REFERENCES ��ȭ(��ȭ�ڵ�) ,
    FOREIGN KEY(����ȣ) REFERENCES ���(����ȣ)
);
insert into �⿬ values(1,'MC01','a001',1000);
insert into �⿬ values(2,'MC02','a001',700);
insert into �⿬ values(3,'MD01','a002',400);
insert into �⿬ values(4,'MD02','a001',600);
insert into �⿬ values(5,'MD02','a002',600);
?
select * from ��ȭ;
select * from ���;
select * from �⿬;


-- 1) �帣�� �ڹ̵��̰ų� ����� ��ȭ����, �帣�� �˻��϶�(IN ���)
SELECT  ��ȭ����, �帣
FROM    ��ȭ
WHERE   �帣='�ڹ̵�' or �帣='���';

SELECT  ��ȭ����, �帣
FROM    ��ȭ
WHERE   �帣 in ('�ڹ̵�','���');


-- 1-1) �帣�� �ڹ̵��̰ų� ��󸶰� �ƴ� ��ȭ����, �帣�� �˻��϶�
SELECT  ��ȭ����, �帣
FROM    ��ȭ
WHERE   �帣<>'�ڹ̵�' and �帣<>'���';

SELECT  ��ȭ����, �帣
FROM    ��ȭ
WHERE   �帣 not in ('�ڹ̵�','���');


-- 2) �帣�� �ְ� �󿵽ð��� �˻��϶�
SELECT   �帣, MAX(�󿵽ð�)
FROM     ��ȭ
GROUP BY �帣;


-- 3) ��ȭ���� '������'�� ���� ��� ���� �˻��϶�
SELECT   *
FROM     ��ȭ
WHERE    ��ȭ���� like '%������%';


-- 4) ������ ���� ����ȣ, ����̸��� ����̸��� ������������ �˻��϶�
SELECT   ����ȣ, ����̸�
FROM     ���
WHERE    ����='��'
ORDER BY ����̸� ASC;


-- 5) �⿬�ᰡ 500���� 1000�� ��ȭ�ڵ�, ����ȣ, �⿬�� �˻��϶�
SELECT   ��ȭ�ڵ�, ����ȣ, �⿬��
FROM     �⿬
WHERE    �⿬�� >= 500 and �⿬�� <= 1000;


-- 6) ���� SQL������ �������� �ۼ��ϰ� ������ ����
SELECT   COUNT(�帣), COUNT(DISTINCT �帣)
FROM     ��ȭ;
/* count(�帣)�� ��ü ���ڵ��� ���� ��ȯ,
    count(distinct �帣)�� �ߺ�����, �帣 ������ ������ ��ȯ*/


-- 7) �������� �⿬�� ��ȭ�� �⿬�Ḧ �˻��϶�
SELECT   ���.����̸�, �⿬.�⿬��
FROM     �⿬, ���
WHERE    ����̸�='������';


-- 8) ��ȭ 'Ű�ٸ�������'�� �帣�� '������', ���������� 15�� �����϶�
UPDATE   ��ȭ
SET      �帣='������', ��������=15
WHERE    ��ȭ����='Ű�ٸ�������';

SELECT * FROM ��ȭ;

/* =============================================== */