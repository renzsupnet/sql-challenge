-- Import data from departments.csv into Departments table
COPY Departments(dep_no, dept_name)
FROM '../data/departments.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from dept_emp.csv into DepartmentEmployee table
COPY DepartmentEmployee(emp_no, dept_no)
FROM '../data/dept_emp.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from dept_manager.csv into DepartmentManager table
COPY DepartmentManager(dept_no, emp_no)
FROM '../data/dept_manager.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from employees.csv into Employees table
COPY Employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '../data/employees.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from salaries.csv into Salaries table
COPY Salaries(emp_no, salary)
FROM '../data/salaries.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from titles.csv into Titles table
COPY Titles(title_id, title)
FROM '../data/titles.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');




-- List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM DepartmentManager dm
JOIN Departments d ON dm.dept_no = d.dep_no
JOIN Employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.dep_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM DepartmentEmployee de
JOIN Employees e ON de.emp_no = e.emp_no
JOIN Departments d ON de.dep_no = d.dep_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM Employees e
JOIN DepartmentEmployee de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dep_no = d.dep_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e
JOIN DepartmentEmployee de ON e.emp_no = de.emp_no
JOIN Departments d ON de.dep_no = d.dep_no
WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;