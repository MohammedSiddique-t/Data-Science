Library Management System
Project Type: DataScience Mini Project
Course: BCA
Database: MySQL
Database Name: librarydb
Software: MySQL Workbench


1. Introduction

This mini project is a Library Management System built in MySQL.
It keeps track of library members, the books available in the library and the books issued to members.
The main aim is to understand how a relational database is designed and how SQL queries are used to get useful information from it.
With this database we can find the most borrowed books, see which books are still not returned, work out fines for late returns and compare how students and faculty use the library.


2. Tables

Members
member_id         Primary key
member_name       Name of the member
member_type       Student or Faculty
joined_date       Date the member joined

Books
book_id           Primary key
title             Name of the book
author            Author of the book
category          Education or Technology
price             Price of the book
copies_available  Copies currently on the shelf

Issues
issue_id          Primary key
member_id         Foreign key referencing members
book_id           Foreign key referencing books
issue_date        Date the book was issued
due_date          Last date to return the book
return_date       Actual return date (NULL if not returned yet)


3. Database Relationships

There are two one-to-many relationships.
One member can have many issue records.
One book can also appear in many issue records.
The issues table links members and books through its two foreign keys.


4. Sample Data

Table      Total Records
Members    10
Books      10
Issues     14

Members include 7 students and 3 faculty. Books are from two categories, Education and Technology.
Some books are still issued, some were returned on time and some were returned late, so every query has something to show.


5. Fine Calculation

Fine rule: Rs. 2 for every day a book is returned after the due date.
Fine = Number of late days x 2

Borrowing period: 14 days for students and 30 days for faculty.
A book is late if the return date is after the due date.
A NULL return date means the book is still issued.


6. SQL Concepts Used

Database and table creation
Primary keys and foreign keys
SELECT and WHERE
Aggregate functions (COUNT, SUM)
GROUP BY and HAVING
ORDER BY and LIMIT
INNER JOIN and LEFT JOIN
Subqueries
NULL handling
DATEDIFF function
Window function RANK()


7. Project Questions

Phase 1 - Database Basics
C1: Draw the Entity Relationship Diagram.
C2: Find the total number of members, books and issue records.

Phase 2 - SQL Queries
C3: Number of titles and available copies in each category.
C4: Top 5 most borrowed books.
C5: Members who have never borrowed a book.
C6: Currently issued books with member names and due dates.
C7: Late returns and their fines.
C8: Total fine for each member.
C9: Borrowing activity of students vs faculty.
C10: Rank members by number of books borrowed.
C11: Most popular book category.
C12: Books with zero copies available and pending returns.

Phase 3 - Database Automation
C13: Stored procedure to show a member's borrowing history.
C14: Trigger to reduce available copies when a new issue is inserted.

Phase 4 - Conclusion
C15: Suggest improvements to the library based on the query results.


8. Files Included

File                        Description
lib database.sql            Creates the database and the three tables.
records and queries.sql     Inserts the sample records and has the queries for C2 to C12.
readme_lib_db.txt           This file.
ER Diagram.jpeg             Entity Relationship Diagram (C1).


9. How to Run the Project

1. Open MySQL Workbench.
2. Run "lib database.sql" to create librarydb and its tables.
3. Run "records and queries.sql". The INSERT statements come first, then the queries.
4. Check the output of each query.

To verify the data, run:

USE librarydb;
SELECT COUNT(*) FROM members;
SELECT COUNT(*) FROM books;
SELECT COUNT(*) FROM issues;

Expected output:
Members: 10
Books: 10
Issues: 14


10. Learning Outcomes

I learned how to design and create a relational database in MySQL.
I practised joins, aggregate functions, subqueries and window functions on real-looking data, and saw how fines and pending returns can be calculated with SQL.
The project helped me connect database concepts to a real library situation.


11. Conclusion

The Library Management System shows how MySQL can store and analyse library records.
The queries help find popular books, members with pending returns and fines for late returns.
Overall, this mini project improved my practical understanding of databases and SQL.
