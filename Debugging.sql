CREATE DATABASE Employee_DB;
USE Employee_DB;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO INCREMENT,
    name VARCHAR(50),
    age INT,
    salary INT,
    department_id INT
    FOREIGN KEY (department_id) REFERENCES departments(department_id); 

INSERT INTO employees (name, age, salary, department_id) VALUES
('John', 30, 60000, 101),
('Emily', 25, 48000, 102),
('Michael', 40, 75000, 103),
('Sara', 35, 56000, 101),
('David', 28, 49000, 102);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO INCREMENT,
    product_name VARCHAR(50),
    price INT
);

INSERT INTO products (product_name, price) VALUES
('Laptop', 1000),
('Mobile', 500),
('Tablet', 300),
('Headphones', 100),
('Smartwatch', 200);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO INCREMENT,
    customer_name VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO customers (customer_name) VALUES
('John Doe'),
('Jane Smith'),
('Alice Johnson'),
('Simon'),
('Robert Brown');


-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO INCREMENT,
    customer_id INT,
    amount DECIMAL(10,2),
    sale_date DATE
    FOREIGN KEY customer_id REFERENCES customers(customer_id)
);

-- Insert sample data
INSERT INTO sales (customer_id, amount, sale_date) VALUES
(101, 4500.00, '2023-03-15'),
(102, 5500.00, '2023-03-16'),
(103, 7000.00, '2023-03-17'),
(104, 3000.00, '2023-03-18'),
(105, 6000.00, '2023-03-19');


CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO INCREMENT,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_name) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing');

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO INCREMENT,
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT
    FOREIGN KEY (customer_name) REFERENCES customers(customer_name)
);

INSERT INTO orders (customer_name, order_date, order_amount) VALUES
('John', '2023-05-01', 500),
('Emily', '2023-05-02', 700),
('Michael', '2023-05-03', 1200),
('Sara', '2023-05-04', 450),
('David', '2023-05-05', 900);

--   Syntax Error Identification
SELECT name, age FROM employees WHERE salary >= 50000;

--  Logical Error Detection
SELECT * FROM orders WHERE order_date = '2023-05-01' OR order_date = '2023-05-02';

-- Performance Optimization
SELECT * FROM sales WHERE amount > 5000;

-- Data Type Mismatch
SELECT * FROM products WHERE price = 100;

-- Incorrect Join Condition
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

--  Incorrect NULL Handling
SELECT * FROM customers WHERE customer_name IS NOT NULL;

-- Incorrect Use of Aggregate Functions
SELECT customer_id, SUM(amount) AS Total
FROM sales
GROUP BY customer_id;

-- Incorrect Column Selection
SELECT order_id, customer_name
FROM orders;
