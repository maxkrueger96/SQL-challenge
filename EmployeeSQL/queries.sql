set search_path to sql_challenge_schema;

-- 1. List the following details of each employee:
-- employee number, last name, first name, sex, and salary.

select employees.employee_no, employees.last_name, 
	employees.first_name, employees.sex, salaries.salary
from employees
	inner join salaries
		on salaries.employee_no = employees.employee_no
order by employee_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

select employees.first_name, employees.last_name, employees.hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date < '1987-01-01'
order by hire_date;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select dept_managers.department_no, departments.department_name, 
dept_managers.employee_no, employees.last_name, employees.first_name
from dept_managers
	inner join employees
		on dept_managers.employee_no = employees.employee_no
	left join departments
		on dept_managers.department_no = departments.department_no
order by department_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select employees.employee_no, employees.last_name, 
employees.first_name, departments.department_name
from employee_dept
	left join employees
		on employees.employee_no = employee_dept.employee_no
	left join departments
		on departments.department_no = employee_dept.department_no
order by employee_no;

-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

select employees.first_name, employees.last_name, employees.sex
from employees
	where first_name = 'Hercules' and
	left(employees.last_name,1) = 'B'
order by last_name;

-- 6. List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

select employees.employee_no, employees.last_name, 
employees.first_name, departments.department_name
from employee_dept
	inner join employees
		on employee_dept.employee_no = employees.employee_no
	inner join departments
		on employee_dept.department_no = departments.department_no
	where department_name = 'Sales'
order by employee_no;

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.

select employees.employee_no, employees.last_name, 
employees.first_name, departments.department_name
from employee_dept
	inner join employees
		on employee_dept.employee_no = employees.employee_no
	inner join departments
		on employee_dept.department_no = departments.department_no
	where department_name = 'Sales' or 
		department_name = 'Development'
order by employee_no;

-- 8. In descending order, list the frequencycount of employee last names,
-- i.e., how many employees share each last name.

select employees.last_name, 
	count(last_name) as "freq"
from employees
	group by last_name
order by "freq" desc, last_name;
