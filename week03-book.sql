
-- book.sql
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

