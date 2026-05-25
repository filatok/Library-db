# Library-db

A MySQL database schema for managing a library system, including authors, books, and their many-to-many relationships.

Prerequisites

- MySQL 5.7+ or MariaDB 10.3+
- A MySQL client (e.g. MySQL Workbench, DBeaver, or the `mysql` CLI)

Getting Started

Clone the repository and run the script against your MySQL server:
git clone https://github.com/your-username/your-repo.git
cd your-repo
mysql -u your_username -p < CreateDatabase.sql
Or paste the script directly into your MySQL client of choice.

 Database Schema
The database is named library_db and contains three tables:

authors
Stores information about authors.

| Column        | Type           | Description                  |
|---------------|----------------|------------------------------|
| `id`          | BIGINT (PK, AI)| Unique author identifier     |
| `name`        | VARCHAR(255)   | Full name of the author      |
| `nationality` | VARCHAR(20)    | Author's nationality         |
| `birthdate`   | DATE           | Author's date of birth       |

________________________________________

books
Stores information about books.

| Column            | Type           | Description                        |
|-------------------|----------------|------------------------------------|
| `id`              | BIGINT (PK, AI)| Unique book identifier             |
| `title`           | VARCHAR(255)   | Title of the book                  |
| `ISBN`            | VARCHAR(13)    | 13-digit ISBN number               |
| `category`        | VARCHAR(255)   | Genre or category of the book      |
| `publicationYear` | INT            | Year the book was published        |
________________________________________

author_book
A junction table implementing the many-to-many relationship between authors and books (a book can have multiple authors, and an author can have multiple books).

| Column      | Type    | Description                              |
|-------------|---------|------------------------------------------|
| `author_id` | BIGINT  | Foreign key referencing `authors(id)`    |
| `book_id`   | BIGINT  | Foreign key referencing `books(id)`      |

The combination of `(author_id, book_id)` forms the composite primary key.
________________________________________

Entity Relationship Diagram

authors         author_book        books
────────        ───────────        ─────
id    ◄────── author_id       ──► id
name            book_id   ────    title
nationality                       ISBN
birthdate                         category
                                  publicationYear
