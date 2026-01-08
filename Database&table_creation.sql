/*
    Create a database called "inventory_management" to manage a product and order inventory
    Create the following tables:
    - products -> id, name, unit_price, available_quantity
    - customers -> id, first_name, last_name, email
    - orders -> id, order_date, customer_id
    - order_details -> id, quantity, unit_price, order_id, product_id
*/
CREATE DATABASE inventory_management;
USE inventory_management;

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    unit_price DOUBLE,
    available_quantity INT
);

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    total_price DOUBLE,
    order_id INT,
    product_id INT,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);


-- Insert Data


INSERT INTO products (name, unit_price, available_quantity) VALUES
('Laptop Lenovo ThinkPad', 899.99, 15),
('Mouse Logitech MX Master 3', 89.99, 60),
('Monitor Dell 27"', 249.49, 25),
('Mechanical Keyboard Keychron K6', 119.00, 40),
('External Hard Drive 1TB', 59.90, 80),
('Headphones Sony WH-1000XM5', 349.00, 20),
('Webcam Logitech C920', 79.99, 50),
('Router TP-Link Archer AX55', 139.99, 30);

INSERT INTO customers (first_name, last_name, email) VALUES
('Marco', 'Rossi', 'marco.rossi@example.com'),
('Luca', 'Bianchi', 'luca.bianchi@example.com'),
('Giulia', 'Ferrari', 'giulia.ferrari@example.com'),
('Elena', 'Verdi', 'elena.verdi@example.com');

INSERT INTO orders (order_date, customer_id) VALUES
('2025-01-10', 1),
('2025-01-15', 2),
('2025-01-20', 1),
('2025-01-22', 3),
('2025-01-25', 4);

INSERT INTO order_details (quantity, total_price, order_id, product_id) VALUES
(1, 899.99, 1, 1),
(2, 179.98, 1, 2),
(1, 349.00, 2, 6),
(1, 249.49, 3, 3),
(1, 119.00, 3, 4),
(3, 179.70, 4, 5),
(1, 139.99, 4, 8),
(2, 79.99, 5, 7),
(1, 349.00, 5, 6);


