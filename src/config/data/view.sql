
-- Admin/dashboard
CREATE VIEW view_dashboard AS
SELECT COUNT(DISTINCT(categories.category_id)),  COUNT(DISTINCT(products.product_id)), COUNT(DISTINCT(customers.customer_id)), COUNT(DISTINCT(orders.order_id)), SUM(payments.payment_total) 
FROM categories, customers, products, orders, payments;

CREATE VIEW view_total AS
SELECT SUM(payment_total) AS sum_total FROM payments;

DROP VIEW IF EXISTS view_discount;

CREATE VIEW view_discount AS
SELECT * 
FROM discounts
WHERE DATE(discounts.discount_end_date) > CURRENT_TIMESTAMP
AND DATE(discounts.discount_start_date) < CURRENT_TIMESTAMP;


CREATE VIEW view_user AS
SELECT users.*, customers.customer_id, staffs.staff_id, staffs.staff_role, staffs.staff_description
FROM users LEFT JOIN customers
ON users.user_id = customers.user_id
LEFT JOIN staffs
ON users.user_id = staffs.user_id

DROP VIEW IF EXISTS
    view_products;
CREATE VIEW view_products AS SELECT
    products.product_id,
    products.product_name,
    products.product_avt_img,
    products.product_rate,
    products.product_view_count,
    categories.category_name,
    product_variants.product_variant_id,
    MIN(
        product_variants.product_variant_price
    ) AS 'product_variant_price',
    view_discount.discount_amount,
    view_discount.discount_description
FROM
    products
LEFT JOIN product_variants ON products.product_id = product_variants.product_id
LEFT JOIN view_discount ON product_variants.discount_id = view_discount.discount_id,
    categories
WHERE
    categories.category_id = products.category_id AND products.product_is_display = 1
GROUP BY
    products.product_id


DROP VIEW IF EXISTS view_new_products;

CREATE VIEW view_new_products AS
SELECT
    view_products.*,
    p.product_lastdate_added
FROM
    view_products,
    (
    SELECT
        product_variants.product_id,
        MAX(
            product_variants.product_variant_added_date
        ) AS 'product_lastdate_added'
    FROM
        product_variants
    GROUP BY product_variants.product_id
	) as p
WHERE view_products.product_id = p.product_id

CREATE VIEW view_count_cart AS
SELECT customers.customer_id, users.user_id, COUNT(*) as 'count_cart' 
FROM carts, users LEFT JOIN customers
ON users.user_id = customers.customer_id
WHERE carts.customer_id = customers.customer_id
GROUP BY customers.customer_id

DROP VIEW IF EXISTS view_cart;

CREATE VIEW view_cart AS
SELECT carts.customer_id, carts.cart_quanity, view_products.* 
FROM carts, view_products
WHERE carts.product_variant_id = view_products.product_variant_id
ORDER BY carts.cart_added_date DESC


DROP VIEW IF EXISTS
    View_products_info;
CREATE VIEW view_product_info AS SELECT
    products.*,
    product_variants.product_variant_id,
    product_variants.discount_id,
    product_variants.product_variant_name,
    product_variants.product_variant_price,
    product_variants.product_variant_available
FROM
    products,
    product_variants
WHERE
    products.product_id = product_variants.product_id AND product_variants.product_variant_is_stock = 1 AND product_variants.product_variant_is_display = 1;



