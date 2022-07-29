
/* ================ week11-학과학생1.sql ================ */

-- 1) 제한(RECTRICT) 인 경우
-- 학과(학과코드, 학과명)
-- 학생(학번, 이름, 학과코드)

drop table 학생;
drop table 학과;

CREATE TABLE 학과 (
   학과코드 char(4) NOT NULL ,
   학과명 varchar(30) ,
   CONSTRAINT pk_학과_학과코드 PRIMARY KEY(학과코드)
);

CREATE TABLE 학생 (
   학번 char(3) NOT NULL ,
   이름 varchar(10) ,
   학과코드 char(4) ,
   CONSTRAINT pk_학생_학번 PRIMARY KEY(학번) ,
   CONSTRAINT fk_학생_학과코드 FOREIGN KEY (학과코드) 
   REFERENCES 학과(학과코드)
);

-- 학과(학과코드, 학과명)
-- 학생(학번, 이름, 학과코드)

insert into 학과 values('1001','컴퓨터학과');
insert into 학과 values('2001','체육학과');

insert into 학생 values('501','박지성','1001');
insert into 학생 values('401','김연아','2001');
insert into 학생 values('402','장미란','2001');
insert into 학생 values('502','추신수','1001');

COL 학과코드 FOR a8
COL 학과명 FOR a10
COL 학번 FOR a4
COL 이름 FOR a10

select * from 학과;
select * from 학생;


--1) 제한(RECTRICT) 인 경우
-- 김연아가 체육학과에서 컴퓨터학과로 전과
update 학생
set 학과코드='1001' /* 3001로 바꾸는 것은 불가능, 참조무결성제약조건 위배 */
where 이름='김연아';

--오류 (이유는?) : 이미 학생테이블에서 참조되고 있기 때문
UPDATE 학과
SET 학과코드 = 'A001'
WHERE 학과코드 = '1001';

--오류 (이유는?) : 이미 학생테이블에서 참조되고 있기 때문
DELETE 
FROM 학과
WHERE 학과코드 = '2001';

/* =============================================== */