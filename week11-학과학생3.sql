
/* ================ week11-학과학생3.sql ================ */

-- 3) 널 값으로 대체(SET NULL) 인 경우
-- 학과3(학과코드, 학과명)
-- 학생3(학번, 이름, 학과코드)

drop table 학생3;
drop table 학과3;

CREATE TABLE 학과3 (
    학과코드 char(4) NOT NULL ,
    학과명 varchar(30) ,
    CONSTRAINT pk_학과3_학과코드 PRIMARY KEY(학과코드)
);

CREATE TABLE 학생3 (
    학번 char(3) NOT NULL ,
    이름 varchar(10) ,
    학과코드 char(4) ,
    CONSTRAINT pk_학생3_학번 PRIMARY KEY(학번) ,
    CONSTRAINT fk_학생3_학과코드 FOREIGN KEY (학과코드) 
    REFERENCES 학과3(학과코드)
    ON DELETE SET NULL
);

insert into 학과3 values('1001','컴퓨터학과');
insert into 학과3 values('2001','체육학과');

insert into 학생3 values('501','박지성','1001');
insert into 학생3 values('401','김연아','2001');
insert into 학생3 values('402','장미란','2001');
insert into 학생3 values('502','추신수','1001');

select * from 학과3;
select * from 학생3;


-- 3) 널 값으로 대체(SET NULL) 인 경우 (oracle의 경우) --> update는 미지원, delete는 지원
--오류 (이유는?) : ON DELETE SET NULL만 했기 때문에 실행 불가
UPDATE 학과3
SET 학과코드 = 'A001'
WHERE 학과코드 = '1001';

-- 삭제 가능? (SET NULL 설정) : 삭제 가능!
DELETE 
FROM 학과3
WHERE 학과코드 = '1001';

select * from 학과3;
select * from 학생3;

/* =============================================== */