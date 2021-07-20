--SQL Homework

--1) emp_no , last_name , first_name , sex , salary
-- The tables we will need are employees and salaries

SELECT E.emp_no , E.last_name , E.first_name , E.sex , S.salary
FROM employees AS E
JOIN salaries AS S ON E.emp_no = S.emp_no;

--2) first_name , last_name , hire_date for employees hired on 1986
-- We only need the employees table for this query

SELECT first_name , last_name , hire_date
FROM employees
WHERE DATE_PART('year',hire_date) = 1986

--3) For each manager display: dept_no , dept_name , emp_no , last_name , first_name
-- Tables needed are the dept_manager > department > employees

-- Constructing Query from employees to the (dept_manager/department) join
SELECT J.dept_no , J.dept_name , J.emp_no , E.last_name , E.first_name
FROM employees AS E
JOIN (
-- Constructing the query from dept_manager to department

SELECT DM.dept_no , D.dept_name , DM.emp_no
FROM dept_manager AS DM
JOIN department AS D ON DM.dept_no = D.dept_no
	) AS J
ON E.emp_no = J.emp_no

--4) for each employee: emp_no , last_name , first_name , dept_name
-- Tables needed are dept_emp > department > employees

--Constructing the employees > dept_emp/department query

SELECT J.emp_no , E.last_name , E.first_name , J.dept_name
FROM employees AS E
JOIN(
--Constructing the dept_emp/department query

SELECT DE.emp_no , D.dept_name
FROM dept_emp AS DE
JOIN department AS D
ON DE.dept_no = D.dept_no
	) AS J
ON J.emp_no = E.emp_no

--5) first_name , last_name , sex for employees whose first name is Hercules and last name starts with B
-- Tables needed are employees

SELECT first_name , last_name , sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6) All employees in the sales department emp_no , last_name , first_name , dept_name
-- Tables needed are department > dept_emp > employees

--Cosntructing the employees > department/dept_emp query

SELECT J.emp_no , E.last_name , E.first_name , J.dept_name
FROM employees AS E
JOIN(
--Constructing dpeartment/dept_emp subquery

SELECT DE.emp_no , D.dept_name
FROM department AS D
JOIN dept_emp AS DE
ON D.dept_no = DE.dept_no
WHERE D.dept_no = 'd007'
	) AS J
ON E.emp_no = J.emp_no

--7) All employees from sales and developement departments emp_no , last_name , first_name , dept_name
-- Tables needed department > dept_emp > employees

--Cosntructing the employees > department/dept_emp query

SELECT J.emp_no , E.last_name , E.first_name , J.dept_name
FROM employees AS E
JOIN(
--Constructing dpeartment/dept_emp subquery

SELECT DE.emp_no , D.dept_name
FROM department AS D
JOIN dept_emp AS DE
ON D.dept_no = DE.dept_no
WHERE D.dept_no = 'd007' OR D.dept_no = 'd005'
	) AS J
ON E.emp_no = J.emp_no

--Looking for employees who work in both the development and sales departments yielded no results using "AND" operator
-- Instead looked for employees who worked in either or

--8) In Descending order list the count of each unique last name in the dataset
-- Tables needed are employees

SELECT emp_no , first_name , last_name , count(DISTINCT last_name) AS last_name_count
FROM employees
-- Consider using group by function to get last name count


