
-- week03-empdept.sql
DROP TABLE emp PURGE;
DROP TABLE dept PURGE;

-- dept(deptid, dname, budget)
CREATE TABLE dept (
	deptid               INT NOT NULL ,
	dname               CHAR(20) NULL ,
	budget               INT NULL,
	PRIMARY KEY (deptid)
);

-- emp(empid, ename, deptid, hire_date, job, salary)
CREATE TABLE emp (
	empid                INT NOT NULL ,
	ename                VARCHAR(20) NULL ,
	deptid               INT NULL ,
	hire_date            DATE NULL ,
	job                  VARCHAR(20) NULL ,
	salary               INT NULL ,
	PRIMARY KEY (empid) ,
	FOREIGN KEY (deptid) REFERENCES dept (deptid)
);

-- dept(deptid, dname, budget)
insert into dept values (100,'영업부',100);
insert into dept values (200,'관리부',300);
insert into dept values (300,'구매부',220);
insert into dept values (400,'생산부',500);

-- emp(empid, ename, deptid, hire_date, job, salary)
insert into emp values (1001, '홍성길',100,'2001-02-01','특수영업',350);
insert into emp values (1002, '곽희준',100,'1999-01-01','영업관리',400);
insert into emp values (1003, '김동준',200,'2000-09-01','품질관리',300);
insert into emp values (1004, '성재규',300,'1997-02-01','급여',450);
insert into emp values (1005, '박성범',200,'2000-02-01','수입자재',320);

/*
COL deptid FOR 999
COL dname FOR a10
COL budget FOR 9999

COL empid FOR 9999
COL ename FOR a10
COL deptid FOR 999
COL hire_date FOR a10
COL job FOR a10
COL salary FOR 9999
*/

select * from dept;
select * from emp;
