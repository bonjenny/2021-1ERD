drop table employee purge;

 create table employee (
  empno char(3) NOT NULL ,
  ename varchar(12) ,
  dept varchar(18) ,
  tel char(4) ,
  salary int ,
  PRIMARY KEY(empno)
);

 -- employee(empno, ename, dept, tel, salary)
insert into employee values('100', '김기훈', '영업', '1241', 200);
insert into employee values('101', '홍성범', '기획', '5621', 200);
insert into employee values('102', '이만수', '영업', '5251', 250);
insert into employee values('103', '김나미', '생산', '1231', 300);

select * from employee;

/*
EMPNO  ENAME      DEPT     TEL      SALARY
------ ---------- -------- -------- ------
100    김기훈     영업     1241        200
101    홍성범     기획     5621        200
102    이만수     영업     5251        250
103    김나미     생산     1231        300
*/

-- desc employee

-- COL ename FOR a10
-- COL salary FOR 9999
-- COL dept FOR a8

commit;

-- employee (empno, ename, dept, tel, salary)
-- QUIZ. 영업부에 속한 모든 사원의 이름과 전화번호를 조회하라
SELECT      ename, tel
FROM        employee
WHERE       dept = '영업';