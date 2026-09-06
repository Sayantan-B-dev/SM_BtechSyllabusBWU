-- Assignment VI: Library Management System- SQL
-- Statements – SELECT, INSERT, UPDATE,
-- DELETE, TRUNCATE, DROP, ALTER

-- Generate two table

-- Books (BookID (PRIMARY KEY), Title, Author,
-- Genre, Price);

-- Members (MemberID (PRIMARY KEY), Name,
-- Email (UNIQUE), JoinDate DATE);

DROP DATABASE IF EXISTS 24thAug;
CREATE DATABASE 24thAug;
USE 24thAug;
CREATE TABLE Books(
  book_id INT PRIMARY KEY,
  title VARCHAR(200),
  author VARCHAR(100),
  genre VARCHAR(50),
  price DECIMAL(10,2)
);

CREATE TABLE Members(
  member_id INT PRIMARY KEY,
  member_name VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  JoinDate DATE
);

-- 1. INSERT Statement 3 rows in each table.

INSERT INTO Books VALUES
(1,"Atomic Habbits", "James Bond", "Motivation",500.50),
(2,"Classical formulas", "A. Biswas", "Education",270.50),
(3,"Rich dad poor dad 2", "Ankit Dey", "Life style",860.50),
(4,"Garden of Elves", "Rammohan Paul", "Fiction",1550.50),
(5,"Geographical maps", "Kalyan Maity", "Documentation",450.50);

INSERT INTO Members VALUES
(100,"Kalyan Mondal","kalyan@gmail.com",CURDATE()),
(101,"Sourav Das","sourav@gmail.com",CURDATE()),
(102,"Ravi Kumar","ravi@gmail.com",CURDATE()),
(103,"Anurag Maity","anurag@gmail.com",CURDATE()),
(104,"Suraj Roy","suraj@gmail.com",CURDATE());



-- 2. Write an SQL query to display all records from the Books table.

SELECT * FROM Books;

-- 3. Write an SQL query to display only the Title and Price of all books.

SELECT title, price FROM Books;

-- 4. Write an SQL query to display all books belonging to the Fiction genre.

SELECT * FROM Books WHERE genre="Fiction";


-- 5. Write an SQL query to change the price of the book with BookID = 1 to 320.00.

UPDATE Books SET price=320.00 WHERE book_id=1;
SELECT * FROM Books;

-- 6. Write an SQL query to change Ravi Kumar's email to ravi.kumar@example.com.

UPDATE Members SET email="ravi.kumar@example.com" WHERE member_name="Ravi Kumar";
SELECT * FROM Members;


-- 7. Write an SQL query to delete the book with BookID = 2.

DELETE FROM Books WHERE book_id=2;
SELECT * FROM Books;

-- 8. Write an SQL query to delete the member with MemberID = 102.

DELETE FROM Members WHERE member_id=102;
SELECT * FROM Members;


-- 9. Write an SQL query to add a column named Publisher of type VARCHAR(100) to the Books table.

ALTER TABLE Books ADD COLUMN publisher VARCHAR(100);
DESC Books;

-- 10. Write an SQL query to change the Price column datatype to DECIMAL(8,2).

ALTER TABLE Books MODIFY price DECIMAL(8,2);
DESC Books;

-- 11. Write an SQL query to rename the Genre column to Category.

ALTER TABLE Books RENAME COLUMN genre to Category;
DESC Books;