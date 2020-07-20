﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/cdTFnN
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(255)   NOT NULL,
    "birth_date" VARCHAR(255)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(25)   NOT NULL,
    "hire_date" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "DeptEmployee" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
    "PRIMARY" KEY(emp_no,dept_no)   NOT NULL
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "DeptManager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL,
    "PRIMARY" KEY(dept_no,emp_no)   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees__emp_title_id" FOREIGN KEY("", "emp_title_id")
REFERENCES "Titles" ("", "title_id");

ALTER TABLE "DeptEmployee" ADD CONSTRAINT "fk_DeptEmployee__emp_no" FOREIGN KEY("", "emp_no")
REFERENCES "Employees" ("", "emp_no");

ALTER TABLE "DeptEmployee" ADD CONSTRAINT "fk_DeptEmployee__dept_no" FOREIGN KEY("", "dept_no")
REFERENCES "Departments" ("", "dept_no");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager__dept_no" FOREIGN KEY("", "dept_no")
REFERENCES "Departments" ("", "dept_no");

ALTER TABLE "DeptManager" ADD CONSTRAINT "fk_DeptManager__emp_no" FOREIGN KEY("", "emp_no")
REFERENCES "Employees" ("", "emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries__emp_no" FOREIGN KEY("", "emp_no")
REFERENCES "Employees" ("", "emp_no");

