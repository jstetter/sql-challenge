--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, f.salary
from employees e left join salaries f 
on e.emp_no = f.emp_no;

--2. List employees who were hired in 1986.
select *
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.
select e.dept_no, f.dept_name, e.emp_no, g.last_name, g.first_name, e.from_date, e.to_date
from department_managers e left join departments f 
on e.dept_no = f.dept_no left join employees g
on e.emp_no = g.emp_no;

--4. List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
select e.emp_no, e.last_name, e.first_name, g.dept_name
from employees e left join department_employees f on e.emp_no = f.emp_no
left join departments g on f.dept_no = g.dept_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
where first_name = 'Hercules'
and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select e.emp_no, e.last_name, e.first_name, g.dept_name
from employees e left join department_employees f on e.emp_no = f.emp_no
left join departments g on f.dept_no = g.dept_no
where g.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, g.dept_name
from employees e left join department_employees f on e.emp_no = f.emp_no
left join departments g on f.dept_no = g.dept_no
where g.dept_name = 'Sales' or g.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
select last_name, count(first_name) from employees
group by 1
order by 2 desc;

