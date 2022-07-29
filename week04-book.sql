-- (erwin 73 자동생성)
-- (week04-book.sql)

DROP TABLE book purge;

-- book(bookid, bookname, publisher, price)
CREATE TABLE book
(
	bookid               INT NOT NULL ,
	bookname             VARCHAR(50) NULL ,
	publisher            VARCHAR(30) NULL ,
	price                INT NULL 
);

CREATE UNIQUE INDEX XPKbook ON book
(bookid   ASC);

ALTER TABLE book
	ADD CONSTRAINT  XPKbook PRIMARY KEY (bookid);

-- book(bookid, bookname, publisher, price)
insert into book values(1,'축구의 역사','굿스포츠',7000);
insert into book values(2,'축구 아는 여자','나무수',13000);
insert into book values(3,'축구의 이해','대한미디어',22000);
insert into book values(4,'골프 바이블','대한미디어',36000);
insert into book values(5,'피겨 교본','굿스포츠',8000);

desc book;

-- 형식 명령어
COL bookid FORMAT 99
COL bookname FORMAT a20
COL publisher FORMAT a20
COL price FORMAT 999999

-- 데이터 조회
select * from book;