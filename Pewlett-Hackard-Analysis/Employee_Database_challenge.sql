SELECT emp_no, first_name, last_name from employees
SELECT title, from_date, to_date from titles

SELECT emp_no, first_name, last_name
INTO retirement_info
from employees


SELECT employees.emp_no,
     employees.first_name,
     employees.last_name,
     titles.title,
	 titles.from_date,
	 titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31';

Select * from retirement_titles

SELECT DISTINCT ON (emp_no) *
INTO unique_titles
from retirement_titles
where to_date != '9999-01-01'
order by emp_no ASC

select * from unique_titles

select count(emp_no), title 
INTO retiring_titles
from unique_titles 
group by title
order by count(emp_no) DESC

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
	employees.first_name, 
	employees.last_name, 
	employees.birth_date,
	dept_emp.from_date, 
	dept_emp.to_date,
	titles.title
INTO mentorship_eligibility
from employees
INNER JOIN dept_emp
on employees.emp_no = dept_emp.emp_no
inner join titles 
on dept_emp.emp_no = titles.emp_no
where dept_emp.to_date = '9999-01-01' and employees.birth_date between '1965-01-01' and '1965-12-31'
order by emp_no














