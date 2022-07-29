=======================

-- (Oracle)

?

-- 학과(학과코드, 학과명)

-- 학생(학번, 이름, 학과코드)

?

drop table 학생;

drop table 학과;

?

CREATE TABLE 학과 (

   학과코드 char(4) NOT NULL ,

   학과명 varchar(30) ,

   CONSTRAINT pk_학과_학과코드 PRIMARY KEY(학과코드)

);

?

CREATE TABLE 학생 (

   학번 char(3) NOT NULL ,

   이름 varchar(10) ,

   학과코드 char(4) ,

   CONSTRAINT pk_학생_학번 PRIMARY KEY(학번) ,

   CONSTRAINT fk_학생_학과코드 FOREIGN KEY (학과코드) 

   REFERENCES 학과(학과코드)

);

?

-- 학과(학과코드, 학과명)

-- 학생(학번, 이름, 학과코드)

?

insert into 학과 values('1001','컴퓨터학과');

insert into 학과 values('2001','체육학과');

?

insert into 학생 values('501','박지성','1001');

insert into 학생 values('401','김연아','2001');

insert into 학생 values('402','장미란','2001');

insert into 학생 values('502','추신수','1001');

?

COL 학과코드 FOR a8

COL 학과명 FOR a10

COL 학번 FOR a4

COL 이름 FOR a10

?

select * from 학과;

select * from 학생;

/*------------------------------------------------------------------------*/

-- 학과2(학과코드, 학과명)

-- 학생2(학번, 이름, 학과코드)

drop table 학생2;

drop table 학과2;

?

CREATE TABLE 학과2 (

    학과코드 char(4) NOT NULL ,

    학과명 varchar(30) ,

    CONSTRAINT pk_학과2_학과코드 PRIMARY KEY(학과코드)

);

?

CREATE TABLE 학생2 (

    학번 char(3) NOT NULL ,

    이름 varchar(10) ,

    학과코드 char(4) ,

    CONSTRAINT pk_학생2_학번 PRIMARY KEY(학번) ,

    CONSTRAINT fk_학생2_학과코드 FOREIGN KEY (학과코드) 

    REFERENCES 학과2(학과코드) /* 2붙이는 것 까먹지 말것 */

    ON DELETE CASCADE

);

?

insert into 학과2 values('1001','컴퓨터학과');

insert into 학과2 values('2001','체육학과');

?

insert into 학생2 values('501','박지성','1001');

insert into 학생2 values('401','김연아','2001');

insert into 학생2 values('402','장미란','2001');

insert into 학생2 values('502','추신수','1001');

?

select * from 학과2;

select * from 학생2;

/*------------------------------------------------------------------------*/

-- 학과3(학과코드, 학과명)

-- 학생3(학번, 이름, 학과코드)

drop table 학생3;

drop table 학과3;

?

CREATE TABLE 학과3 (

    학과코드 char(4) NOT NULL ,

    학과명 varchar(30) ,

    CONSTRAINT pk_학과3_학과코드 PRIMARY KEY(학과코드)

);

?

CREATE TABLE 학생3 (

    학번 char(3) NOT NULL ,

    이름 varchar(10) ,

    학과코드 char(4) ,

    CONSTRAINT pk_학생3_학번 PRIMARY KEY(학번) ,

    CONSTRAINT fk_학생3_학과코드 FOREIGN KEY (학과코드) 

    REFERENCES 학과3(학과코드)

    ON DELETE SET NULL

);

?

insert into 학과3 values('1001','컴퓨터학과');

insert into 학과3 values('2001','체육학과');

?

insert into 학생3 values('501','박지성','1001');

insert into 학생3 values('401','김연아','2001');

insert into 학생3 values('402','장미란','2001');

insert into 학생3 values('502','추신수','1001');

?

select * from 학과3;

select * from 학생3;

?

/*------------------------------------------------------------------------*/

--(Oracle)

?

select * from 학과;

select * from 학생;

?

--1) 제한(RECTRICT) 인 경우

?

--오류 (이유는?)

UPDATE 학과

SET 학과코드 = 'A001'

WHERE 학과코드 = '1001';

?

--오류 (이유는?)

DELETE 

FROM 학과

WHERE 학과코드 = '2001';

?

2) 연쇄(CASCADE)인 경우 --> update는 미지원, delete는 지원

?

-- 다음은 실행가능한가?

?

-- (Oracle)

select * from 학과2;

select * from 학생2;

?

--2) 연쇄(CASCADE) 인 경우

?

--오류 (이유는?)

UPDATE 학과2

SET 학과코드 = 'A001'

WHERE 학과코드 = '1001';

?

--실행결과는?

DELETE 

FROM 학과2

WHERE 학과코드 = '2001';

?

-- 3) 널 값으로 대체(SET NULL) 인 경우

--오류 (이유는?)

UPDATE 학과3

SET 학과코드 = 'A001'

WHERE 학과코드 = '1001';

?

-- 삭제 가능? (SET NULL 설정)

DELETE 

FROM 학과3

WHERE 학과코드 = '1001';

?

select * from 학과3;

select * from 학생3;

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

INSERT INTO emp VALUES(1001,'홍성길','영업부','2001-02-01','1985-10-12','서울 대림동','특수영업',350);

INSERT INTO emp VALUES(1002,'곽희준','영업부','1999-01-01','1984-09-10','안양 용봉동','영업관리',400);

INSERT INTO emp VALUES(1003,'김동준','생산부','2000-09-01','1986-05-16','부산 대하동','품질관리',300);

