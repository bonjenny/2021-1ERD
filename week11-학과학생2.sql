
/* ================ week11-학과학생2.sql ================ */

-- 2) 연쇄(CASCADE)인 경우
-- 학과2(학과코드, 학과명)
-- 학생2(학번, 이름, 학과코드)

drop table 학생2;
drop table 학과2;

CREATE TABLE 학과2 (
    학과코드 char(4) NOT NULL ,
    학과명 varchar(30) ,
    CONSTRAINT pk_학과2_학과코드 PRIMARY KEY(학과코드)
);

CREATE TABLE 학생2 (
    학번 char(3) NOT NULL ,
    이름 varchar(10) ,
    학과코드 char(4) ,
    CONSTRAINT pk_학생2_학번 PRIMARY KEY(학번) ,
    CONSTRAINT fk_학생2_학과코드 FOREIGN KEY (학과코드) 
    REFERENCES 학과2(학과코드) /* 2붙이는 것 까먹지 말것 */
    ON DELETE CASCADE /* 연쇄 삭제 */
);

insert into 학과2 values('1001','컴퓨터학과');
insert into 학과2 values('2001','체육학과');

insert into 학생2 values('501','박지성','1001');
insert into 학생2 values('401','김연아','2001');
insert into 학생2 values('402','장미란','2001');
insert into 학생2 values('502','추신수','1001');

select * from 학과2;
select * from 학생2;


-- 2) 연쇄(CASCADE)인 경우 (oracle의 경우) --> update는 미지원, delete는 지원
--오류 (이유는?) : ON DELETE CASCADE만 했기 때문에 실행 불가
UPDATE 학과2
SET 학과코드 = 'A001'
WHERE 학과코드 = '1001';

--실행결과는? : 부모 테이블의 레코드 삭제됐기 때문에 자식 테이블 레코드도 삭제
DELETE 
FROM 학과2
WHERE 학과코드 = '2001';

select * from 학과2;
select * from 학생2;

/* =============================================== */