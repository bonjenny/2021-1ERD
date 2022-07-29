/* 부서, 사원 테이블 */
-- (dept-employee.sql)

-- 부서(부서코드, 부서명, 위치)
-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)

DROP TABLE 사원;
DROP TABLE 부서;

CREATE TABLE 부서 (
	부서코드	char(2)	NOT NULL,
	부서명	varchar(12),
	위치	varchar(10),
	PRIMARY KEY(부서코드)
);

CREATE TABLE 사원 (
	사원번호	int	NOT NULL,
	이름	varchar(12),
	성별	char(3),
	입사일	char(10),
	주소	varchar(50),
	부서코드	char(2),
	PRIMARY KEY(사원번호),
	FOREIGN KEY (부서코드) REFERENCES 부서(부서코드)
);

-- 부서(부서코드, 부서명, 위치)
INSERT INTO 부서 VALUES('AA','총무부','서울');
INSERT INTO 부서 VALUES('BB','영업부','대전');
INSERT INTO 부서 VALUES('CC','기획부','서울');

-- 사원(사원번호, 이름, 성별, 입사일, 주소, 부서코드)
INSERT INTO 사원 VALUES(1111,'홍길동','남','2004-08-26','서울시 서대문구 연희동','AA');
INSERT INTO 사원 VALUES(2222,'임꺽정','남','2005-02-23','부산시 해운대구','AA');
INSERT INTO 사원 VALUES(3333,'박찬호','남','2004-08-26','경기도 성남시 분당구','BB');
INSERT INTO 사원 VALUES(4444,'선동열','남','2005-08-22','서울시 마포구 공덕동','BB');
INSERT INTO 사원 VALUES(5555,'차두리','남','2006-02-23','서울시 영등포구 여의도동','AA');
INSERT INTO 사원 VALUES(6666,'신동엽','여','2006-02-20','서울시 동작구 신대방동','BB');

COMMIT;

-- text모드로 테이블을 보여줄 경우 '주소'가 너무 길기 때문에 30자만 보여달라는 명령
COL 주소 FORMAT a30

SELECT * FROM 부서;
SELECT * FROM 사원;

-- [과제01-2] 1) 사원의 모든 정보를 보이시오
SELECT * FROM 사원;

-- [과제01-2] 2) 신동엽 사원의 주소는 무엇인가?
SELECT	주소
FROM	사원
WHERE	이름='신동엽';

-- [과제01-2] 3) 성별이 '여'이고 부서코드가 'BB'인 사원을 검색하시오
SELECT	*
FROM	사원
WHERE	성별='여' AND 부서코드='BB'

-- [과제01-2] 4) 사원의 이름, 성별을 보이되 사원이름을 가나다순으로 보이시오
SELECT	이름, 성별
FROM	사원
ORDER BY 1;

-- [과제01-2] 5) 부서코드와 그 부서에 속한 사원들의 인원수를 보이시오
SELECT	부서코드, COUNT(*) 인원수
FROM	사원
GROUP BY 부서코드;

-- [과제01-2] 6) 사원이름과 부서이름을 보이시오
SELECT	부서.부서명, 사원.이름
FROM	부서 JOIN 사원
ON 부서.부서코드 = 사원.부서코드;

-- [과제01-2] 6) 사원이름과 부서이름을 보이시오 - 또다른 방법
SELECT	사원.이름, 부서.부서명
FROM	사원, 부서
ON 사원.부서코드 = 부서.부서코드;