-- CHALLENGE DELIVERABLE 1 Employee Database Challenge

SELECT e.emp_no,
e.first_name,
e.last_name, 
tit.title,
tit.from_date,
tit.to_date
INTO retirement_challenge_table
FROM employees as e
LEFT JOIN titles as tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;
SELECT * FROM retirement_challenge_table

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles_table
FROM retirement_challenge_table AS r
ORDER BY r.emp_no, r.to_date DESC;
SELECT * FROM unique_titles_table

SELECT COUNT(u.title), u.title
INTO retiring_titles_table
FROM unique_titles_table as u
GROUP BY u.title 
ORDER BY count DESC;
SELECT * FROM retiring_titles_table