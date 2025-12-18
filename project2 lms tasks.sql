SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;


-------------------------------------

-- Data exploration and analysis.

-- Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

insert into books(isbn, book_title, category, rental_price, status, author, publisher) values 
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

select * from books;

-- Task 2: Update an Existing Member's Address

update members
set member_address = '125 Oak St'
where member_id = 'C103';

select * from members;

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table

delete from issued_status where issued_id= 'IS121';


--Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101'

--Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_member_id, count(issued_id) as total_books_issued
from issued_status 
group by issued_member_id
having count(issued_id)>1;



-- Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results 
-- each book and total book_issued_cnt**

select b.isbn,b.book_title,
count(ist.issued_id) as num_issued
from books as b
join 
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1,2

-- Task 7. Retrieve All Books in a Specific Category:

select category, book_title from books 
group by 1,2;

select book_title from books
where category = 'Horror';

-- Task 8: Find Total Rental Income by Category:

select category, sum(rental_price) as total_rent from books
group by 1;

SELECT 
    b.category,
    SUM(b.rental_price),
    COUNT(*)
FROM 
issued_status as ist
JOIN
books as b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1

-- List Members Who Registered in the Last 180 Days:

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';

-------
