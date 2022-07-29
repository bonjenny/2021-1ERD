
/* ================ week11-ex08-02view.sql ================ */

-- 02) Quiz08-02 view
-- emp(empid,ename,dept,hire_date,birthdaty.address,job,salary)
drop table emp;

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

INSERT INTO emp VALUES(1001,'홍성길','영업부','2001-02-01','1985-10-12','서울 대림동','특수영업',350);
INSERT INTO emp VALUES(1002,'곽희준','영업부','1999-01-01','1984-09-10','안양 용봉동','영업관리',400);
INSERT INTO emp VALUES(1003,'김동준','생산부','2000-09-01','1986-05-16','부산 대하동','품질관리',300);
INSERT INTO emp VALUES(1004,'성재규','인사부','1997-02-01','1982-04-10','대구 달성동','급여',450);
INSERT INTO emp VALUES(1005,'박성범','구매부','2000-02-01','1986-12-04','광주 금남동','수입자재',320);

SELECT *
FROM emp;

CREATE VIEW view_emp1
as
SELECT empid, ename, hire_date, salary
FROM emp;

select * from view_emp1;
select * from emp;


-- 뷰 입력
--view_emp1(empid,ename,hire_date,salary)
INSERT INTO view_emp1
VALUES('9999','김복기','2020-03-16',500);

-- 뷰 조회
select * from view_emp1;

-- 테이블 조회
select * from emp;
/* 몇몇 필드가 null로 채워짐, pk제약조건 주의 */

/* =============================================== */