INSERT INTO emp VALUES(1004,'성재규','인사부','1997-02-01','1982-04-10','대구 달성동','급여',450);

INSERT INTO emp VALUES(1005,'박성범','구매부','2000-02-01','1986-12-04','광주 금남동','수입자재',320);

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

-- 뷰 입력

--view_emp1(empid,ename,hire_date,salary)

?

-- ###(동영상 확인)

?

-- 뷰 조회

select * from view_emp1; 

?

-- 테이블 조회

select * from emp;

?

/*------------------------------------------------------------------------*/

--[ex08-03]

drop table 출연;

drop table 영화;

drop table 배우;

?

-- 영화(영화코드, 영화제목, 장르, 관람기준, 상영시간)

-- 배우(배우번호, 배우이름, 성별)

-- 출연(일련번호, 영화코드, 배우번호, 출연료)

?

create table 영화 (

    영화코드 char(4) NOT NULL PRIMARY KEY ,

    영화제목 varchar(50) NOT NULL ,

    장르 varchar(50) ,

    관람기준 int ,

    상영시간 int 

);

?

insert into 영화 values('MC01','과속스캔들','코미디',12,108);

insert into 영화 values('MC02','엽기적인그녀','코미디',15,122);

insert into 영화 values('MD01','키다리아저씨','드라마',12,110);

insert into 영화 values('MD02','바보','드라마',12,99);

?

create table 배우 (

    배우번호 char(4) NOT NULL PRIMARY KEY ,

    배우이름 varchar(8) NOT NULL ,

    성별 char(3) 

);

?

insert into 배우 values('a001','차태현','남');

insert into 배우 values('a002','하지원','여');

?

create table 출연 (

    일련번호 int ,

    영화코드 char(4) NOT NULL ,

    배우번호 char(4) NOT NULL , 

    출연료 int ,

    CONSTRAINT PK_출연_일련번호 PRIMARY KEY(일련번호) ,

    FOREIGN KEY(영화코드) REFERENCES 영화코드(번호) ,

    FOREIGN KEY(배우번호) REFERENCES 배우번호(번호) ,

);

?

insert into 출연 values('MC01','a001',1000);

insert into 출연 values('MC02','a001',700);

insert into 출연 values('MD01','a002',400);

insert into 출연 values('MD02','a001',600);

insert into 출연 values('MD02','a002',600);

?

-- 1) 장르가 코미디 이거나 드라마 인 영화제목, 장르를 검색하라(IN 사용)

-- 2) 장르별 최고 상영시간을 검색하라

-- 3) 영화제목에 '아저씨'가 들어가는 모든 정보 검색하라

-- 4) 성별이 남인 배우번호, 배우이름을 배우이름의 오름차순으로 검색하라

-- 5) 출연료가 500에서 1000인 영화코드, 배우번호, 출연료 검색하라

-- 6) 다음 SQL문법의 실행결과를 작성하고 간략히 설명

SELECT COUNT(장르), COUNT(DISTINCT 장르)

FROM 영화

?

-- 7) 차태현이 출연한 영화의 출연료를 검색하라

?

-- 8) 영화 '키다리아저씨'의 장르를 '스릴러', 관람기준을 15 로 수정하라

?

/*------------------------------------------------------------------------*/

-- [Quiz08-04] 정보처리산업기사 필기

-- 차량(사원번호, 종류)

-- 인사(성명, 소속, 사원번호)

?

drop table 인사;

drop table 차량;

?

CREATE TABLE 차량 (

    사원번호 CHAR(2) NOT NULL ,

    종류 CHAR(1) NULL ,

    PRIMARY KEY (사원번호)

);

?

CREATE TABLE 인사 (

    성명 nvarchar2(3) NOT NULL ,

    소속 nvarchar2(3) NULL ,

    사원번호 CHAR(2) NULL ,

    PRIMARY KEY (성명) ,

    FOREIGN KEY (사원번호) REFERENCES 차량 (사원번호) 

    ON DELETE SET NULL

);

?

insert into 차량 values('23','A');

insert into 차량 values('25','B');

insert into 차량 values('43','C');

insert into 차량 values('56','D');

?

insert into 인사 values('김이순','총무과','25');

insert into 인사 values('박이준','자재과','56');

insert into 인사 values('이형수','영업과','23');

insert into 인사 values('오영우','보육과','43');

?

select * from 차량;

select * from 인사;

/*------------------------------------------------------------------------*/

-- [Quiz08-03] 정보처리산업기사 필기

-- 차량(사원번호, 종류)

-- 인사(성명, 소속, 사원번호)

?

-- 1) 성명, 소속, 차량종류를 검색하라

SELECT 성명, 소속, 종류 as 차량종류

FROM 차량, 인사

WHERE 차량.사원번호 = 인사.사원번호;

?

-- 2) 박이준의 성명, 소속, 차량종류를 검색하라

SELECT 성명, 소속, 종류 as 차량종류

FROM 차량, 인사

WHERE 차량.사원번호 = 인사.사원번호

AND 성명 = '박이준';

?

-- [Quiz08-04] 정보처리산업기사 필기

-- 차량(사원번호, 종류)

-- 인사(성명, 소속, 사원번호)

?

select 종류

from 차량

where 사원번호 = (select 사원번호 from 인사 where 성명='오영우');

?

-- 이름 중에 '이' 가 들어가는 사원의 성명, 소속과 차량 종류를 검색하라

?

select t.성명, t.소속, 종류

from (select 성명, 소속, 사원번호 from 인사 where 성명 LIKE '%이%') as t, 차량

where t.사원번호 = 차량.사원번호;

/*------------------------------------------------------------------------*/