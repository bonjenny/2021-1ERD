
/* ================ week11-ex08-03.sql ================ */

-- 03) Quiz08-03
-- 영화(영화코드, 영화제목, 장르, 관람기준, 상영시간)
-- 배우(배우번호, 배우이름, 성별)
-- 출연(일련번호, 영화코드, 배우번호, 출연료)

drop table 출연;
drop table 영화;
drop table 배우;

create table 영화 (
    영화코드 char(4) NOT NULL PRIMARY KEY ,
    영화제목 varchar(50) NOT NULL ,
    장르 varchar(50) ,
    관람기준 int ,
    상영시간 int 
);
insert into 영화 values('MC01','과속스캔들','코미디',12,108);
insert into 영화 values('MC02','엽기적인그녀','코미디',15,122);
insert into 영화 values('MD01','키다리아저씨','드라마',12,110);
insert into 영화 values('MD02','바보','드라마',12,99);

create table 배우 (
    배우번호 char(4) NOT NULL PRIMARY KEY ,
    배우이름 varchar(18) NOT NULL ,
    성별 char(3) 
);
insert into 배우 values('a001','차태현','남');
insert into 배우 values('a002','하지원','여');

create table 출연 (
    일련번호 int ,
    영화코드 char(4) NOT NULL ,
    배우번호 char(4) NOT NULL , 
    출연료 int ,
    CONSTRAINT PK_출연_일련번호 PRIMARY KEY(일련번호) ,
    FOREIGN KEY(영화코드) REFERENCES 영화(영화코드) ,
    FOREIGN KEY(배우번호) REFERENCES 배우(배우번호)
);
insert into 출연 values(1,'MC01','a001',1000);
insert into 출연 values(2,'MC02','a001',700);
insert into 출연 values(3,'MD01','a002',400);
insert into 출연 values(4,'MD02','a001',600);
insert into 출연 values(5,'MD02','a002',600);
?
select * from 영화;
select * from 배우;
select * from 출연;


-- 1) 장르가 코미디이거나 드라마인 영화제목, 장르를 검색하라(IN 사용)
SELECT  영화제목, 장르
FROM    영화
WHERE   장르='코미디' or 장르='드라마';

SELECT  영화제목, 장르
FROM    영화
WHERE   장르 in ('코미디','드라마');


-- 1-1) 장르가 코미디이거나 드라마가 아닌 영화제목, 장르를 검색하라
SELECT  영화제목, 장르
FROM    영화
WHERE   장르<>'코미디' and 장르<>'드라마';

SELECT  영화제목, 장르
FROM    영화
WHERE   장르 not in ('코미디','드라마');


-- 2) 장르별 최고 상영시간을 검색하라
SELECT   장르, MAX(상영시간)
FROM     영화
GROUP BY 장르;


-- 3) 영화제목에 '아저씨'가 들어가는 모든 정보 검색하라
SELECT   *
FROM     영화
WHERE    영화제목 like '%아저씨%';


-- 4) 성별이 남인 배우번호, 배우이름을 배우이름의 오름차순으로 검색하라
SELECT   배우번호, 배우이름
FROM     배우
WHERE    성별='남'
ORDER BY 배우이름 ASC;


-- 5) 출연료가 500에서 1000인 영화코드, 배우번호, 출연료 검색하라
SELECT   영화코드, 배우번호, 출연료
FROM     출연
WHERE    출연료 >= 500 and 출연료 <= 1000;


-- 6) 다음 SQL문법의 실행결과를 작성하고 간략히 설명
SELECT   COUNT(장르), COUNT(DISTINCT 장르)
FROM     영화;
/* count(장르)는 전체 레코드의 수를 반환,
    count(distinct 장르)는 중복제거, 장르 종류의 개수를 반환*/


-- 7) 차태현이 출연한 영화의 출연료를 검색하라
SELECT   배우.배우이름, 출연.출연료
FROM     출연, 배우
WHERE    배우이름='차태현';


-- 8) 영화 '키다리아저씨'의 장르를 '스릴러', 관람기준을 15로 수정하라
UPDATE   영화
SET      장르='스릴러', 관람기준=15
WHERE    영화제목='키다리아저씨';

SELECT * FROM 영화;

/* =============================================== */