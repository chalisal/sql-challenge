
ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_title_id" FOREIGN KEY("title_id")
REFERENCES "employees" ("emp_title_id");

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no


--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT * FROM departments;
-- The department number of Sales department is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT * FROM departments;
-- The department numbers of Sales and Development departments are d007 and d005
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or departments.dept_no = 'd007';


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT last_name, COUNT(last_name) AS "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;