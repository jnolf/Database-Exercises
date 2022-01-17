USE employees;
USE innis_1657;
SHOW TABLES;

-- Create a new temp table
CREATE TEMPORARY TABLE employees_with_departments();

-- Messed that up?
DROP TABLE employees_with_departments;

-- #1 Create a new table
CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT * 
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE to_date > NOW()
);


-- Check work to see if all info is correct
SELECT * 
FROM employees_with_departments;

-- Verify database
SELECT DATABASE();

-- Verify table is correct
DESCRIBE employees_with_departments;

-- a. Add a new column
ALTER TABLE employees_with_departments 
ADD full_name VARCHAR(50);

-- b. Enter new info
UPDATE employees_with_departments 
SET full_name = CONCAT(first_name, ' ', last_name);

-- Check Work
SELECT *
FROM employees_with_departments;

-- c. Drop info no needed
ALTER TABLE employees_with_departments 
DROP COLUMN first_name, 
DROP COLUMN last_name;

-- #2 Create temp table

USE sakila;
USE innis_1657;

-- Create a new table
CREATE TEMPORARY TABLE sakila_payment_table AS(
SELECT *
FROM sakila.payment);

-- Select
SELECT *
FROM sakila_payment_table;

-- Messed up?
DROP TABLE sakila_payment_table;

-- Check Table info 
DESCRIBE sakila_payment_table;

-- Change decimal type
ALTER TABLE sakila_payment_table
CHANGE amount penny_amount DECIMAL(6,2);

-- Make a pennies amount
UPDATE sakila_payment_table SET penny_amount = penny_amount * 100;

-- Change type to INT
ALTER TABLE sakila_payment_table CHANGE penny_amount penny_amount INT;

-- Verify work
SELECT *
FROM sakila_payment_table;


#3 
USE innis_1657;
USE employees;

-- Mess up? Probably...
DROP TABLE innis_1657.dept_avg_salary;

-- Create average dept salary temp
CREATE TEMPORARY TABLE innis_1657.dept_avg_salary AS
SELECT d.dept_name AS Department, AVG(s.salary) AS avg_dept_sal
FROM departments d 
JOIN dept_emp de USING (dept_no)
JOIN employees e USING (emp_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW()
GROUP BY d.dept_name;

-- Verify work
SELECT *
FROM innis_1657.dept_avg_salary;

-- Find zscore per department
SELECT Department, avg_dept_sal, (avg_dept_sal - (
  SELECT AVG(salary) 
  FROM salaries))
  /
  (SELECT STDDEV(salary) 
  FROM salaries) AS zscore
FROM innis_1657.dept_avg_salary
ORDER BY zscore DESC;


