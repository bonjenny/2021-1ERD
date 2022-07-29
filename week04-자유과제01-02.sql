-- (week04-자유과제01-02.sql)

DROP TABLE 섹션 purge;
DROP TABLE 보유기술 purge;
DROP TABLE 등록 purge;
DROP TABLE 과목 purge;
DROP TABLE 학생 purge;
DROP TABLE 학과 purge;
DROP TABLE 교수 purge;


-- 교수(교수번호, 이름, 전공분야)
CREATE TABLE 교수
(
	교수번호             CHAR(3) NOT NULL ,
	이름                 VARCHAR(20) ,
	전공분야             VARCHAR(30) ,
    PRIMARY KEY (교수번호)
);


-- 학과(학과명, 전화번호, 사무실위치, 학과장, 임명일자)
CREATE TABLE 학과
(
	학과명               VARCHAR(30) NOT NULL ,
	전화번호             CHAR(13) ,
	사무실위치          VARCHAR(50) ,
	학과장               CHAR(3) NOT NULL ,
	임명일자             CHAR(7) ,
    PRIMARY KEY (학과명) ,
    FOREIGN KEY (학과장) REFERENCES 교수 (교수번호)
);
CREATE UNIQUE INDEX XPK학과 ON 학과
(학과명   ASC);


-- 학생(학번, 이름, 주소, 나이, 생년월일, 학과명, 지도교수, 면담시간)
CREATE TABLE 학생
(
	학번                 CHAR(10) NOT NULL ,
	이름                 VARCHAR(20) ,
	주소                 VARCHAR(50) ,
	나이                 INT ,
	생년월일             VARCHAR(10) ,
	학과명               VARCHAR(30) NOT NULL ,
	지도교수             CHAR(3) ,
	면담시간             VARCHAR(20) ,
    PRIMARY KEY (학번) ,
    FOREIGN KEY (학과명) REFERENCES 학과 (학과명) ,
    FOREIGN KEY (지도교수) REFERENCES 교수 (교수번호) ON DELETE SET NULL
);
CREATE UNIQUE INDEX XPK학생 ON 학생
(학번   ASC);


-- 과목(과목번호, 과목명, 과목개요, 담당교수)
CREATE TABLE 과목
(
	과목번호             CHAR(4) NOT NULL ,
	과목명               VARCHAR(30) ,
	과목개요             VARCHAR(100) ,
	담당교수             CHAR(3) NOT NULL ,
    PRIMARY KEY (과목번호) ,
    FOREIGN KEY (담당교수) REFERENCES 교수 (교수번호)
);
CREATE UNIQUE INDEX XPK과목 ON 과목
(과목번호   ASC);


-- 등록(학번, 과목번호)
CREATE TABLE 등록
(
	학번                 CHAR(10) NOT NULL ,
	과목번호             CHAR(4) NOT NULL ,
    PRIMARY KEY (학번,과목번호) ,
    FOREIGN KEY (학번) REFERENCES 학생 (학번) ,
    FOREIGN KEY (과목번호) REFERENCES 과목 (과목번호)
);
CREATE UNIQUE INDEX XPK등록 ON 등록
(학번   ASC,과목번호   ASC);


-- 보유기술(기술보유교수, 보유기술)
CREATE TABLE 보유기술
(
	기술보유교수         CHAR(3) NOT NULL ,
	보유기술             VARCHAR(100) NOT NULL ,
    PRIMARY KEY (보유기술,기술보유교수) ,
    FOREIGN KEY (기술보유교수) REFERENCES 교수 (교수번호)
);
CREATE UNIQUE INDEX XPK보유기술 ON 보유기술
(보유기술   ASC,기술보유교수   ASC);


-- 섹션(과목번호, 섹션번호)
CREATE TABLE 섹션
(
	과목번호             CHAR(4) NOT NULL ,
	섹션번호             INT NOT NULL ,
    PRIMARY KEY (섹션번호,과목번호) ,
    FOREIGN KEY (과목번호) REFERENCES 과목 (과목번호)
);
CREATE UNIQUE INDEX XPK섹션 ON 섹션
(섹션번호   ASC,과목번호   ASC);


