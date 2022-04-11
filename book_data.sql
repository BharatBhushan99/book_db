CREATE DATABASE book_shop;

USE book_shop;

SELECT DATABASE();

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT CONCAT(author_fname, " ", author_lname)
FROM books;

SELECT CONCAT_WS(" - ", title, author_fname, author_lname)
FROM books;

SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10);

SELECT SUBSTRING(title, 1, 10) AS "Short Title"
FROM books;

SELECT CONCAT(SUBSTRING(title, 1, 10),"...") AS "Partial Title"
FROM books;

SELECT REPLACE(title, 'e', 3) AS "Changed Title"
FROM books;

SELECT SUBSTRING(REPLACE(title, 'e', 3),1,10) AS "Total Mess"
FROM books;

SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books;

SELECT author_lname, CHAR_LENGTH(author_lname) AS "length"
FROM books;

SELECT CONCAT(author_lname, " is ", CHAR_LENGTH(author_lname), " characters long.") AS "Last Name Length"
FROM books;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT released_year FROM books;
SELECT DISTINCT CONCAT(author_fname, " ", author_lname) AS "authors" FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT author_lname FROM books ORDER BY author_lname;

SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT title FROM books ORDER BY title;

SELECT title FROM books ORDER BY title DESC;

SELECT released_year FROM books ORDER BY released_year;

SELECT released_year FROM books ORDER BY released_year DESC;

SELECT title, released_year, pages FROM books ORDER BY released_year;

SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;


SELECT title, released_year FROM books ORDER BY released_year LIMIT 5;

SELECT title, released_year FROM books ORDER BY released_year LIMIT 0 , 5;

SELECT title, released_year FROM books ORDER BY released_year LIMIT 2 , 5;

SELECT title, released_year FROM books ORDER BY released_year LIMIT 10 , 1;

SELECT title, author_fname FROM books
WHERE author_fname LIKE '%da%';

SELECT title FROM books
WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '____';

SELECT title FROM books WHERE title LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%\_%';

SELECT title FROM books WHERE title LIKE '%stories%';

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT_WS(' - ', title, released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity, title LIMIT 3;

SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT UPPER(CONCAT("the author that I like the most is ", author_fname, " ",author_lname, "!")) FROM books ORDER BY author_lname;

SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname, author_lname)) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT title, author_lname FROM books GROUP BY author_lname;

SELECT MIN(released_year) FROM books;

SELECT MIN(pages) FROM books;

SELECT MAX(pages) FROM books;

SELECT * FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT title,pages FROM books WHERE pages = (SELECT MIN(pages) FROM books);

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT author_fname, author_lname, MAX(pages) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, " ", author_lname) AS author, MAX(pages) AS 'longest book' FROM books GROUP BY author_lname, author_fname;

SELECT SUM(page) FROM books;

SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_lname, author_fname;

SELECT AVG(released_year) FROM books;

SELECT AVG(pages) FROM books;
 
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) AS books FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname, " ", author_lname) AS author FROM books WHERE pages = (SELECT MAX(pages) FROM books);

SELECT released_year AS year, COUNT(*) AS '# books', AVG(pages) AS 'AVG Pages' FROM books GROUP BY released_year;

SELECT title, released_year FROM books WHERE released_year != 2017; 

SELECT title, author_lname FROM books WHERE author_lname != "Harris"; 

SELECT title FROM books WHERE title NOT LIKE 'w%';

SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;

SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;

SELECT title, stock_quantity FROM books WHERE stock_quantity > 100;

SELECT title, released_year FROM books WHERE released_year < 2000 ORDER BY released_year;

SELECT title, released_year FROM books WHERE released_year <= 2000 ORDER BY released_year;

SELECT title, author_lname, released_year FROM books WHERE author_lname = "Eggers" && released_year > 2000;

SELECT title, author_lname, released_year FROM books WHERE author_lname = "Eggers" AND released_year > 2000;

SELECT title, author_lname, released_year FROM books WHERE author_lname = "Eggers" AND released_year > 2000 AND title LIKE "%no%";

SELECT title, author_lname, released_year FROM books WHERE author_lname = "Eggers" || released_year > 2010;

SELECT title, author_lname, released_year, stock_quantity FROM books WHERE author_lname = "Eggers" || released_year > 2010 OR stock_quantity > 100;

SELECT title, released_year FROM books WHERE released_year >= 2003 AND released_year <= 2015; 

SELECT title, released_year FROM books WHERE released_year BETWEEN 2003 AND 2015; 

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2003 AND 2015 ORDER BY released_year; 

SELECT title, author_lname FROM books WHERE author_lname IN ('Lahiri', 'Smith', 'Carver');

SELECT title, released_year, CASE WHEN released_year >= 2000 THEN "Modern Lit" ELSE "20th Century Lit" END CASE AS PERIOD FROM books;

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS Stock
FROM books;


SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

SELECT * FROM books WHERE author_lname = 'Eggers' || author_lname = 'Chabon';

SELECT * FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;

SELECT * FROM books WHERE pages >=  100 && pages <= 200;

SELECT * FROM books WHERE page BETWEEN 100 AND 200;

SELECT * FROM books WHERE author_lname LIKE 'C%' || author_lname LIKE 'S%';

SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' THEN 'Memoir'
        WHEN title LIKE 'A Heartbreaking Work' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;   


SELECT title, author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
        ELSE CONCAT(COUNT(*), ' books')
    	END AS COUNT
FROM books GROUP BY author_lname, author_fname;
