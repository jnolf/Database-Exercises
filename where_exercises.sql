#WHERE
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# 709.

SELECT *
FROM employees
WHERE first_name ='Irena' 
OR first_name ='Vidya' 
OR first_name='Maya';
# 709 The same.

SELECT *
FROM employees
WHERE gender = 'M'
AND (first_name = 'Irena' 
OR FIRST_name='Vidya' 
OR first_name='Maya');
# 441

SELECT * 
FROM employees
WHERE last_name LIKE 'E%';
# 7330 start with E.

SELECT * 
FROM employees
WHERE last_name LIKE 'E%' 
OR last_name LIKE '%E';
#30723 begin or end with E.

SELECT last_name 
FROM employees
WHERE last_name LIKE '%E' 
AND NOT last_name LIKE 'E%';
# 23393 begin but do not end with Ee

SELECT last_name 
FROM employees
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E';
# 899 start and end with E.

SELECT last_name 
FROM employees
WHERE last_name LIKE '%E';
#24292 end with E.

SELECT *
FROM employees
WHERE hire_date LIKE '199%';
# 135214 hired in the 90's.

SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';
# 842 EE's born on Christmas

SELECT last_name 
FROM employees
WHERE last_name LIKE '%q%';
# 1873 with 'q' in their last name.

SELECT last_name 
FROM employees
WHERE last_name LIKE '%q%' 
AND NOT last_name LIKE '%qu%';
# 547 with 'q' but not 'qu'.




