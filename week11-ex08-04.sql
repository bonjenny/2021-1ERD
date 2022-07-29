
/* ================ week11-ex08-04.sql ================ */

-- 04) Quiz08-04
-- 차량(사원번호, 종류)
-- 인사(성명, 소속, 사원번호)

drop table 인사;
drop table 차량;

CREATE TABLE 차량 (
    사원번호 CHAR(2) NOT NULL ,
    종류 CHAR(1) NULL ,
    PRIMARY KEY (사원번호)
);

CREATE TABLE 인사 (
    성명 nvarchar2(3) NOT NULL ,
    소속 nvarchar2(3) NULL ,
    사원번호 CHAR(2) NULL ,
    PRIMARY KEY (성명) ,
    FOREIGN KEY (사원번호) REFERENCES 차량 (사원번호) 
    ON DELETE SET NULL
);

insert into 차량 values('23','A');
insert into 차량 values('25','B');
insert into 차량 values('43','C');
insert into 차량 values('56','D');

insert into 인사 values('김이순','총무과','25');
insert into 인사 values('박이준','자재과','56');
insert into 인사 values('이형수','영업과','23');
insert into 인사 values('오영우','보육과','43');

select * from 차량;
select * from 인사;


-- 1) 성명, 소속, 차량종류를 검색하라
SELECT   성명, 소속, 종류 as 차량종류
FROM     차량, 인사
WHERE    차량.사원번호 = 인사.사원번호;


-- 2) 박이준의 성명, 소속, 차량종류를 검색하라
SELECT   성명, 소속, 종류 as 차량종류
FROM     차량, 인사
WHERE    차량.사원번호 = 인사.사원번호
         and 성명='박이준';


-- [Quiz08-04] 정보처리산업기사 필기
-- 차량(사원번호, 종류)
-- 인사(성명, 소속, 사원번호)

select 종류
from 차량
where 사원번호 = (select 사원번호 from 인사 where 성명='오영우');

-- 이름 중에 '이' 가 들어가는 사원의 성명, 소속과 차량 종류를 검색하라
select t.성명, t.소속, 종류
from (select 성명, 소속, 사원번호
         from 인사
         where 성명 LIKE '%이%') t, 차량
where t.사원번호 = 차량.사원번호;

/* =============================================== */