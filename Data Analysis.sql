-- 1. List the employee number, last name, first name, sex, and salary of each employee.--

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees e 
LEFT JOIN salaries s on e.emp_no = s.emp_no;  

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.--

SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '01-01-1986' 
AND hire_date <= '12-31-1986';  

-- 3. List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.--

SELECT d.dept_no, d.dept_name, l.emp_no, l.last_name, l.first_name 
FROM departments d 
LEFT JOIN dept_emp e ON e.dept_no = d.dept_no 
LEFT JOIN employees l ON e.emp_no = l.emp_no; 

-- 4. List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.--

SELECT d.dept_no, e.emp_no, last_name, first_name, d.dept_name
FROM employees e 
LEFT JOIN dept_emp on dept_emp.emp_no = e.emp_no
LEFT JOIN departments d on d.dept_no = dept_emp.dept_no

-- 5. List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.--

SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their
-- employee number, last name, and first name.--

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.--

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).--

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
