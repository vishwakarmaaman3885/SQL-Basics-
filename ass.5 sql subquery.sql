										         -- SubQueries
											--  Assignment Question
                                            
-- Assignment Questions

-- Employee Dataset:
drop table employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id VARCHAR(10),
    salary INT
);

INSERT INTO employees (emp_id, name, department_id, salary) VALUES
(101, 'Abhishek', 'D01', 62000),
(102, 'Shubham',  'D01', 58000),
(103, 'Priya',    'D02', 67000),
(104, 'Rohit',    'D02', 64000),
(105, 'Neha',     'D03', 72000),
(106, 'Aman',     'D03', 55000),
(107, 'Ravi',     'D04', 60000),
(108, 'Sneha',    'D04', 75000),
(109, 'Kiran',    'D05', 70000),
(110, 'Tanuja',   'D05', 65000);

SELECT * FROM employees;


-- Department Dataset:

CREATE TABLE departments (
    department_id VARCHAR(5) PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, location) VALUES
('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

SELECT * FROM departments;


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    sale_amount INT,
    sale_date DATE
);

INSERT INTO sales (sale_id, emp_id, sale_amount, sale_date) VALUES
(201, 101, 4500, '2025-01-05'),
(202, 102, 7800, '2025-01-10'),
(203, 103, 6700, '2025-01-14'),
(204, 104, 12000, '2025-01-20'),
(205, 105, 9800, '2025-02-02'),
(206, 106, 10500, '2025-02-05'),
(207, 107, 3200, '2025-02-09'),
(208, 108, 5100, '2025-02-15'),
(209, 109, 3900, '2025-02-20'),
(210, 110, 7200, '2025-03-01');


SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM sales;

-- Basic Level

-- 1. Retrieve the names of employees who earn more than the average salary of all employees.
-- Solution:-

SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);


-- 2. Find the employees who belong to the department with the highest average salary.
-- solution:-
SELECT  e.emp_id, e.name, e.department_id, e.salary
FROM employees as e 
join  departments as d on e.department_id = d.department_id
WHERE e.department_id = (
    SELECT   department_id 
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);



-- 3. List all employees who have made at least one sale.
-- solution-

select distinct name
from employees 
where emp_id in (select emp_id 
from sales);

-- 4. Find the employee with the highest sale amount.
-- solution

select e.emp_id, e.name, s.sale_amount
from employees as e
join sales as s on e.emp_id = s.emp_id
where s.sale_amount =(select max(sale_amount)
from sales );


-- 5. Retrieve the names of employees whose salaries are higher than Shubham’s salary.
-- Solution:-

select name
from employees
 where salary > (select salary
from employees 
where name = 'Shubham'
order by salary desc);


-- Intermediate Level


-- 6. Find employees who work in the same department as Abhishek.
-- solution:-


select *
from employees
 where department_id = (select department_id
from employees 
where name = 'Abhishek'
);


-- 7. List departments that have at least one employee earning more than ₹60,000.
-- solution-

select DISTINCT d.department_name
from employees as e
join departments as d on 
e.department_id = d.department_id
where salary > (select salary
from employees
where salary = 60000 );


-- 8. Find the department name of the employee who made the highest sale.
-- solution:-

select d.department_name as Department
from departments as d
join employees as e on
 e.department_id = d.department_id

where e.emp_id = (select emp_id
from sales 
group by emp_id
order by max(sale_amount) desc
limit 1
);


-- 9. Retrieve employees who have made sales greater than the average sale amount.
-- solution--

SELECT distinct e.name
FROM employees as e
JOIN sales as s ON e.emp_id = s.emp_id
WHERE s.sale_amount > (SELECT AVG(sale_amount) FROM sales);


-- 10. Find the total sales made by employees who earn more than the average salary.
-- Solution:-

SELECT SUM(s.sale_amount) AS total_sales
FROM sales as s
JOIN employees as e ON s.emp_id = e.emp_id
WHERE e.salary > (SELECT AVG(salary) FROM employees);



-- Advanced Level


-- 11 .Find employees who have not made any sales.
-- solution-

select name
from employees 
where emp_id not in (select emp_id
from sales);


-- 12.List departments where the average salary is above ₹55,000.
-- solution-

select department_name
from departments 
where department_id in (select department_id
from employees
group by department_id
having avg(salary) > 55000);


-- 13.Retrieve department names where the total sales exceed ₹10,000.
-- solution:-

SELECT department_name
From departments
where department_id in (select e.department_id
from employees as e
join sales as s on e.emp_id = s.emp_id
group by e.department_id
having sum(s.sale_amount) > 10000
);


-- 14.Find the employee who has made the second-highest sale.
-- solution-

select e.name, s.sale_amount
from employees as e
join sales as s ON e.emp_id = s.emp_id
where s.sale_amount = (select max(sale_amount)
from sales
where sale_amount < (select max(sale_amount) from sales)
);



-- 15.Retrieve the names of employees whose salary is greater than the highest sale amount recorded.
-- solution-

select e.name
from employees as e
join sales as s ON e.emp_id = s.emp_id
where e.salary  > (select max(sale_amount)
from sales);




