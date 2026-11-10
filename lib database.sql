create database librarydb;
use librarydb;

create table members (
    member_id int primary key auto_increment,
    member_name varchar(100) not null,
    member_type enum('Student','Faculty') not null,
    joined_date date
);

create table books (
    book_id int primary key auto_increment,
    title varchar(150) not null,
    author varchar(100),
    category varchar(100),
    price decimal(10,2),
    copies_available int default 0
);

-- issues table, links members and books
create table issues (
    issue_id int primary key auto_increment,
    member_id int not null,
    book_id int not null,
    issue_date date not null,
    due_date date not null,
    return_date date null,
    foreign key (member_id) references members(member_id),
    foreign key (book_id) references books(book_id)
);

-- check if everything got created
show tables;
desc members;
desc books;
desc issues;