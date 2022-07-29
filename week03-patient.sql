
-- week03-patient.sql
DROP TABLE 환자 PURGE;
DROP TABLE 질병 PURGE;

-- 질병(질병코드, 질병명, 증상)
CREATE TABLE 질병 (
	질병코드             CHAR(4) NOT NULL ,
	질병명               VARCHAR(30) NULL ,
	증상                 VARCHAR(50) NULL ,
	PRIMARY KEY (질병코드)
);

-- 환자(환자번호, 이름, 질병코드, 나이)
CREATE TABLE 환자 (
	환자번호             CHAR(5) NOT NULL ,
	이름                 VARCHAR(18) NULL ,
	질병코드             CHAR(4) NULL ,
	나이                 INT NULL ,
	PRIMARY KEY (환자번호) ,
	FOREIGN KEY (질병코드) REFERENCES 질병(질병코드)
);

-- 질병(질병코드, 질병명, 증상)
insert into 질병 values ('A01','뇌졸증','어지럼증');
insert into 질병 values ('A02','콜레라','설사');
insert into 질병 values ('A03','기관지염','발열');
insert into 질병 values ('A04','장티푸스','발열');

-- 환자(환자번호, 이름, 질병코드, 나이)
insert into 환자 values ('P1001','김철수','A01',30);
insert into 환자 values ('P1002','양길현','A03',29);
insert into 환자 values ('P1003','임영수','A01',50);
insert into 환자 values ('Q1001','박한나','A04',40);

/*
desc 질병
desc 환자

COL 질병명 FOR a10
COL 증상 FOR a15
COL 이름 FOR a8
COL 나이 FOR 999
*/

select * from 질병;
select * from 환자;

-- 5) 증상이 발열인 질병코드와 질병명, 증상을 조회하라
SELECT 질병코드, 질병명, 증상
FROM 질병
WHERE 증상 = '발열';

-- 6) 양길현의 이름과 환자번호, 나이를 조회하라
SELECT 환자번호, 이름, 나이
FROM 환자
WHERE 이름 = '양길현';
