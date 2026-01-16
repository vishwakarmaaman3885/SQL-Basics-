                      -- Filtering and Sorting--
-- Note : Create the following dummy table in MySQL Workbench using CREATE FUNCTION--
-- Sample Table:Employees-- 

create database  newdatabase_employ;
use newdatabase_employ;

create table employees (
EmpID int primary key, EmpName varchar(50), Department varchar(50), City varchar(50), Salary int, HireDate date);

describe employees

insert into employees( EmpID, EmpName, Department, City, Salary, HireDate)
values
(101, 'Rahul Mehta', 'Sales', 'Delhi', 55000, '2020-04-12'),
(102, 'Priya Sharma', 'HR', 'Mumbai', 62000, '2019-09-25'),
(103, 'Aman Singh', 'IT', 'Bengaluru', 72000, '2021-03-10'),
(104, 'Neha Patel', 'Sales', 'Delhi', 48000, '2022-01-14'),
(105, 'Karan Joshi', 'Marketing', 'Pune', 45000, '2018-07-22'),
(106, 'Divya Nair', 'IT', 'Chennai', 81000, '2019-12-11'),
(107, 'Raj Kumar', 'HR', 'Delhi', 60000, '2020-05-28'),
(108, 'Simran Kaur', 'Finance', 'Mumbai', 58000, '2021-08-03'),
(109, 'Arjun Reddy', 'IT', 'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali Das', 'Sales', 'Kolkata', 51000, '2023-01-15');
  
  select *
  from employees;

-- Q.1: Show employees working in either the ‘IT’ or ‘HR’ departments.--
-- solution:-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE Department IN ('IT', 'HR');


-- Question 2 : Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’.--
--solution:-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE Department IN ('Sales', 'IT', 'HR');


-- Q.3: Display employees whose salary is between ₹50,000 and ₹70,000.--
-- solution-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
where salary between 50000 and 70000;


-- Q.4: List employees whose names start with the letter ‘A’.--
 --solution-
 
 SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE EmpName LIKE 'A%';

-- Q.5: Find employees whose names contain the substring ‘an’.--
-- solution-

  SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE EmpName LIKE '%an';



-- Q.6:  Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000.--
-- solution-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE (City = 'Delhi' OR City = 'Mumbai')
  AND Salary > 55000;
  
  
  -- Q.7:  Display all employees except those from the ‘HR’ department.--
-- solution-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE Department <> 'HR';


-- Q.8:  Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).--
--solution-

SELECT EmpID, EmpName, Department, City, Salary, HireDate
FROM employees
WHERE HireDate BETWEEN '2019-01-01' AND '2022-12-31'
ORDER BY HireDate ASC;

