-- Retail Sales SQL Project
-- Database Schema

CREATE DATABASE retail_sales_project;

USE retail_sales_project;

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Products (
	product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE Orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT, 
    quantity INT, 
    amount INT, 
    order_date DATE,
    
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),
    
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);
