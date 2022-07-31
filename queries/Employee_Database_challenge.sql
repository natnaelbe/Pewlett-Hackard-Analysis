select employees.emp_no, first_name, last_name, title, from_date, to_date 
into retirement_titles
from employees  join titles 
on employees.emp_no = titles.emp_no 
where birth_date  between   '1952-01-01'  and '1955-12-31'
order by employees.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name,last_name, title
INTO Unique_Titles
FROM  retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select count(*) count , title
into retiring_titles
from unique_titles 
group by title 
order by count desc;





select distinct on (employees.emp_no) employees.emp_no, first_name, last_name, birth_date, dept_emp.from_date, dept_emp.to_date, title 
into mentorship_eligibility
from employees  join dept_emp 
on employees.emp_no = dept_emp.emp_no
join titles
on employees.emp_no=titles.emp_no
where birth_date  between   '1965-01-01'  and '1965-12-31' and 
dept_emp.to_date='9999-01-01'
order by employees.emp_no;
