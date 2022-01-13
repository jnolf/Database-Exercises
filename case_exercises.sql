USE employees;

#1
SELECT e.first_name, e.last_name, de.dept_no, e.hire_date, de.to_date, 
   IF(
        (IF (de.to_date > NOW(), 1, 0)) = 1,
            CONCAT(e.first_name, ' ', e.last_name, ' is a current employee.'),
              CONCAT(e.first_name, ' ', e.last_name, ' is nobody to us.')) AS is_current_employee
FROM employees e
JOIN dept_emp de USING (emp_no);
 

#2
SELECT CONCAT(first_name, ' ', last_name) AS 'Employee Name',
CASE
    WHEN last_name BETWEEN 'A%' AND 'H%' THEN 'A-H'
      WHEN last_name BETWEEN 'I%' AND 'Q%' THEN 'I-Q'
       ELSE 'R-Z'
        END AS alpha_group
FROM employees;


#3
SELECT
CASE
    WHEN birth_date LIKE '195%' THEN 'The 50\'s'
    WHEN birth_date LIKE '196%' THEN 'The 60\'s' 
    END AS Birth_Decade,
     COUNT(*)
     FROM employees
GROUP BY Birth_Decade;

#4
SELECT
CASE 
  WHEN d.dept_name = 'Research' OR 'Development' THEN 'R&D'
  WHEN d.dept_name = 'Sales' OR 'Marketing' THEN 'Sales & Marketing'
  WHEN d.dept_name = 'Production' OR 'Quality Management' THEN 'Prod & QM'
  WHEN d.dept_name = 'Finance' OR 'Human Resources' THEN 'Finance & HR'
  ELSE 'Customer Service'
END AS Department_Group, ROUND(AVG(salary)) AS Average_Salary
FROM departments d
JOIN dept_emp de USING (dept_no)
JOIN salaries s USING (emp_no)
WHERE s.to_date > NOW()
GROUP BY Department_Group
ORDER BY Average_Salary;


SELECT *
FROM departments;


