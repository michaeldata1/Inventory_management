/*
    Create the following triggers:
    - trigger to update product available quantity after inserting an order
    - trigger to restore product available quantity after deleting an order
*/

DELIMITER $$
CREATE TRIGGER update_quantity
AFTER INSERT ON order_details
FOR EACH ROW
BEGIN
    -- old/new allows access to values
    UPDATE products
    SET available_quantity = available_quantity - NEW.quantity
    WHERE id = NEW.product_id;
END$$

CREATE TRIGGER restore_quantity
AFTER DELETE ON order_details
FOR EACH ROW
BEGIN
    UPDATE products
    SET available_quantity = available_quantity + OLD.quantity
    WHERE id = OLD.product_id;
END$$

/*
    Create the following stored procedures:
    - procedure to insert a new order
    - procedure to update product available quantity
    - procedure to delete an order
*/
CREATE PROCEDURE insert_new_order(
    order_date_input DATE,
    customer_id_input INT
)
MODIFIES SQL DATA
BEGIN
    INSERT INTO orders(order_date, customer_id)
    VALUES (order_date_input, customer_id_input);
END$$

CREATE PROCEDURE update_product_quantity(
    product_id_input INT,
    new_quantity INT
)
MODIFIES SQL DATA
BEGIN
    UPDATE products
    SET available_quantity = new_quantity
    WHERE id = product_id_input;
END$$

CREATE PROCEDURE delete_order(
    order_id_input INT
)
MODIFIES SQL DATA
BEGIN
    DELETE FROM orders WHERE id = order_id_input;
END$$

/*
    Create the following functions:
    - function to calculate the total amount of an order
    - function to find all sold-out products
    - function to find products with available quantity below a threshold
*/
CREATE FUNCTION total_order_amount(order_id_input INT)
RETURNS DOUBLE
READS SQL DATA
BEGIN
    DECLARE result DOUBLE;
    SELECT SUM(total_price) INTO result
    FROM order_details
    WHERE order_id = order_id_input;
    RETURN result;
END$$

CREATE FUNCTION sold_out_products_count()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE result INT;
    SELECT COUNT(id) INTO result
    FROM products
    WHERE available_quantity = 0;
    RETURN result;
END$$

CREATE FUNCTION sold_out_products_names()
RETURNS TEXT
READS SQL DATA
BEGIN
    DECLARE result TEXT;
    SELECT GROUP_CONCAT(name SEPARATOR ", ") INTO result
    FROM products
    WHERE available_quantity = 0;
    RETURN result;
END$$

CREATE FUNCTION products_below_threshold()
RETURNS TEXT
READS SQL DATA
BEGIN
    DECLARE result TEXT;
    SELECT GROUP_CONCAT(name SEPARATOR ", ") INTO result
    FROM products
    WHERE available_quantity < 4;
    RETURN result;
END$$
DELIMITER ;

