USE join_example_db;

SELECT *
FROM roles;

SELECT *
FROM users;

-- INNER-join
SELECT *
FROM users
JOIN roles
ON users.role_id = roles.id;

-- Left-join
SELECT *
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

-- Right-join
SELECT *
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

-- COUNT
SELECT roles.name AS role, count(role_id) AS role_count
FROM users
JOIN roles
ON users.role_id = roles.id
GROUP BY roles.name;

-- -- -- -- -- -- -- -- 

USE employees;

SHOW TABLES
FROM employees;

-- Associative Example:
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

#1
USE employees;

#2
SELECT dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Employee NAME'
FROM dept_manager AS dm
JOIN departments AS d
  ON dm.dept_no = d.dept_no
 JOIN employees AS e
   ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999%'
ORDER BY dept_name;

#3
SELECT dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Employee NAME'
FROM dept_manager AS dm
JOIN departments AS d
  ON dm.dept_no = d.dept_no
 JOIN employees AS e
   ON dm.emp_no = e.emp_no
WHERE dm.to_date LIKE '9999%' AND e.gender = 'F'
ORDER BY dept_name;

#4
SELECT t.title AS Title, COUNT(*)
FROM dept_emp AS de
 JOIN titles AS t
   ON de.emp_no = t.emp_no
  JOIN departments AS d
    ON de.dept_no = d.dept_no
 WHERE dept_name LIKE 'Customer Service' AND t.to_date LIKE '9999%' AND de.to_date LIKE '999%'
 GROUP BY title
 ORDER BY title;

#5
SELECT dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Employee NAME'
FROM dept_manager AS dm
JOIN departments AS d
  ON dm.dept_no = d.dept_no
 JOIN employees AS e
   ON dm.emp_no = e.emp_no
  JOIN salaries AS s
   ON e.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999%' AND s.to_date LIKE '9999%'
ORDER BY dept_name;

#6
SELECT de.dept_no AS dept_no, d.dept_name AS dept_name, COUNT(*) AS num_employees
FROM employees AS e
 JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
  JOIN departments AS d
   ON de.dept_no = d.dept_no
WHERE de.to_date LIKE '9999%'
GROUP BY dept_no, dept_name
ORDER BY dept_no; 

#7
SELECT d.dept_name AS dept_name, AVG(s.salary) AS average_salary
FROM salaries AS s
  JOIN dept_emp AS de
    ON s.emp_no = de.emp_no
   JOIN departments AS d
     ON d.dept_no = de.dept_no
  WHERE s.to_date LIKE '9999%'
 GROUP BY dept_name
 ORDER BY average_salary DESC
 LIMIT 1;
 
 
#8
SELECT e.first_name AS First_Name, e.last_name AS Last_Name
FROM employees AS e
 JOIN salaries AS s
   ON e.emp_no = s.emp_no   
  JOIN dept_emp AS de
   ON s.emp_no = de.emp_no   
  JOIN departments AS d
   ON d.dept_no = de.dept_no  
WHERE de.to_date LIKE '9999%' AND d.dept_name LIKE 'Marketing'
ORDER BY Salary DESC
LIMIT 1;

    
#9
SELECT e.first_name AS first_name, e.last_name AS last_name, MAX(s.salary) AS salary, d.dept_name
FROM employees AS e
JOIN dept_manager AS dm
  ON e.emp_no = dm.emp_no
JOIN departments AS d
  ON dm.dept_no = d.dept_no
JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE dm.to_date LIKE '9999%'
GROUP BY first_name, last_name, salary, d.dept_name
ORDER BY salary DESC
LIMIT 1;


#10
SELECT dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
  ON d.dept_no = de.dept_no
JOIN salaries AS s
  ON de.emp_no = s.emp_no
JOIN employees AS e
  ON e.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY average_salary DESC;

#11
SELECT *


    
-- SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Departmant Name', dm 
SELECT *
FROM employees AS e 
  JOIN dept_emp AS de
     ON e.emp_no = de.emp_no
   JOIN department AS d
     ON de.dept_name = d.dept_name
   JOIN department_manager AS dm
     ON de.emp_no = dm.emp_no
   JOIN titles AS t
     ON dm.emp_no = t.emp_no;
    
SELECT *
FROM dept_manager;
