-- Mod 7 Deliverable 1 Challenge Query
-- The Number of Retiring Employees by Title table

SELECT employees.emp_no,
	   employees.first_name,
	   employees.last_name,
	   titles.title,
	   titles.from_date,
	   titles.to_date
--INTO retirement_titles	
FROM titles
LEFT JOIN employees
ON titles.emp_no = employees.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;
	
-- Determine the # of employees by job titles

SELECT COUNT (unique_titles.emp_no), unique_titles.title
-- INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(*) DESC;

-- Mod 7 Deliverable 2 Challenge Query
-- Employees Eligible for the Mentorship program table

SELECT DISTINCT ON (emp_no) employees.emp_no,
	   employees.first_name,
	   employees.last_name,
	   employees.birth_date,
	   dept_emp.from_date,
	   dept_emp.to_date,
	   titles.title
INTO mentorship_eligibility
FROM employees
	LEFT JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
	LEFT JOIN titles
	ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND dept_emp.to_date = '9999-01-01'
ORDER BY employees.emp_no; 