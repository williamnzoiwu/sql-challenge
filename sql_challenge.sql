--Create departments table and insert values
create table departments (
	dept_no varchar (255) primary key not null,
	dept_name varchar(255)
	);
select * from departments;

--Create titles table and insert values
create table titles (
	title_id varchar(255) primary key not null,
	title varchar(255)
	);
select * from titles;

--Create employees table
create table employees (
	emp_no int,
	emp_title_id varchar (255),
	birth_date date,
	first_name varchar (255),
	last_name varchar (255),
	sex varchar (255),
	hire_date date,
	primary key (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
	);
select * from employees;

--Create department manager table
create table dept_manager (
	dept_no varchar (255),
	emp_no int,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
	);
select * from dept_manager;

--Create employee department table
create table dept_emp (
	emp_no int,
	dept_no varchar (255),
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
	);
select * from dept_emp;

--Create salaries table
create table salaries (
	emp_no int,
	salary int,
	primary key (emp_no),
	foreign key (emp_no) references employees (emp_no)
	);
select * from salaries;

--List employee number, last name, first name, sex, and salary for each employee.
select e.emp_no, last_name, first_name, sex, salary
from employees e
join salaries s
on (e.emp_no = s.emp_no);

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees
where extract(year from hire_date) = 1986

--List the manager of each department along with their department number, department name,
--employee number, last name, and first name
select dm.dept_no, d.dept_name, e.emp_no, last_name, first_name
from dept_manager dm
join departments d
on (dm.dept_no = d.dept_no)
join employees e
on (dm.emp_no = e.emp_no);

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
select de.dept_no, e.emp_no, last_name, first_name, d.dept_name
from dept_emp de
join employees e
on (de.emp_no = e.emp_no)
join departments d
on (de.dept_no = d.dept_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose
--last name begins with the letter B.
select first_name, last_name, sex from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and
--first name.
select de.dept_no, d.dept_name, de.emp_no, last_name, first_name
from dept_emp de
join employees e
on (de.emp_no = e.emp_no)
join departments d
on (de.dept_no = d.dept_no)
where de.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
select de.dept_no, d.dept_name, de.emp_no, last_name, first_name
from dept_emp de
join employees e
on (de.emp_no = e.emp_no)
join departments d
on (de.dept_no = d.dept_no)
where de.dept_no = 'd007' or de.dept_no = 'd005';

--List the frequency counts, in descending order, of all the employee last names (that is, how
--many employees share each last name).
select last_name, count(last_name) as "last_name_count"
from employees
group by last_name
order by "last_name_count" desc;
