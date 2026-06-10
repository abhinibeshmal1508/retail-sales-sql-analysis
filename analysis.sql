-- ================================================
-- Retail Sales SQL Project
-- Business Analysis Queries
-- ================================================

USE retail_sales_project;

-- ================================================
-- BASIC ANALYSIS
-- ================================================

-- Total Revenue Generated
SELECT SUM(amount) AS total_revenue 
FROM orders;

-- Revenue by Product Category
SELECT p.category, 
       SUM(o.amount) AS total_revenue_from_category 
FROM Orders o 
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue_from_category DESC;

-- Top 5 Customers by Spending
SELECT c.customer_name, 
       SUM(o.amount) AS total_spent 
FROM Orders o 
JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Monthly Revenue Trend
SELECT MONTH(order_date) AS month, 
       SUM(amount) AS monthly_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- Best Selling Product by Quantity
SELECT p.product_name, 
       SUM(o.quantity) AS total_quantity
FROM Orders o 
JOIN Products p
ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- ================================================
-- Intermediate ANALYSIS
-- ================================================

-- Top 3 Cities by Revenue
WITH temp_table AS (
	SELECT c.city, 
		   SUM(o.amount) AS total_revenue
	FROM Customers c
	JOIN Orders o 
	ON c.customer_id = o.customer_id
	GROUP BY c.city
), 
temp_table2 AS (
	SELECT city,
		   total_revenue,
		   RANK() OVER(
			   ORDER BY total_revenue DESC
		   ) AS rn
	FROM temp_table
)
SELECT city, 
	   total_revenue
FROM temp_table2
WHERE rn<=3;

-- Average Order Value
SELECT SUM(amount) / COUNT(order_id) AS average_order_value
FROM Orders;

-- Most Popular Category by Orders
SELECT p.category, COUNT(o.order_id) AS total_orders 
FROM Products p 
JOIN Orders o
ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY COUNT(o.order_id) DESC;

-- Repeat Customer Analysis
WITH temp_table AS (
	SELECT c.customer_name, COUNT(o.order_id) AS total_number_of_orders
	FROM Customers c 
	JOIN Orders o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id
)
SELECT customer_name,
	   total_number_of_orders
FROM temp_table 
WHERE total_number_of_orders>1;

-- ================================================
-- ADVANCED ANALYSIS
-- ================================================

-- Running Revenue Trend  
WITH temp_table AS (
	SELECT MONTH(order_date) AS month_num, 
	       MONTHNAME(order_date) AS month_name, 
	       amount 
	FROM Orders
), 
temp_table2 AS (
	SELECT month_num, 
		   month_name, 
           SUM(amount) AS monthly_revenue
    FROM temp_table 
    GROUP BY month_num, month_name
) 
SELECT month_name, 
	   monthly_revenue, 
       SUM(monthly_revenue) OVER(
			ORDER BY month_num
	   ) AS running_total_revenue
FROM temp_table2;

-- Revenue Contribution % by Category
WITH temp_table AS (
	SELECT p.category, 
		   SUM(o.amount) AS total_revenue_generated
	FROM Products p 
	JOIN Orders o
	ON p.product_id = o.product_id
	GROUP BY p.category
), 
temp_table2 AS (
	SELECT category, 
		   total_revenue_generated, 
		   SUM(total_revenue_generated) OVER() AS total_revenue_from_all_categories
	FROM temp_table
)
SELECT category, 
	   total_revenue_generated,
       ROUND((total_revenue_generated * 100) /
         total_revenue_from_all_categories, 2) AS revenue_contribution
FROM temp_table2;

-- Customer Lifetime Value
SELECT c.customer_name, 
	   COUNT(*) AS total_orders, 
       SUM(o.quantity) AS total_quantity_purchased, 
       SUM(o.amount) AS total_amount_purchased
FROM Customers c 
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY SUM(o.amount) DESC;

-- Top Customer per Category 
WITH temp_table AS (
	SELECT c.customer_name,
		   p.category,
           SUM(o.amount) AS total_amount_spent
	FROM Orders o
    
    JOIN Customers c
    ON o.customer_id = c.customer_id
    
    JOIN  Products p
    ON o.product_id = p.product_id
    
    GROUP BY c.customer_name, p.category
),
temp_table2 AS (
	SELECT customer_name,
		   category,
           total_amount_spent,
           RANK() OVER(
			   PARTITION BY category
		       ORDER BY total_amount_spent DESC
           ) AS rn
	FROM temp_table
)
SELECT customer_name,
	   category,
       total_amount_spent
FROM temp_table2 
WHERE rn=1;

-- Month over Month Growth 
WITH temp_table AS (
	SELECT MONTH(order_date) AS month_id,
		   MONTHNAME(order_date) AS month,
		   SUM(amount) AS current_month_revenue
	FROM Orders 
	GROUP BY MONTH(order_date), MONTHNAME(order_date)
)
SELECT month,
	   current_month_revenue,
	   LAG(current_month_revenue) OVER(
	       ORDER BY month_id 
	   ) AS previous_month_revenue,
	   (current_month_revenue - LAG(current_month_revenue) OVER(
	        ORDER BY month_id ASC  
		    )
		) AS revenue_change
FROM temp_table;

-- Product Revenue Ranking
WITH temp_table AS (
	SELECT p.product_name, 
		   SUM(o.amount) AS total_revenue
	FROM Products p
	JOIN Orders o
	ON p.product_id = o.product_id
	GROUP BY p.product_name
)
SELECT product_name,
	   total_revenue,
       DENSE_RANK() OVER(
	       ORDER BY total_revenue DESC
       ) AS rn 
FROM temp_table;

