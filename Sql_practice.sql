CREATE DATABASE Practice ;
use Practice;


CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

Select id,name from employees;

INSERT INTO employees (name, age, salary, department)
VALUES
('Alice', 25, 50000, 'HR'),
('Bob', 30, 55000, 'IT'),
('Charlie', 35, 60000, 'Finance'),
('David', 40, 65000, 'Marketing'),
('Eve', 45, 70000, 'Sales'),
('Frank', 50, 75000, 'IT'),
('Grace', 55, 80000, 'HR'),
('Hank', 60, 85000, 'Finance'),
('Ivy', 65, 90000, 'Marketing'),
('Jack', 70, 95000, 'Sales'),
('Kathy', 25, 51000, 'IT'),
('Leo', 30, 52000, 'HR'),
('Mia', 35, 53000, 'Finance'),
('Nina', 40, 54000, 'Marketing'),
('Oscar', 45, 55000, 'Sales'),
('Paul', 50, 56000, 'IT'),
('Quinn', 55, 57000, 'HR'),
('Rita', 60, 58000, 'Finance'),
('Sam', 65, 59000, 'Marketing'),
('Tina', 70, 60000, 'Sales'),
('Uma', 25, 61000, 'IT'),
('Victor', 30, 62000, 'HR'),
('Wendy', 35, 63000, 'Finance'),
('Xander', 40, 64000, 'Marketing'),
('Yara', 45, 65000, 'Sales'),
('Zane', 50, 66000, 'IT'),
('Adam', 55, 67000, 'HR'),
('Bella', 60, 68000, 'Finance'),
('Cody', 65, 69000, 'Marketing'),
('Diana', 70, 70000, 'Sales'),
('Eli', 25, 71000, 'IT'),
('Fiona', 30, 72000, 'HR'),
('Gabe', 35, 73000, 'Finance'),
('Holly', 40, 74000, 'Marketing'),
('Ian', 45, 75000, 'Sales'),
('Jane', 50, 76000, 'IT'),
('Kyle', 55, 77000, 'HR'),
('Lara', 60, 78000, 'Finance'),
('Max', 65, 79000, 'Marketing'),
('Nora', 70, 80000, 'Sales'),
('Owen', 25, 81000, 'IT'),
('Pia', 30, 82000, 'HR'),
('Quincy', 35, 83000, 'Finance'),
('Rose', 40, 84000, 'Marketing'),
('Steve', 45, 85000, 'Sales'),
('Tara', 50, 86000, 'IT'),
('Uma', 55, 87000, 'HR'),
('Vince', 60, 88000, 'Finance'),
('Wade', 65, 89000, 'Marketing');

Select * from employees;

Select e.salary, e.name, e.*
from employees e
where department = 'IT';

Select * 
from employees 
where age != 30;

Select * 
from employees 
where name like '%A';

Select * 
from employees
where age between 30 and 50
order by id desc;


Select * 
from employees
where department in ('IT', 'HR')
order by department asc;


Select * 
from employees
where age in (25, 30, 35)
order by age asc;

Select * 
from employees
where age > 30 and department in ('IT', 'HR');

Select * 
from employees 
order by age asc, salary desc;

Select * 
from employees
limit 10;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50)
);


INSERT INTO departments (department_name)
VALUES
('HR'), ('IT'), ('Finance'), ('Marketing'), ('Sales');

Select * from departments;


Select e.name, e.age, d.department_name
from employees e
join departments d on e.department = d.department_name;


CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO salaries (employee_id, amount)
VALUES
(1, 50000),
(2, 55000),
(3, 60000),
(4, 65000),
(5, 70000),
(6, 75000),
(7, 80000),
(8, 85000),
(9, 90000),
(10, 95000);


select employees.name, employees.age, departments.department_name
from employees 
Inner join departments on employees.department = departments.department_name;









