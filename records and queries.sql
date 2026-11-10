INSERT INTO members VALUES
(1, 'Divya Nair', 'Student', '2026-01-12'),
(2, 'Karthik Rao', 'Student', '2026-01-14'),
(3, 'Meena Iyer', 'Faculty', '2026-01-15'),
(4, 'Faisal Khan', 'Student', '2026-01-18'),
(5, 'Lakshmi Prasad', 'Faculty', '2026-01-20'),
(6, 'Rohan Shetty', 'Student', '2026-01-22'),
(7, 'Ananya Gowda', 'Student', '2026-01-25'),
(8, 'Vikram Joshi', 'Faculty', '2026-01-27'),
(9, 'Nisha Thomas', 'Student', '2026-01-29'),
(10, 'Harish Patil', 'Student', '2026-02-01');

INSERT INTO books VALUES
(201, 'Let Us C', 'Yashavant Kanetkar', 'Education', 320, 4),
(202, 'Database System Concepts', 'Silberschatz', 'Technology', 480, 0),
(203, 'Learning Python', 'Mark Lutz', 'Technology', 520, 3),
(204, 'Computer Fundamentals', 'P K Sinha', 'Education', 280, 6),
(205, 'Operating System Concepts', 'Galvin', 'Technology', 560, 0),
(206, 'Web Technologies', 'Uttam Roy', 'Technology', 390, 5),
(207, 'Java The Complete Reference', 'Herbert Schildt', 'Education', 650, 2),
(208, 'Data Structures Using C', 'Reema Thareja', 'Education', 340, 4),
(209, 'Computer Networks', 'Tanenbaum', 'Technology', 500, 3),
(210, 'Discrete Mathematics', 'Kenneth Rosen', 'Education', 430, 5);

INSERT INTO issues VALUES
(1, 1, 201, '2026-02-02', '2026-02-16', '2026-02-15'),
(2, 2, 203, '2026-02-03', '2026-02-17', '2026-02-20'),
(3, 3, 202, '2026-02-04', '2026-03-06', NULL),
(4, 4, 205, '2026-02-05', '2026-02-19', NULL),
(5, 5, 203, '2026-02-06', '2026-03-08', '2026-03-05'),
(6, 6, 201, '2026-02-09', '2026-02-23', '2026-02-27'),
(7, 7, 204, '2026-02-10', '2026-02-24', '2026-02-24'),
(8, 8, 209, '2026-02-11', '2026-03-13', '2026-03-16'),
(9, 9, 203, '2026-02-12', '2026-02-26', '2026-03-02'),
(10, 1, 206, '2026-02-16', '2026-03-02', '2026-03-01'),
(11, 2, 208, '2026-02-18', '2026-03-04', NULL),
(12, 6, 210, '2026-02-20', '2026-03-06', '2026-03-10'),
(13, 3, 207, '2026-02-23', '2026-03-25', '2026-03-20'),
(14, 7, 205, '2026-02-25', '2026-03-11', '2026-03-09');

-- c2
SELECT COUNT(*) AS total_members FROM members;

SELECT COUNT(*) AS total_books FROM books;

SELECT COUNT(*) AS total_issues FROM issues;

-- c3
SELECT category,
COUNT(*) AS total_titles,
SUM(copies_available) AS total_copies
FROM books
GROUP BY category;

-- c4
SELECT books.title,
COUNT(issues.book_id) AS total_borrowed
FROM books
JOIN issues
ON books.book_id = issues.book_id
GROUP BY books.book_id, books.title
ORDER BY total_borrowed DESC
LIMIT 5;

-- c5

SELECT members.member_id, members.member_name
FROM members
LEFT JOIN issues
ON members.member_id = issues.member_id
WHERE issues.issue_id IS NULL;


-- c6

SELECT members.member_name,
books.title,
issues.due_date
FROM issues
JOIN members
ON issues.member_id = members.member_id
JOIN books
ON issues.book_id = books.book_id
WHERE issues.return_date IS NULL;

-- c7

SELECT books.title,
members.member_name,
issues.due_date,
issues.return_date,
DATEDIFF(issues.return_date, issues.due_date) AS days_late,
DATEDIFF(issues.return_date, issues.due_date) * 2 AS fine
FROM issues
JOIN books
ON issues.book_id = books.book_id
JOIN members
ON issues.member_id = members.member_id
WHERE issues.return_date > issues.due_date;

-- c8

SELECT members.member_name,
SUM(DATEDIFF(issues.return_date, issues.due_date) * 2) AS total_fine
FROM members
JOIN issues
ON members.member_id = issues.member_id
WHERE issues.return_date > issues.due_date
GROUP BY members.member_id, members.member_name
HAVING total_fine > 0;

-- c9

SELECT members.member_type,
COUNT(issues.issue_id) AS total_books_borrowed
FROM members
JOIN issues
ON members.member_id = issues.member_id
GROUP BY members.member_type;

-- c10

SELECT member_name,
total_books,
RANK() OVER (ORDER BY total_books DESC) AS member_rank
FROM (
    SELECT members.member_name,
    COUNT(issues.issue_id) AS total_books
    FROM members
    LEFT JOIN issues
    ON members.member_id = issues.member_id
    GROUP BY members.member_id, members.member_name
) AS result;

-- c11

SELECT books.category,
COUNT(issues.issue_id) AS total_issues
FROM books
JOIN issues
ON books.book_id = issues.book_id
GROUP BY books.category
ORDER BY total_issues DESC;

-- c12

SELECT title
FROM books
WHERE copies_available = 0
AND book_id IN (
    SELECT book_id
    FROM issues
    WHERE return_date IS NULL
);

