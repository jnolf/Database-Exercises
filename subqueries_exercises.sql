USE employees;

#1
SELECT first_name, last_name, hire_date, emp_no 
  FROM employees
  WHERE emp_no IN (
SELECT emp_no
  FROM dept_emp
  WHERE to_date > NOW() AND hire_date = (
SELECT hire_date
  FROM employees
  WHERE emp_no = '101010')
 );


#2
SELECT DISTINCT title AS 'Aamods\' Titles'
FROM titles
WHERE emp_no IN (
SELECT emp_no
FROM employees
WHERE first_name LIKE 'Aamod'
) AND to_date > NOW();
 
 
#3
SELECT count(first_name)
FROM employees
WHERE emp_no NOT IN (
 SELECT emp_no
  FROM dept_emp
   WHERE to_date LIKE '9999%'
  );
-- 59900 are not current employees
  
  
#4
SELECT first_name, last_name, gender
FROM employees
WHERE gender = 'F' AND emp_no IN(
SELECT emp_no
FROM dept_manager
WHERE to_date > NOW()
);
-- Isamu, Karsten, Leon, and Hilary


#5
SELECT first_name, last_name
FROM employees
WHERE emp_no IN(
  SELECT emp_no
    FROM salaries
    WHERE salary > (
  SELECT AVG(salary)
    FROM salaries)
    AND emp_no IN(
  SELECT emp_no
    FROM dept_emp
    WHERE to_date > NOW()
));


#6
SELECT  COUNT(*) AS 1_sd_away
FROM salaries
WHERE to_date > NOW() AND salary > (
SELECT max(salary) - stddev(salary)
FROM salaries
WHERE to_date > NOW());

 
 SELECT *
 FROM salaries;


