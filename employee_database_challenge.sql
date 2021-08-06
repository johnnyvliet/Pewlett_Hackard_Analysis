--/////Deliverable 1/////

select emp.emp_no, 
emp.first_name, 
emp.last_name, 
tt.titles, 
tt.from_date, 
tt.to_date
into Retirement_titles rt
from employees emp
inner join titles tt
on tt.emp_no = emp.emp_no
where emp.birth_date between '1952-01-01' and '1955-12-31'
order by emp.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.titles
INTO unique_titles
FROM retirement_titles rt
ORDER BY rt.emp_no, rt.to_date DESC;

--Number of employees by most recent job title who are about to retire

select distinct(titles)
into job_titles
from unique_titles

select ut.titles, count(jt.titles)
into retiring_titles
from unique_titles ut
inner join job_titles jt
on jt.titles = ut.titles
group by ut.titles


--/////Deliverable 2/////

select Distinct ON(emp.emp_no) emp.emp_no,
emp.first_name, 
emp.last_name, 
emp.birth_date,
de.from_date,
de.to_date,
tt.titles
--into mentorship_eligibility
from employees emp
inner join department_employees de
on de.emp_no = emp.emp_no
inner join titles tt
on tt.emp_no = emp.emp_no
where (de.to_date = '9999-01-01')
and (emp.birth_date between '1965-01-01' and '1965-12-31')
order by emp.emp_no



