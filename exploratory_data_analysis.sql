-- Show all orders of a customer with complete details and total amount per order
SELECT c.*, SUM(od.total_price)
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_details od ON o.id = od.order_id
GROUP BY o.id;

-- Show monthly sales total per product
SELECT od.quantity, p.name, order_id
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN orders o ON od.order_id = o.id
WHERE MONTH(o.order_date) = 1
AND YEAR(o.order_date) = 2025
GROUP BY order_id, od.quantity, p.name;

-- Show customers who have not placed any order
INSERT INTO customers VALUES (
5, 'Alessandra', 'Gialli', 'alessandra.gialli@example.com');

SELECT CONCAT(c.first_name, " ", c.last_name)
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_details od ON od.order_id = o.id
WHERE od.quantity = 0;

-- Show best-selling products by total units sold
SELECT p.name, od.quantity
FROM products p
INNER JOIN order_details od ON p.id = od.product_id
WHERE od.quantity = (SELECT MAX(quantity) FROM order_details);

-- Show total number of orders per month
SELECT MONTH(order_date), COUNT(id)
FROM orders
GROUP BY MONTH(order_date);

-- Show order details for a specific date range
SELECT *
FROM orders
WHERE order_date BETWEEN '2025-01-23' AND '2025-01-25';
