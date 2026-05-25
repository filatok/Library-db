CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;

DROP TABLE IF EXISTS authors;
CREATE TABLE authors
(
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
nationality varchar(20) NOT NULL,
birthdate date NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS books;
CREATE TABLE books
(
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
ISBN varchar(13),
category varchar(255) NOT NULL,
publicationYear INT NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS author_book;
CREATE TABLE author_book (
author_id BIGINT(20) UNSIGNED NOT NULL,
book_id BIGINT(20) UNSIGNED NOT NULL,
PRIMARY KEY (author_id, book_id),
FOREIGN KEY (author_id) REFERENCES authors(id),
FOREIGN KEY (book_id) REFERENCES books(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO authors (name, nationality, birthdate)
VALUES
    ('Lev Tolstoy', 'russian', '1828-09-09'),
    ('Fyodor Dostoevsky', 'russian', '1821-11-11'),
    ('Neil Gaiman', 'british', '1960-11-10'),
    ('Terry Pratchett', 'british', '1948-04-28'),
    ('Cynthia Hand', 'american', '1978-01-01'),
    ('Brodi Ashton', 'american', '1984-08-30'),
    ('Jodi Meadows', 'american', '1983-05-02'),
    ('Yana Botsman', 'german', '1973-08-07'),
    ('Dmitry Gordevsky', 'russian', '1996-04-24');



INSERT INTO books (title, publicationYear, ISBN, category)
VALUES
	('Anna Karenina', 1878, '9789603259329', 'realist novel'),
	('Crime and punishment', 1866, '9781840224306', 'philosophical novel'),
	('Good Omens', 1990, '9780552171892', 'humorous fantasy'),
	('My Lady Jane', 2016, '9780062391742', 'Historical fantasy'),
	('Tomorrow War', 2021, '9781949846768', 'novel');

INSERT INTO author_book (author_id, book_id) 
values 
(1, 8),
(14,9),
(15,3),
(16,3),
(17,4),
(18,4),
(19,4),
(20,5),
(21,5);