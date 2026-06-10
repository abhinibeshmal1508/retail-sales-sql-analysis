-- Retail Sales SQL Project
-- Sample Data

USE retail_sales_project;
INSERT INTO customers (customer_id, customer_name, city) VALUES 
(1, 'Rahul Sharma', 'Mumbai'), 
(2, 'Priya Singh', 'Delhi'), 
(3, 'Amit Verma', 'Bangalore'),
(4, 'Sneha Patel', 'Ahmedabad'),
(5, 'Rohit Das', 'Kolkata'),
(6, 'Anjali Mehta', 'Pune'),
(7, 'Vikram Nair', 'Chennai'),
(8, 'Pooja Reddy', 'Hyderabad'),
(9, 'Arjun Joshi', 'Jaipur'),
(10, 'Kavya Iyer', 'Mumbai'),
(11, 'Suresh Yadav', 'Delhi'),
(12, 'Divya Kulkarni', 'Bangalore'),
(13, 'Manish Tiwari', 'Lucknow'),
(14, 'Nisha Gupta', 'Kolkata'),
(15, 'Rajesh Kumar', 'Chennai');

INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Samsung TV', 'Electronics'),
(2, 'Sony Headphones', 'Electronics'),
(3, 'Nike Running Shoes', 'Footwear'),
(4, 'Adidas Sneakers', 'Footwear'),
(5, 'Levi Jeans', 'Clothing'),
(6, 'Cotton T-Shirt', 'Clothing'),
(7, 'Rice Cooker', 'Kitchen'),
(8, 'Mixer Grinder', 'Kitchen'),
(9, 'Harry Potter Book', 'Books'),
(10, 'Data Science Handbook', 'Books');

INSERT INTO orders (order_id, customer_id, product_id, quantity, amount, order_date) VALUES
(1, 1, 1, 1, 45000, '2024-01-15'),
(2, 2, 3, 2, 5000, '2024-01-18'),
(3, 3, 5, 1, 2500, '2024-02-02'),
(4, 4, 7, 1, 3200, '2024-02-14'),
(5, 5, 2, 1, 8000, '2024-02-20'),
(6, 6, 4, 2, 6000, '2024-03-05'),
(7, 7, 6, 3, 1500, '2024-03-12'),
(8, 8, 9, 2, 800, '2024-03-22'),
(9, 9, 10, 1, 1200, '2024-04-01'),
(10, 10, 1, 1, 45000, '2024-04-10'),
(11, 11, 3, 1, 2500, '2024-04-18'),
(12, 12, 8, 1, 4500, '2024-05-03'),
(13, 13, 2, 2, 16000, '2024-05-15'),
(14, 14, 5, 2, 5000, '2024-05-28'),
(15, 15, 7, 1, 3200, '2024-06-06'),
(16, 1, 4, 1, 3000, '2024-06-14'),
(17, 2, 10, 2, 2400, '2024-06-25'),
(18, 3, 6, 4, 2000, '2024-07-08'),
(19, 4, 9, 3, 1200, '2024-07-19'),
(20, 5, 1, 1, 45000, '2024-07-30'),
(21, 6, 3, 1, 2500, '2024-08-05'),
(22, 7, 8, 2, 9000, '2024-08-17'),
(23, 8, 5, 1, 2500, '2024-08-26'),
(24, 9, 2, 1, 8000, '2024-09-04'),
(25, 10, 6, 5, 2500, '2024-09-15'),
(26, 11, 7, 1, 3200, '2024-09-28'),
(27, 12, 4, 2, 6000, '2024-10-09'),
(28, 13, 9, 4, 1600, '2024-10-22'),
(29, 14, 10, 1, 1200, '2024-11-03'),
(30, 15, 3, 3, 7500, '2024-11-18');