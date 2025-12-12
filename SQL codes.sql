--  Create table students and insert 2 rows
CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students(id, name, marks) VALUES
(1, 'Arun', 85),
(2, 'Priya', 72);

--  Create table employees and insert 2 rows
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

INSERT INTO employees(emp_id, emp_name, salary) VALUES
(101, 'Kumar', 8000),
(102, 'Divya', 9000);

--  Create table products and insert 3 rows
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

INSERT INTO products(product_id, product_name, price) VALUES
(1, 'Keyboard', 450),
(2, 'Headphones', 750),
(3, 'Mouse', 300);

-- Update an employee's salary by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE emp_id = 101;

--  Delete a product where price > 500
DELETE FROM products
WHERE price > 500;

--  Select all students with marks > 80
SELECT * FROM students
WHERE marks > 80;

--  Recursive CTE to increase salary by 1000 until it reaches 10,000
WITH RECURSIVE salary_increment(emp_id, emp_name, salary) AS (
    SELECT emp_id, emp_name, salary
    FROM employees
    WHERE emp_id = 101

    UNION ALL

    SELECT emp_id, emp_name, salary + 1000
    FROM salary_increment
    WHERE salary < 10000
)
SELECT * FROM salary_increment;

--  Rename employees to staff_members
ALTER TABLE employees RENAME TO staff_members;

--  Add new column remarks to students
ALTER TABLE students
ADD remarks TEXT;

-- Create backup table with all rows
CREATE TABLE students_backup AS
SELECT * FROM students;
