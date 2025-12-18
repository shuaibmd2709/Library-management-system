-- LIBRARY MANAGEMENT SYSTEM--

-- CREATING BRANCH TABLE -- 

drop table if exists branch;

CREATE TABLE branch( 
	branch_id	varchar(10) primary key,
	manager_id	varchar(10),
	branch_address	varchar(55),
	contact_no varchar(15)

);

SELECT * from branch;

-- CREATING EMPLOYEES TABLE--

drop table if exists employees;

CREATE TABLE employees
( 

emp_id	varchar(10) primary key,
emp_name	varchar(25),
position	varchar(15),
salary	int,
branch_id varchar(10) -- fk

);

-- creating books table -- 

drop table if exists books;

create table books( 
		isbn	varchar(50) primary key,
		book_title	varchar(55),
		category	varchar(55),
		rental_price float,	
		status	varchar(5),
		author	varchar(55),
		publisher varchar(55)

);

--- creating table members -- 

drop table if exists members;

create table members(
	member_id	varchar(10) primary key,
	member_name	varchar(25),
	member_address varchar(20),	
	reg_date date

);

-- creating table return status -- 

drop table if exists return_status;

create table return_status(
	return_id	varchar(10) primary key,
	issued_id	varchar(10), --fk
	return_book_name	varchar(10),
	return_date	date,
	return_book_isbn varchar(10)
);

-- creating table issued_status -- 

drop table if exists issued_status;

create table issued_status(
		issued_id	varchar(10) primary key,
		issued_member_id	varchar(10), --fk
		issued_book_name	varchar(50),
		issued_date	date,
		issued_book_isbn	varchar(50),
		issued_emp_id varchar(10)

);

-- foregin key -- 

alter table issued_status
add constraint fk_members 
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_employees 
foreign key (issued_emp_id)
references employees(emp_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_return
foreign key (issued_id)
references issued_status(issued_id);






