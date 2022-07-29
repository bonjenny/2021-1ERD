
/* ================ week11-ex08-02.sql ================ */

-- 02) Quiz08-02

DROP TABLE R;
/* CHECK: SALARY 4000 이하만 입력 가능 */
CREATE TABLE R
(
    NAME   VARCHAR(20)  PRIMARY KEY ,
    SALARY  INTEGER         CHECK(SALARY <= 4000)
);

-- R(NAME, SALARY)
INSERT INTO R VALUES('KIM', 1000);
INSERT INTO R VALUES('LEE', 2000);
INSERT INTO R VALUES('PARK', 3000);

-- 이 릴레이션 R에 대하여 아래의 순서로 SQL문을 수행하였다.
-- 이들 중에서 일부는 릴레이션에 정의된 제약조건 때문에 거절될 수 있다.

INSERT INTO R VALUES('CHOI', 1200);
UPDATE R SET SALARY=5000 WHERE NAME='PARK'; /* 요청 거절, 도메인 제약조건 위배 */
INSERT INTO R VALUES('KIM', 1300); /* 요청 거절, PK 중복 */
DELETE FROM R WHERE NAME='LEE';


-- 릴레이션 R에 들어 있는 모든 튜플들의 SALARY의 합은 얼마인가?
SELECT   SUM(SALARY)
FROM     R;

/* =============================================== */