-- 교수(교수번호, 이름, 전공분야)
INSERT INTO 교수 VALUES ('301','오용철','데이터베이스');
INSERT INTO 교수 VALUES ('504','최종필','멀티미디어');
INSERT INTO 교수 VALUES ('505','정의훈','네트워크');
INSERT INTO 교수 VALUES ('556','이용희','게임 인공지능');

-- 학과(학과명, 전화번호, 사무실위치, 학과장, 임명일자)
INSERT INTO 학과 VALUES ('컴퓨터공학과','031-1234-5678','E동 3층','504','2007년');
INSERT INTO 학과 VALUES ('게임공학과','031-1234-9876','E동 4층','556','2006년');

-- 학생(학번, 이름, 주소, 나이, 생년월일, 학과명, 지도교수, 면담시간)
INSERT INTO 학생 VALUES ('2004150051','황도경','경기도 고양시',25,'1985.3.22','컴퓨터공학과','504','목 6교시');
INSERT INTO 학생 VALUES ('2007150006','곽나리','서울시 영등포구',22,'1988.9.17','컴퓨터공학과','301','월 3교시');
INSERT INTO 학생 VALUES ('2005152033','이민구','경기도 군포시',24,'1986.4.30','컴퓨터공학과','301','월 2교시');
INSERT INTO 학생 VALUES ('2007130012','정소연','서울시 성북구',22,'1988.7.13','게임공학과','556','수 1교시');

-- 과목(과목번호, 과목명, 과목개요, 담당교수)
INSERT INTO 과목 VALUES ('0205','프로그래밍','C 언어 기반 프로그래밍','301');
INSERT INTO 과목 VALUES ('0211','데이터베이스','데이터베이스 디자인 실습 및 구축','301');
INSERT INTO 과목 VALUES ('5029','데이터통신','데이터 전송과 관련된 요소 기술들 소개','505');

-- 등록(학번, 과목번호)
INSERT INTO 등록 VALUES ('2004150051','0205');
INSERT INTO 등록 VALUES ('2004150051','0211');
INSERT INTO 등록 VALUES ('2005152033','0211');
INSERT INTO 등록 VALUES ('2007150006','5029');

-- 보유기술(기술보유교수, 보유기술)
INSERT INTO 보유기술 VALUES ('505','비동기 W-CDMA 단말기 모뎀 제어 소프트웨어');
INSERT INTO 보유기술 VALUES ('505','CDMA 1X 단말기 SMS 소프트웨어');
INSERT INTO 보유기술 VALUES ('556','표면 검사(Surface Detect Inspection) 시스템');

-- 섹션(과목번호, 섹션번호)
INSERT INTO 섹션 VALUES ('0205',1);
INSERT INTO 섹션 VALUES ('0211',3);
INSERT INTO 섹션 VALUES ('5029',1);


COMMIT;


COL 이름       FOR a10;
COL 전공분야 FOR a20;

COL 학과명    FOR a15;
COL 사무실위치 FOR a20;

COL 이름       FOR a10;
COL 주소       FOR a20;
COL 학과명    FOR a15;
COL 면담시간 FOR a20;

COL 과목명    FOR a15;
COL 과목개요 FOR a50;

COL 보유기술 FOR a70;
COL 섹션번호 FOR 9;


-- 테이블 조회
SELECT * FROM 교수;
SELECT * FROM 학과;
SELECT * FROM 학생;
SELECT * FROM 과목;
SELECT * FROM 등록;
SELECT * FROM 보유기술;
SELECT * FROM 섹션 ;


SELECT * FROM 보유기술 ORDER BY "기술보유교수" ASC, "보유기술" DESC;
SELECT * FROM 섹션 ORDER BY "과목번호" ASC;
