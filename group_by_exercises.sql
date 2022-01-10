USE employees;

#2
SELECT DISTINCT title
FROM titles;
-- 7 distinct titles

#3
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e' 
GROUP BY last_name;

#4
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'e%' AND last_name LIKE '%e' 
GROUP BY first_name, last_name;

#5
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' 
AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

#6
SELECT last_name, count(last_name) AS same_last_name
FROM employees
WHERE last_name LIKE '%q%' 
AND NOT last_name LIKE '%qu%'
GROUP BY last_name;

#7
SELECT first_name, gender, count(*) AS same_first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender
ORDER BY  first_name;

#8
SELECT LOWER(
    CONCAT(
              SUBSTR(first_name,1, 1),
              SUBSTR(last_name,1,4),
                 '_',
                  SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)))
AS user_name, 
   COUNT(*) AS dups
FROM employees
GROUP BY user_name
HAVING dups > 1
ORDER BY dups DESC; 
-- Yes. There are 13251 usernames duplicated.

#9
USE employees;

SELECT *
FROM salaries;

SELECT salary, emp_no
FROM salaries
GROUP BY emp_no, salary
ORDER BY AVG(salary);


SELECT *
FROM dept_emp;

SELECT dept_no, count(dept_no) AS dept_count
FROM dept_emp
GROUP BY dept_no;

SELECT emp_no, count(salary) AS no_of_salaries
FROM salaries
GROUP BY emp_no;

-- Max
SELECT emp_no, max(salary) AS highest_salary
FROM salaries
GROUP BY emp_no;

-- Min
SELECT emp_no, min(salary) AS lowest_salary
FROM salaries
GROUP BY emp_no;

-- Standard Deviation
SELECT emp_no, STDDEV(salary) AS STDDEV_salary
FROM salaries
GROUP BY emp_no;

-- Max with range
SELECT emp_no, max(salary) AS emp_salary
FROM salaries
GROUP BY emp_no
HAVING emp_salary > 150000;

-- Range of average
SELECT emp_no, max(salary) AS avg_salary_80_to_90
FROM salaries
GROUP BY emp_no
HAVING avg_salary_80_to_90 BETWEEN 80000 AND 90000;


