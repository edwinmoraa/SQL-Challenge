CREATE TABLE departments(dept_no VARCHAR NOT NULL PRIMARY KEY,
						dept_name VARCHAR NOT NULL);
						
CREATE TABLE dept_emp(emp_no INT NOT NULL,
					  dept_no VARCHAR NOT NULL,
					  from_date VARCHAR NOT NULL,
					  to_date VARCHAR NOT NULL);
					  
CREATE TABLE salaries(emp_no INT NOT NULL,
					  salary INT NOT NULL,
					  from_date VARCHAR NOT NULL,
					  to_date VARCHAR NOT NULL);

CREATE TABLE titles(emp_no INT NOT NULL,
				    title VARCHAR NOT NULL,
				    from_date VARCHAR NOT NULL,
				    to_date VARCHAR NOT NULL);

CREATE TABLE employees(emp_no INT NOT NULL PRIMARY KEY,
					   birth_date VARCHAR NOT NULL,
					   first_name VARCHAR NOT NULL,
					   las_name VARCHAR NOT NULL,
					   gender VARCHAR NOT NULL,
					   hire_date VARCHAR NOT NULL);
	
CREATE TABLE manager(dept_no VARCHAR NOT NULL,
						 emp_no INT NOT NULL,
						 from_date VARCHAR NOT NULL,
						 to_date VARCHAR NOT NULL);
	
SELECT*FROM titles;
	
	-- get the employees' number, last name, first name, gender and salary
	-- make into table
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;
	
	-- list of the employees hired in 1986
	-- make table
SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

	-- list the manager of each department with dept. number, dept. name, manager's employee number,
	-- last name, first name, start and end employment dates
	-- make table
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, e.hire_date, m.to_date
FROM manager m
INNER JOIN departments d ON m.dept_no = d.dept_no
INNER JOIN employees e ON m.emp_no = e.emp_no;

	-- list department of each employee with emp. number, last name, first name, and department name
	-- make table
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

	-- list employees who's first name is "Hercules" and last names that begin with "B"
	-- make table
SELECT*
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

	-- list employees in the sales departments, with emp. number, last name, first name, and department name
	-- make table
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

	-- list employees in the sales & development departments, with emp. number, last name, first name, and department name
	-- make table
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name as department
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

	-- list the frequency count of employee last names (how many employees share a last name) in descending order
	-- make table
SELECT last_name, count(*) AS count
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;

		
		