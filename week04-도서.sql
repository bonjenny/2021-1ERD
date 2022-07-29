-- (week04-도서.sql)

DROP TABLE 도서 purge;

-- 도서(도서번호, 도서명, 출판사, 정가)
CREATE TABLE 도서
(
	도서번호             INT NOT NULL ,
	도서명               VARCHAR(50) NULL ,
	출판사               VARCHAR(30) NULL ,
	정가                 INT , 
             PRIMARY KEY (도서번호) 
);

CREATE UNIQUE INDEX XPK도서 ON 도서
(도서번호   ASC);

ALTER TABLE 도서
	ADD CONSTRAINT  XPK도서 PRIMARY KEY (도서번호);

INSERT INTO 도서 VALUES(1,'축구의 역사','굿스포츠',7000);
INSERT INTO 도서 VALUES(2,'축구 아는 여자','나무수',13000);
INSERT INTO 도서 VALUES(3,'축구의 이해','대한미디어',22000);
INSERT INTO 도서 VALUES(4,'골프 바이블','대한미디어',36000);
INSERT INTO 도서 VALUES(5,'피겨 교본','굿스포츠',8000);

-- 형식 명령어
COL 도서번호 FOR 99
COL 도서명    FOR a30
COL 출판사    FOR a20
COL 정가       FOR 999999

-- 데이터 조회
SELECT * FROM 도서;