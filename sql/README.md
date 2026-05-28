# SQL tasks

This folder will contain SQL tasks and practice queries from my CodeAcademy courses.
Public databases such as Lyft Trip Data, Startups, Sakila have been used for executing these tasks.

- ## Files

- `aggregate_functions_practice.sql` – practice with aggregate functions such as `SUM`, `COUNT`, `AVG`, `MIN`, and `MAX`
- `multiple_tables_trip_practice.sql` – practice with queries that combine data from multiple related tables
- `sakila_film_analysis.sql` – SQL practice on the Sakila sample database, focused on filtering, aggregation, grouping, and text matching
- `sakila_advanced_queries.sql` – more advanced Sakila SQL practice with joins, grouping, HAVING filters, ranking, and customer / store analysis

## Featured mini project: Sakila SQL analysis

This file contains a set of SQL practice queries written on top of the `sakila.film` table from the Sakila sample database.

### Focus areas

- Aggregate functions: `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`
- Filtering with `WHERE`
- Pattern matching with `LIKE`
- Working with distinct values using `DISTINCT`
- Grouping and sorting with `GROUP BY` and `ORDER BY`
- Conditional filtering with `AND`, `OR`, and `BETWEEN`

### Questions explored

The queries in this file were used to explore questions such as:

- What is the total rental duration across all films?
- How many distinct rating categories exist?
- What are the unique film ratings in the dataset?
- How does rental duration vary by rating?
- What are the minimum and maximum rental durations?
- Which films have rental duration greater than or equal to 6?
- What is the average rental duration by rating and special features?
- Which films contain specific special features such as `Deleted Scenes`?
- Which films match specific title and rental-duration conditions?

### What I practiced

With this mini project, I practiced:

- Reading and exploring table structure
- Writing analytical SQL queries
- Using aggregation for summary insights
- Applying filters to answer business-style questions
- Organizing SQL tasks with clear comments and readable query structure

## Additional SQL practice: Sakila advanced queries

This SQL file contains a broader set of analytical queries built on the Sakila sample database.

### Focus areas

- `JOIN` operations across multiple related tables
- aggregation with `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- filtering grouped results with `HAVING`
- sorting and limiting results with `ORDER BY` and `LIMIT`
- text filtering with `LIKE`
- answering business-style questions from relational data

### Questions explored

The queries in this file were used to explore questions such as:

- Which actors appear in the most films?
- How many customers does each store have?
- Which genres contain the most films?
- Which film had the largest number of actors?
- How much has each customer paid in total?
- Which districts and countries generate the highest totals?
- How do actor appearances vary by film genre?

### What I practiced

With this file, I practiced:

- joining multiple tables to answer analytical questions
- writing grouped summary queries
- using SQL to move from raw relational tables to business-style insights
- improving readability through structured query formatting and comments
