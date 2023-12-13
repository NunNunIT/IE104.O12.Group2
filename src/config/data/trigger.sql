-- Tính tổng order_total before và after là tổng của các order_detail_price * order_detail_quantity trong order_details.
DROP TRIGGER IF EXISTS insert_before_order_details;

DELIMITER //

CREATE TRIGGER insert_before_order_details
BEFORE INSERT ON order_details
FOR EACH ROW
BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END //

DELIMITER ;


DROP TRIGGER IF EXISTS update_before_order_details;

DELIMITER //

CREATE TRIGGER update_before_order_details
BEFORE UPDATE ON order_details
FOR EACH ROW
BEGIN
    -- Calculate new prices
    SET NEW.order_detail_price_before = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );

    SET NEW.order_detail_price_after = COALESCE(
        (
            SELECT view_product_variants.product_variant_price * (1 - view_product_variants.discount_amount / 100)
            FROM view_product_variants
            WHERE view_product_variants.product_variant_id = NEW.product_variant_id
        ),
        NEW.order_detail_price_before
    );
    
    -- Set default value if order_detail_price_after is NULL
    IF NEW.order_detail_price_after IS NULL THEN
        SET NEW.order_detail_price_after = (
        SELECT product_variant_price
        FROM product_variants
        WHERE product_variant_id = NEW.product_variant_id
    );
    END IF;

    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(NEW.order_detail_price_after * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        ),
        order_total_before = (
            SELECT SUM(NEW.order_detail_price_before * NEW.order_detail_quantity)
            FROM order_details
            WHERE order_id = NEW.order_id
        )
    WHERE order_id = NEW.order_id;
END //

DELIMITER ;

DROP TRIGGER IF EXISTS delete_before_order_details;

DELIMITER //

CREATE TRIGGER delete_before_order_details
BEFORE DELETE ON order_details
FOR EACH ROW
BEGIN
    -- Update orders
    UPDATE orders
    SET
        order_total_after = (
            SELECT SUM(order_detail_price_after * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        ),
        order_total_before = (
            SELECT SUM(order_detail_price_before * order_detail_quantity)
            FROM order_details
            WHERE order_id = OLD.order_id
        )
    WHERE order_id = OLD.order_id;
END //

DELIMITER ;


DROP TRIGGER IF EXISTS insert_after_feedbacks;

DELIMITER
    //
CREATE TRIGGER insert_after_feedbacks AFTER INSERT ON
    feedbacks FOR EACH ROW
BEGIN
    DECLARE avg_rate DECIMAL(10, 1) ;
    DECLARE product_id INT(11) ;
    DECLARE product_variant_id INT(11);
   
    SET product_variant_id = NEW.product_variant_id;
    
    SET product_id = (SELECT product_variants.product_id 
    FROM product_variants 
    WHERE product_variants.product_variant_id = product_variant_id);
    
    SET avg_rate =  (SELECT AVG(feedbacks.feedback_rate) 
     FROM feedbacks, product_variants 
     WHERE feedbacks.product_variant_id = product_variants.product_variant_id 
     AND product_variants.product_id = product_id 
     GROUP BY product_variants.product_id);
    
    UPDATE products 
    SET products.product_rate = avg_rate
    WHERE products.product_id = product_id;
END //
DELIMITER ; 

DROP TRIGGER IF EXISTS after_insert_users;

DELIMITER //
CREATE TRIGGER after_insert_users
AFTER INSERT
ON users FOR EACH ROW
BEGIN
    INSERT INTO customers (user_id)
    VALUES (NEW.user_id);
END;
//
DELIMITER ;

