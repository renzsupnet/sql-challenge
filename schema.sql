DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS DepartmentEmployee;
DROP TABLE IF EXISTS DepartmentManager;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Titles;


CREATE TABLE Departments(
    dep_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
)

CREATE TABLE Titles(
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
)

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
)

CREATE TABLE DepartmentEmployee(
    dep_no VARCHAR(4),
    emp_no INTEGER,
    PRIMARY KEY(dep_no, emp_no),
    FOREIGN KEY(dep_no)
    REFERENCES Departments(dep_no),
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
)

CREATE TABLE DepartmentManager(
    dept_no VARCHAR(4),
    emp_no INTEGER,
    PRIMARY KEY(dep_no, emp_no),
    FOREIGN KEY(dep_no)
    REFERENCES Departments(dep_no),
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
)

CREATE TABLE Salaries(
    emp_no INTEGER PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY(emp_no)
    REFERENCES Employees(emp_no)
)

