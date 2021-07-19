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