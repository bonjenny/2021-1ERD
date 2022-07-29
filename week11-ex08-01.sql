
/* ================ week11-ex08-01.sql ================ */

-- 01) Quiz08-01

DROP TABLE R;
DROP TABLE S;
DROP TABLE T;

-- 3���� ���̺� T, S, R ���� �ۼ��ϴ� CREATE TABLE ������ �� ��ġ�� �Է��ϼ���
CREATE TABLE T
(
    C int NOT NULL ,
    D int ,
    CONSTRAINT pk_T_C PRIMARY KEY(C)
);

CREATE TABLE S
(
    B int NOT NULL ,
    C int ,
    CONSTRAINT pk_S_B PRIMARY KEY(B) ,
    CONSTRAINT fk_S_C FOREIGN KEY(C) REFERENCES T(C)
      ON DELETE CASCADE
);

CREATE TABLE R
(
    A int NOT NULL ,
    B int ,
    CONSTRAINT pk_R_A PRIMARY KEY(A) ,
    CONSTRAINT fk_R_B FOREIGN KEY(B) REFERENCES S(B)
      ON DELETE SET NULL
);


INSERT into T values(1,1);
INSERT into T values(2,1);

INSERT into S values(1,1);
INSERT into S values(2,1);

INSERT into R values(1,1);
INSERT into R values(2,2);


-- ���� ������ ������ ���� �����̼� R���� � Ʃ�õ��� �ִ°�?
DELETE FROM T;
select * from R;

/* =============================================== */