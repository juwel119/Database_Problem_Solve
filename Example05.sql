CREATE TABLE publisher (name varchar(20), address varchar(50), phone varchar(11), PRIMARY KEY(name))
CREATE TABLE book (bookID varchar(20), title varchar(20), publisherName varchar(20), PRIMARY KEY(bookID), FOREIGN KEY(publisherName) REFERENCES publisher(name))
CREATE TABLE book_author (bookID varchar(20), authorName varchar(20), PRIMARY KEY(bookID, authorName), FOREIGN KEY(bookID) REFERENCES book(bookID))

CREATE TABLE library_branch (branchID NUMBER, branchName varchar(20), address varchar(20), PRIMARY KEY(branchID))
CREATE TABLE book_copies (bookID varchar(20), branchID NUMBER, no_of_cpoies NUMBER, PRIMARY KEY(bookID, branchID), FOREIGN KEY(bookID) REFERENCES book(bookID))

CREATE TABLE borrower (cardNo NUMBER, name varchar(20), address varchar(20), phone varchar(20), PRIMARY KEY(cardNo))
CREATE TABLE book_loan (bookID varchar(20), branchID NUMBER, cardNo NUMBER, dateOut DATE, dueDate DATE, PRIMARY KEY(bookID, branchID, cardNo), FOREIGN KEY(bookID) REFERENCES book(bookID), FOREIGN KEY(branchID) REFERENCES library_branch(branchID), FOREIGN KEY(cardNo) REFERENCES borrower(cardNo))






/*1*/CREATE VIEW total_title AS SELECT b.title FROM book b, book_loan bl, library_branch lb WHERE b.bookID= bl.bookID AND lb.branchID= bl.branchID AND b.title= 'DBMS' AND lb.branchName= 'CSE Seminar Library'
	SELECT COUNT(*) FROM TOTAL_TITLE 
/*2*/ SELECT b.title, lb.branchName FROM book b, LIBRARY_BRANCH lb, BOOK_LOAN bl WHERE b.bookID= bl.bookID AND lb.branchID= bl.branchID AND b.title= 'DBMS'
/*3*/ SELECT DISTINCT name FROM BORROWER br, BOOK_LOAN bl WHERE br.cardNo= bl.cardNo AND dueDate> '25-Nov-15'
/*4*/SELECT b.title, br.name, br.address FROM book b, BORROWER br, BOOK_LOAN bl, LIBRARY_BRANCH lb WHERE b.bookID= bl.bookID AND lb.branchID= bl.branchID AND br.cardNo= bl.cardNo AND lb.branchName= 'CSE Seminar Library' AND bl.dueDate= '7-Jul-15'
/*5*/SELECT branchName, COUNT(DISTINCT bookId) as booksLoaned FROM library_branch lb LEFT OUTER JOIN book_loan bl ON lb.branchId = bl.branchId GROUP BY branchName
/*6*/




























INSERT INTO publisher VALUES('PHI', '20 Delhi Super Market', '01715454678') INSERT INTO publisher VALUES('Tata', 'North Kolkata', '01562345445') INSERT INTO publisher VALUES('Galgotia', 'Mumbai', '0192203490')
INSERT INTO book VALUES('100.001cn', 'Computer Network', 'PHI') INSERT INTO book VALUES('100.002dsc', 'Database System', 'Tata') INSERT INTO book VALUES('100.003ds', 'Digital System', 'PHI') INSERT INTO book VALUES('100.004db', 'DBMS', 'PHI') INSERT INTO book VALUES('100.005ora', 'Oracle 2000', 'Galgotia')
INSERT INTO book_author VALUES('100.001cn', 'A S Tanenbaum') INSERT INTO book_author VALUES('100.002dsc', 'Silberschatz') INSERT INTO book_author VALUES('100.003ds', 'Ronald J Tocci') INSERT INTO book_author VALUES('100.004db', 'Ivan Bayross') INSERT INTO book_author VALUES('100.005ora', 'Ivan Bayross')
INSERT INTO library_branch VALUES(1001, 'CSE Seminar Library', 'Rajshahi') INSERT INTO library_branch VALUES(1002, 'RU Central Library', 'Rajshahi') INSERT INTO library_branch VALUES(1003, 'DU Central Library', 'Dhaka')
INSERT INTO book_copies VALUES('100.001cn', 1001, 2) INSERT INTO book_copies VALUES('100.001cn', 1002, 5) INSERT INTO book_copies VALUES('100.002dsc', 1001, 3) INSERT INTO book_copies VALUES('100.002dsc', 1002, 4) INSERT INTO book_copies VALUES('100.003ds', 1001, 3) INSERT INTO book_copies VALUES('100.003ds', 1002, 5) INSERT INTO book_copies VALUES('100.004db', 1001, 2) INSERT INTO book_copies VALUES('100.004db', 1003, 5) INSERT INTO book_copies VALUES('100.005ora', 1001, 2) INSERT INTO book_copies VALUES('100.005ora', 1002, 7)
INSERT INTO borrower VALUES(10001, 'Saidur', 'CSE', '01714400567') INSERT INTO borrower VALUES(10002, 'Rafiq', 'PHYSICS', '0194300456') INSERT INTO borrower VALUES(10003, 'Masud', 'CSE', '0156345678') INSERT INTO borrower VALUES(10004, 'Nobir', 'ICT', '01199203456')
INSERT INTO book_loan VALUES('100.001cn', 1001, 10001, '15-Jan-15', '15-Feb-15') INSERT INTO book_loan VALUES('100.001cn', 1002, 10002, '25-Jan-15', '25-Feb-15') INSERT INTO book_loan VALUES('100.002dsc', 1001, 10003, '20-Feb-15', '20-Mar-15') INSERT INTO book_loan VALUES('100.002dsc', 1002, 10004, '15-Mar-15', '15-Apr-15') INSERT INTO book_loan VALUES('100.003ds', 1001, 10001, '07-Jun-15', '07-Jul-15') INSERT INTO book_loan VALUES('100.003ds', 1003, 10002, '15-Oct-15', '15-Nov-15') INSERT INTO book_loan VALUES('100.004db', 1001, 10003, '25-Oct-15', '25-Nov-15') INSERT INTO book_loan VALUES('100.004db', 1002, 10004, '15-Nov-15', '15-Dec-15') INSERT INTO book_loan VALUES('100.005ora', 1001, 10003, '22-Dec-15', '22-Jan-16') INSERT INTO book_loan VALUES('100.005ora', 1002, 10001, '25-Dec-15', '25-Jan-16')

SELECT * FROM publisher
SELECT * FROM book
SELECT * FROM book_author
SELECT * FROM library_branch
SELECT * FROM book_copies
SELECT * FROM borrower
SELECT * FROM book_loan


DROP TABLE publisher
DROP TABLE book
DROP TABLE book_author
DROP TABLE library_branch
DROP TABLE book_copies
DROP TABLE borrower
DROP TABLE book_loan