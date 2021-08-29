--set schema

set search_path to sql_challenge_schema;

--start with titles table as it has no dependencies

create table titles (
	title_id VARCHAR(10),
	title VARCHAR(30),
	primary key (title_id)
);

--departments is second as it also has no dependencies

create table departments (
	department_no VARCHAR(10),
	department_name VARCHAR(30),
	primary key (department_no)
);

--next make employees as it has many dependents and depends on titles
			
create table employees (
	employee_no INT,
	title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	sex VARCHAR(5),
	hire_date DATE,
	primary key (employee_no),
	foreign key (title_id) references titles (title_id)
);

--next will be salaries as it depends on employees

create table salaries (
	employee_no INT,
	salary INT,
	primary key (employee_no),
	foreign key (employee_no) references employees (employee_no)
);

--to finish, create employee dept and dept managers

create table employee_dept (
	employee_no INT,
	department_no VARCHAR(10),
	primary key (employee_no,department_no),
	foreign key (employee_no) references employees (employee_no),
	foreign key (department_no) references departments (department_no)
);

create table dept_managers (
	department_no VARCHAR(10),
	employee_no INT,
	primary key (department_no,employee_no),
	foreign key (department_no) references departments (department_no),
	foreign key (employee_no) references employees (employee_no)
);
