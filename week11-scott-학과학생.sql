=======================

-- (Oracle)

?

-- �а�(�а��ڵ�, �а���)

-- �л�(�й�, �̸�, �а��ڵ�)

?

drop table �л�;

drop table �а�;

?

CREATE TABLE �а� (

   �а��ڵ� char(4) NOT NULL ,

   �а��� varchar(30) ,

   CONSTRAINT pk_�а�_�а��ڵ� PRIMARY KEY(�а��ڵ�)

);

?

CREATE TABLE �л� (

   �й� char(3) NOT NULL ,

   �̸� varchar(10) ,

   �а��ڵ� char(4) ,

   CONSTRAINT pk_�л�_�й� PRIMARY KEY(�й�) ,

   CONSTRAINT fk_�л�_�а��ڵ� FOREIGN KEY (�а��ڵ�) 

   REFERENCES �а�(�а��ڵ�)

);

?

-- �а�(�а��ڵ�, �а���)

-- �л�(�й�, �̸�, �а��ڵ�)

?

insert into �а� values('1001','��ǻ���а�');

insert into �а� values('2001','ü���а�');

?

insert into �л� values('501','������','1001');

insert into �л� values('401','�迬��','2001');

insert into �л� values('402','��̶�','2001');

insert into �л� values('502','�߽ż�','1001');

?

COL �а��ڵ� FOR a8

COL �а��� FOR a10

COL �й� FOR a4

COL �̸� FOR a10

?

select * from �а�;

select * from �л�;

/*------------------------------------------------------------------------*/

-- �а�2(�а��ڵ�, �а���)

-- �л�2(�й�, �̸�, �а��ڵ�)

drop table �л�2;

drop table �а�2;

?

CREATE TABLE �а�2 (

    �а��ڵ� char(4) NOT NULL ,

    �а��� varchar(30) ,

    CONSTRAINT pk_�а�2_�а��ڵ� PRIMARY KEY(�а��ڵ�)

);

?

CREATE TABLE �л�2 (

    �й� char(3) NOT NULL ,

    �̸� varchar(10) ,

    �а��ڵ� char(4) ,

    CONSTRAINT pk_�л�2_�й� PRIMARY KEY(�й�) ,

    CONSTRAINT fk_�л�2_�а��ڵ� FOREIGN KEY (�а��ڵ�) 

    REFERENCES �а�2(�а��ڵ�) /* 2���̴� �� ����� ���� */

    ON DELETE CASCADE

);

?

insert into �а�2 values('1001','��ǻ���а�');

insert into �а�2 values('2001','ü���а�');

?

insert into �л�2 values('501','������','1001');

insert into �л�2 values('401','�迬��','2001');

insert into �л�2 values('402','��̶�','2001');

insert into �л�2 values('502','�߽ż�','1001');

?

select * from �а�2;

select * from �л�2;

/*------------------------------------------------------------------------*/

-- �а�3(�а��ڵ�, �а���)

-- �л�3(�й�, �̸�, �а��ڵ�)

drop table �л�3;

drop table �а�3;

?

CREATE TABLE �а�3 (

    �а��ڵ� char(4) NOT NULL ,

    �а��� varchar(30) ,

    CONSTRAINT pk_�а�3_�а��ڵ� PRIMARY KEY(�а��ڵ�)

);

?

CREATE TABLE �л�3 (

    �й� char(3) NOT NULL ,

    �̸� varchar(10) ,

    �а��ڵ� char(4) ,

    CONSTRAINT pk_�л�3_�й� PRIMARY KEY(�й�) ,

    CONSTRAINT fk_�л�3_�а��ڵ� FOREIGN KEY (�а��ڵ�) 

    REFERENCES �а�3(�а��ڵ�)

    ON DELETE SET NULL

);

?

insert into �а�3 values('1001','��ǻ���а�');

insert into �а�3 values('2001','ü���а�');

?

insert into �л�3 values('501','������','1001');

insert into �л�3 values('401','�迬��','2001');

insert into �л�3 values('402','��̶�','2001');

insert into �л�3 values('502','�߽ż�','1001');

?

select * from �а�3;

select * from �л�3;

?

/*------------------------------------------------------------------------*/

--(Oracle)

?

select * from �а�;

select * from �л�;

