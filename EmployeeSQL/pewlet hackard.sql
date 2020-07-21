-- 1. List the following details of each employee: employee number, 
--    last name, first name, sex, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
FROM employees as emp
INNER JOIN salaries ON
	emp.emp_no = salaries.emp_no 


-- 2. List first name, last name, and hire date for employees who 
--    were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
WHERE hire_date Like '%1986';


-- 3. List the manager of each department with the following information: department
--    number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
From departments d
INNER JOIN deptmanager dm ON dm.dept_no = d.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no


-- 4. List the department of each employee with the following information: employee 
--    number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
INNER JOIN deptemployee de ON de.dept_no = d.dept_no
INNER JOIN employees e ON e.emp_no = de.emp_no
order by e.emp_no


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" 
--    and last names begin with "B."
SELECT emp_no, first_name,  last_name,  sex
FROM employees  
WHERE first_name = 'Hercules' and last_name Like 'B%'
ORder by last_name;


-- 6. List all employees in the Sales department, including their employee number, 
--    last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
INNER JOIN deptemployee de ON de.dept_no = d.dept_no and d.dept_no = 'd007'
INNER JOIN employees e ON e.emp_no = de.emp_no
order by e.emp_no


-- 7. List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
From departments d
INNER JOIN deptemployee de ON de.dept_no = d.dept_no 
INNER JOIN employees e ON e.emp_no = de.emp_no
Where (d.dept_no = 'd007' or d.dept_no = 'd005')
order by e.emp_no


-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no)
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC