DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS DepartmentEmployee CASCADE;
DROP TABLE IF EXISTS DepartmentManager CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE; 
DROP TABLE IF EXISTS Titles CASCADE;


CREATE TABLE Departments(
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
);

CREATE TABLE Titles(
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE Employees(
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(25) NOT NULL,
    birth_date Date,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR(1),
    hire_date DATE,
    FOREIGN KEY (emp_title_id)
    REFERENCES Titles(title_id)
);

CREATE TABLE DepartmentEmployee(
    dept_no VARCHAR(4),
    emp_no INTEGER,
    PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY(dept_no)
    REFERENCES Departments(dept_no),
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
);

CREATE TABLE DepartmentManager(
    dept_no VARCHAR(4),
    emp_no INTEGER,
    PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY(dept_no)
    REFERENCES Departments(dept_no),
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries(
    emp_no INTEGER PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
);

-- Import data from departments.csv into Departments table
\COPY Departments(dept_no, dept_name) FROM 'data/departments.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from titles.csv into Titles table
\COPY Titles(title_id, title) FROM 'data/titles.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from employees.csv into Employees table
\COPY Employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) FROM './data/employees.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from salaries.csv into Salaries table
\COPY Salaries(emp_no, salary) FROM 'data/salaries.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from dept_emp.csv into DepartmentEmployee table
\COPY DepartmentEmployee(emp_no, dept_no) FROM 'data/dept_emp.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Import data from dept_manager.csv into DepartmentManager table
\COPY DepartmentManager(dept_no, emp_no) FROM 'data/dept_manager.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');