?

--1) ����(RECTRICT) �� ���

?

--���� (������?)

UPDATE �а�

SET �а��ڵ� = 'A001'

WHERE �а��ڵ� = '1001';

?

--���� (������?)

DELETE 

FROM �а�

WHERE �а��ڵ� = '2001';

?

2) ����(CASCADE)�� ��� --> update�� ������, delete�� ����

?

-- ������ ���డ���Ѱ�?

?

-- (Oracle)

select * from �а�2;

select * from �л�2;

?

--2) ����(CASCADE) �� ���

?

--���� (������?)

UPDATE �а�2

SET �а��ڵ� = 'A001'

WHERE �а��ڵ� = '1001';

?

--��������?

DELETE 

FROM �а�2

WHERE �а��ڵ� = '2001';

?

-- 3) �� ������ ��ü(SET NULL) �� ���

--���� (������?)

UPDATE �а�3

SET �а��ڵ� = 'A001'

WHERE �а��ڵ� = '1001';

?

-- ���� ����? (SET NULL ����)

DELETE 

FROM �а�3

WHERE �а��ڵ� = '1001';

?

select * from �а�3;

select * from �л�3;

/*------------------------------------------------------------------------*/

--[ex08-02] view

-- view

-- emp(empid,ename,dept,hire_date,birthdaty.address,job,salary)

drop table emp;

?

CREATE TABLE EMP ( 

    empid int NOT NULL ,

    ename char(20) ,

    dept varchar(9) ,

    hire_date char(10) ,

    birthday char(10) ,

    Address varchar(30) ,

    job char(20) ,

    salary int ,

    PRIMARY KEY(empid)

);

?

INSERT INTO emp VALUES(1001,'ȫ����','������','2001-02-01','1985-10-12','���� �븲��','Ư������',350);

INSERT INTO emp VALUES(1002,'������','������','1999-01-01','1984-09-10','�Ⱦ� �����','��������',400);

INSERT INTO emp VALUES(1003,'�赿��','�����','2000-09-01','1986-05-16','�λ� ���ϵ�','ǰ������',300);

INSERT INTO emp VALUES(1004,'�����','�λ��','1997-02-01','1982-04-10','�뱸 �޼���','�޿�',450);

INSERT INTO emp VALUES(1005,'�ڼ���','���ź�','2000-02-01','1986-12-04','���� �ݳ���','��������',320);

?

select * from emp;

?

CREATE VIEW view_emp1

as

SELECT empid, ename, hire_date, salary

FROM emp;

?

select * from view_emp1; 

?

select * from emp;

?

-- �� �Է�

--view_emp1(empid,ename,hire_date,salary)

?

-- ###(������ Ȯ��)

?

-- �� ��ȸ

select * from view_emp1; 

?

-- ���̺� ��ȸ

select * from emp;

?

/*------------------------------------------------------------------------*/

--[ex08-03]

drop table �⿬;

drop table ��ȭ;

drop table ���;

?

-- ��ȭ(��ȭ�ڵ�, ��ȭ����, �帣, ��������, �󿵽ð�)

-- ���(����ȣ, ����̸�, ����)

-- �⿬(�Ϸù�ȣ, ��ȭ�ڵ�, ����ȣ, �⿬��)

?

create table ��ȭ (

    ��ȭ�ڵ� char(4) NOT NULL PRIMARY KEY ,

    ��ȭ���� varchar(50) NOT NULL ,

    �帣 varchar(50) ,

    �������� int ,

    �󿵽ð� int 

);

?

insert into ��ȭ values('MC01','���ӽ�ĵ��','�ڹ̵�',12,108);

insert into ��ȭ values('MC02','�������α׳�','�ڹ̵�',15,122);

insert into ��ȭ values('MD01','Ű�ٸ�������','���',12,110);

insert into ��ȭ values('MD02','�ٺ�','���',12,99);

?

create table ��� (

    ����ȣ char(4) NOT NULL PRIMARY KEY ,

    ����̸� varchar(8) NOT NULL ,

    ���� char(3) 

);

?

insert into ��� values('a001','������','��');

insert into ��� values('a002','������','��');

?

