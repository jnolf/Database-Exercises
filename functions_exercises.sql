#FUNCTIONS
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY first_name;
# Irena Reutenauer, Vidya Simmen

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY first_name, last_name;
# Irena Acton, Vidya Zweizig

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
ORDER BY last_name, first_name;
# Irena Acton, Maya Zyda

SELECT * 
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;
# 899 returns, 10021 Ramzi Erde, 499648 Tadahiro Erde

SELECT * 
FROM employees
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E'
ORDER BY hire_date DESC;
# 899 returned, Teiji Eldridge, Sergi Erde

SELECT *
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date DESC;
# 362, Khun Bernini, Douadi Pettis

--

USE employees;

SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';


SELECT UPPER(CONCAT(first_name, ' ',last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

SELECT *, datediff(NOW(), hire_date) AS date_diff
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%12-25'
ORDER BY date_diff DESC;

SELECT min(salary), max(salary) FROM salaries;

SELECT *, LOWER(CONCAT(SUBSTR(first_name,1, 1), SUBSTR(last_name,1,4), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)))
FROM employees
LIMIT 10;
