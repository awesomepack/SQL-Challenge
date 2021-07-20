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