create table �⿬ (

    �Ϸù�ȣ int ,

    ��ȭ�ڵ� char(4) NOT NULL ,

    ����ȣ char(4) NOT NULL , 

    �⿬�� int ,

    CONSTRAINT PK_�⿬_�Ϸù�ȣ PRIMARY KEY(�Ϸù�ȣ) ,

    FOREIGN KEY(��ȭ�ڵ�) REFERENCES ��ȭ�ڵ�(��ȣ) ,

    FOREIGN KEY(����ȣ) REFERENCES ����ȣ(��ȣ) ,

);

?

insert into �⿬ values('MC01','a001',1000);

insert into �⿬ values('MC02','a001',700);

insert into �⿬ values('MD01','a002',400);

insert into �⿬ values('MD02','a001',600);

insert into �⿬ values('MD02','a002',600);

?

-- 1) �帣�� �ڹ̵� �̰ų� ��� �� ��ȭ����, �帣�� �˻��϶�(IN ���)

-- 2) �帣�� �ְ� �󿵽ð��� �˻��϶�

-- 3) ��ȭ���� '������'�� ���� ��� ���� �˻��϶�

-- 4) ������ ���� ����ȣ, ����̸��� ����̸��� ������������ �˻��϶�

-- 5) �⿬�ᰡ 500���� 1000�� ��ȭ�ڵ�, ����ȣ, �⿬�� �˻��϶�

-- 6) ���� SQL������ �������� �ۼ��ϰ� ������ ����

SELECT COUNT(�帣), COUNT(DISTINCT �帣)

FROM ��ȭ

?

-- 7) �������� �⿬�� ��ȭ�� �⿬�Ḧ �˻��϶�

?

-- 8) ��ȭ 'Ű�ٸ�������'�� �帣�� '������', ���������� 15 �� �����϶�

?

/*------------------------------------------------------------------------*/

-- [Quiz08-04] ����ó�������� �ʱ�

-- ����(�����ȣ, ����)

-- �λ�(����, �Ҽ�, �����ȣ)

?

drop table �λ�;

drop table ����;

?

CREATE TABLE ���� (

    �����ȣ CHAR(2) NOT NULL ,

    ���� CHAR(1) NULL ,

    PRIMARY KEY (�����ȣ)

);

?

CREATE TABLE �λ� (

    ���� nvarchar2(3) NOT NULL ,

    �Ҽ� nvarchar2(3) NULL ,

    �����ȣ CHAR(2) NULL ,

    PRIMARY KEY (����) ,

    FOREIGN KEY (�����ȣ) REFERENCES ���� (�����ȣ) 

    ON DELETE SET NULL

);

?

insert into ���� values('23','A');

insert into ���� values('25','B');

insert into ���� values('43','C');

insert into ���� values('56','D');

?

insert into �λ� values('���̼�','�ѹ���','25');

insert into �λ� values('������','�����','56');

insert into �λ� values('������','������','23');

insert into �λ� values('������','������','43');

?

select * from ����;

select * from �λ�;

/*------------------------------------------------------------------------*/

-- [Quiz08-03] ����ó�������� �ʱ�

-- ����(�����ȣ, ����)

-- �λ�(����, �Ҽ�, �����ȣ)

?

-- 1) ����, �Ҽ�, ���������� �˻��϶�

SELECT ����, �Ҽ�, ���� as ��������

FROM ����, �λ�

WHERE ����.�����ȣ = �λ�.�����ȣ;

?

-- 2) �������� ����, �Ҽ�, ���������� �˻��϶�

SELECT ����, �Ҽ�, ���� as ��������

FROM ����, �λ�

WHERE ����.�����ȣ = �λ�.�����ȣ

AND ���� = '������';

?

-- [Quiz08-04] ����ó�������� �ʱ�

-- ����(�����ȣ, ����)

-- �λ�(����, �Ҽ�, �����ȣ)

?

select ����

from ����

where �����ȣ = (select �����ȣ from �λ� where ����='������');

?

-- �̸� �߿� '��' �� ���� ����� ����, �ҼӰ� ���� ������ �˻��϶�

?

select t.����, t.�Ҽ�, ����

from (select ����, �Ҽ�, �����ȣ from �λ� where ���� LIKE '%��%') as t, ����

where t.�����ȣ = ����.�����ȣ;

/*------------------------------------------------------------------------*/