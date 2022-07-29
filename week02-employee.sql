/* employee 테이블 */
-- (employee.sql)

-- employee(empno, ename, dept, tel, salary)

DROP TABLE employee;

CREATE TABLE employee (
	empno	int	NOT NULL,
	ename	varchar(20),
	dept	varchar(10),
	tel	int,
	salary	int,
	PRIMARY KEY(empno)
);

-- employee(empno, ename, dept, tel, salary)
INSERT INTO employee VALUES(100,'김기훈','영업',1241,200);
INSERT INTO employee VALUES(101,'홍성범','기획',5621,200);
INSERT INTO employee VALUES(102,'이만수','영업',5251,250);
INSERT INTO employee VALUES(103,'강나미','생산',1231,300);

COMMIT;

-- text모드로 테이블을 보여줄 경우 'ename'이 너무 길기 때문에 3자만 보여달라는 명령
COL ename FORMAT a3

SELECT * FROM employee;