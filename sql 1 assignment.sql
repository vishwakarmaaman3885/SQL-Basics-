--CREATE DATABASE company_db;
--USE company_db;
--CREATE TABLE employees (
  --  employee_id INT PRIMARY KEY,
    --first_name VARCHAR(50),
   -- last_name VARCHAR(50),
   -- department VARCHAR(50),
   -- salary INT,
   -- hire_date DATE
);
--DESCRIBE employees;


--INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES
--(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
--(102, 'Riya', 'Kapoor', 'Sales', 60000, '2021-03-10'),
--(104, 'Neha', 'Verma', 'IT', 65000, '2022-11-05'),
--(105, 'Arjun', 'Singh', 'Finance', 70000, '2018-09-30');



--SELECT *
--ORDER BY salary ASC;

--select * 
--from employees
--where department = 'IT'
--order by hire_date desc;


--create table sales (
--sale_id int primary key, customer_name varchar (50), amount int,
--sale_date int );

--insert into Sales  (sale_id, customer_name, amount, sale_date)
--values
--(1, 'Aditi', 1500, 2024-08-01),
--(2, 'Rohan', 2200, 2024-08-03),
--(3, 'Aditi', 3500, 2024-09-05),
--(4, 'Meena', 2700, 2024-09-15),
--(5, 'Rohan', 4500, 2024-09-25);



--select *
--from sales
--order by amount desc ;



--select *
--from sales
--WHERE customer_name = 'Aditi';
