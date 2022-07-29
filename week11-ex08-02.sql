
/* ================ week11-ex08-02.sql ================ */

-- 02) Quiz08-02

DROP TABLE R;
/* CHECK: SALARY 4000 ���ϸ� �Է� ���� */
CREATE TABLE R
(
    NAME   VARCHAR(20)  PRIMARY KEY ,
    SALARY  INTEGER         CHECK(SALARY <= 4000)
);

-- R(NAME, SALARY)
INSERT INTO R VALUES('KIM', 1000);
INSERT INTO R VALUES('LEE', 2000);
INSERT INTO R VALUES('PARK', 3000);

-- �� �����̼� R�� ���Ͽ� �Ʒ��� ������ SQL���� �����Ͽ���.
-- �̵� �߿��� �Ϻδ� �����̼ǿ� ���ǵ� �������� ������ ������ �� �ִ�.

INSERT INTO R VALUES('CHOI', 1200);
UPDATE R SET SALARY=5000 WHERE NAME='PARK'; /* ��û ����, ������ �������� ���� */
INSERT INTO R VALUES('KIM', 1300); /* ��û ����, PK �ߺ� */
DELETE FROM R WHERE NAME='LEE';


-- �����̼� R�� ��� �ִ� ��� Ʃ�õ��� SALARY�� ���� ���ΰ�?
SELECT   SUM(SALARY)
FROM     R;

/* =============================================== */