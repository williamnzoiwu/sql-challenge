# sql-challenge
## SQL Module 9 Challenge
This code creates 6 tables to import data from the fictional company Pewlett Hackard. The tables are as follows: departments, titles, employees, department managers, employee departments, and salaries. The tables are each created with the following columns:
Departments:
  - dept_no
  - dept_name
Titles:
  - title_id
  - title
Employees:
  - emp_no
  - emp_title_id
  - birth_date
  - first_name
  - last_name
  - sex
Department Managers:
  - dept_no
  - emp_no
Employee Department:
  - emp_no
  - dept_no
Salaries:
  - emp_no
  - salary
Each table is created with a primary key, with the employees, department managers, employee departments and salaries tables also containing foreign keys as they contain columns overlapping with previously created tables.  The data for these tables are contained in csv files, respectively titled "departments.csv", "titles.csv", "employees.csv", "dept_managers.csv", "dept_emp.csv", and "salaries.csv". After the tables and columns are created, the data is then imported through the import/export data method, which is not seen in the script. The csv files are imported to their respective tables, and then certain data is pulled from each table:
First a dataset is created listing the employee number, last name, first name, sex, and salary for each employee. This data is taken from the employees and salaries table, so this is done through joining the two tables.
The next dataset lists the first name, last name, and hire date for the employees who were hired in 1986. This data is taken entirely from the employees table, and the year is extracted from the hire date to see which employees were hired in 1986.
The next dataset lists the manager of each department along with their department number, department name, employee number, last name, and first name. This data is taken from the departments, department managers, and employees table. It is done by joining the departments and employees table with the department managers table. It is joined to the department managers table and not the employees table to only list the employees that appear on the department managers table.
The next dataset lists the department number for each employee along with that employee’s employee number, last name, first name, and department name. This is done by joining the employees and departments table with the employee department table.
The next dataset lists the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. This is done by selecting those specific columns from the employees table, and then using the WHERE function to find all employees whose first name is Hercules. Then the 'and' functions is executed to pair that condition with one that finds employees whose last name starts with 'b': "last_name LIKE 'B'."
The next dataset lists each employee in the sales department, including their employee number, last name, and first name. This is done by joining the employees table with the joining the employees table with the employee department table where the department number is "d007," which is the number for the sales department. I also opted to join the departments table as well in order to display the department name to more clearly show that these employees do in fact all belong the sales department.
The next dataset lists each employee in the sales and development departments, including their employee number, last name, first name, and department name. This dataset is created exactly like the last one, except an OR is added to the WHERE function to add the development department, which has the department number 'd005.' The OR function allows the program to display all employees belonging to either department.
The last dataset the frequency counts, in descending order, of all the employee last names, or how many employees share each last name. This is done by taking the "last_name" column from the employees table, and also the occurence of each last name by using the COUNT function. It then labels the occurence of each last name as "last_name_count," and displays the frequency of each last name next along with the respective name.
