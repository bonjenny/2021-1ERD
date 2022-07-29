/* 학과, 학생 테이블 */
-- (studept-k.sql)

-- 학과(학과번호, 학과명)
-- 학생(번호, 이름, 학년, 분반, 학과번호)

DROP TABLE 학생;
DROP TABLE 학과;

CREATE TABLE 학과 (
	학과번호	int	NOT NULL,
	학과명	varchar(50),
	PRIMARY KEY(학과번호)
);

CREATE TABLE 학생 (
	번호	int	NOT NULL,
	이름	varchar(12),
	학년	int,
	분반	char(2),
	학과번호	int,
	PRIMARY KEY(번호),
	FOREIGN KEY (학과번호) REFERENCES 학과(학과번호)
);

-- 학과(학과번호, 학과명)
INSERT INTO 학과 VALUES(1, '컴퓨터소프트웨어공학과');
INSERT INTO 학과 VALUES(2, '컴퓨터정보공학과');
INSERT INTO 학과 VALUES(3, '정보통신공학과');

-- 학생(번호, 이름, 학년, 분반, 학과번호)
INSERT INTO 학생 VALUES(1, '한지혜', 1, 'YB', 1);
INSERT INTO 학생 VALUES(2, '이정우', 1, 'YA', 1);
INSERT INTO 학생 VALUES(3, '오지영', 2, 'J1', 2);
INSERT INTO 학생 VALUES(4, '강재미', 1, 'YB', 1);
INSERT INTO 학생 VALUES(5, '박철호', 2, 'Y1', 2);

COMMIT;

-- text모드로 테이블을 보여줄 경우 '학과명'이 너무 길기 때문에 30자만 보여달라는 명령
COL 학과명 FORMAT a30

SELECT * FROM 학과;
SELECT * FROM 학생;