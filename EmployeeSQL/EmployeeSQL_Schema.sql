-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/w7iWKr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "department" (
    "dept_no" VARCHAR(50)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

-- Composite Key(dept_no & emp_no)
CREATE TABLE "dept_emp" (
    "dept_no" VARCHAR(50)   NOT NULL,
    "emp_no" BIGINT   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "manager_id" INT   NOT NULL,
    "dept_no" VARCHAR(50)   NOT NULL,
    "emp_no" BIGINT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "manager_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" BIGINT   NOT NULL,
    "emp_title_id" VARCHAR(50)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "sex" VARCHAR(50)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Composite Key(emp_no & salary)
CREATE TABLE "salaries" (
    "emp_no" BIGINT   NOT NULL,
    "salary" MONEY   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no","salary"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(50)   NOT NULL,
    "title" vARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

