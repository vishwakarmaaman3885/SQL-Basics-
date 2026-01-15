create DATABASE newdatabase; 
use newdatabase;

drop table employees;

create table employees (
id int,
Full_name varchar(50),
department varchar(50),
salary varchar(50));

insert into employees (id, Full_name, department, salary)
values 
(1,'Tushar Jha', 'Data Science', 50000),
(2, 'Aman Kumar', 'Sales', 60000),
(3, 'Nikita Rawat', 'Data Engineering', 70000);

select * from employees
where salary > 30000







