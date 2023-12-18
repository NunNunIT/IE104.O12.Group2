-- Admin/dashboard
DROP VIEW IF EXISTS view_dashboard;

CREATE VIEW view_dashboard AS
SELECT dashboard_customer.customer_count,
SUM(dashboard_order.quantity_sold) as 'quantity_sold',
SUM(dashboard_order.revenue) as 'revenue'
FROM (SELECT COUNT(*) as 'customer_count' FROM customers) dashboard_customer,
(SELECT COUNT(*) as 'quantity_sold', SUM(orders.order_total_after) as 'revenue' FROM orders WHERE orders.order_is_paid=1 AND orders.order_status ='Hoàn thành' GROUP BY orders.order_id) dashboard_order;

DROP VIEW IF EXISTS view_getchart_revenue;

CREATE VIEW view_getchart_revenue AS
SELECT
    success.year,
    success.month,
    success.order_success,
    success.revenue,
    cancel.order_cancel
FROM
    (
    SELECT
        YEAR(orders.order_date) AS 'year',
        MONTH(orders.order_date) AS 'month',
        COUNT(orders.order_id) AS 'order_success',
        SUM(orders.order_total_after) AS 'revenue'
    FROM
        orders
    WHERE
        orders.order_is_paid = 1
    GROUP BY
        YEAR(orders.order_date),
        MONTH(orders.order_date)
) success
LEFT JOIN(
    SELECT
        YEAR(orders.order_date) AS 'year',
        MONTH(orders.order_date) AS 'month',
        COUNT(orders.order_id) AS 'order_cancel'
    FROM
        orders
    WHERE
        orders.order_status = 'Đã hủy'
    GROUP BY
        YEAR(orders.order_date),
        MONTH(orders.order_date)
) cancel
ON
    (
        cancel.year = success.year AND cancel.month = success.month
    );

DROP VIEW IF EXISTS view_getchart_top5_product;

CREATE VIEW view_getchart_top5_product AS
SELECT order_details.product_variant_id,
		SUM(order_details.order_detail_quantity) as 'quantity_sold', 
        SUM(order_details.order_detail_price_after * order_details.order_detail_quantity) as 'revenue'
FROM orders
LEFT JOIN order_details ON order_details.order_id = orders.order_id
WHERE orders.order_status = 'Hoàn thành'
GROUP BY order_details.product_variant_id;


DROP VIEW IF EXISTS view_cate_admin;

CREATE VIEW view_cate_admin AS 
SELECT
    categories.*,
    COALESCE(product_counts.product_count, 0) AS product_count,
    COALESCE(SUM(order_details.order_detail_price_after), 0) AS revenue
FROM
    categories
LEFT JOIN (
    SELECT
        category_id,
        COUNT(*) AS product_count
    FROM
        products
    GROUP BY
        category_id
) AS product_counts ON categories.category_id = product_counts.category_id
LEFT JOIN order_details ON order_details.product_variant_id IN (
    SELECT
        product_variant_id
    FROM
        view_products_resume, orders
    WHERE
        view_products_resume.category_id = categories.category_id
    AND orders.order_id = order_details.order_id
    and orders.order_is_paid = 1 and orders.order_status = 'Hoàn thành'
)
GROUP BY
    categories.category_id, categories.category_name;


DROP VIEW IF EXISTS view_products_admin;

CREATE VIEW view_products_admin AS 
SELECT view_product_variants.*, COUNT(view_product_variants.product_variant_id) as 'product_count', SUM(R.quantity_sold) as 'quantity_sold', SUM(R.revenue) as 'revenue'
FROM view_product_variants 
LEFT JOIN (SELECT order_details.product_variant_id, COUNT(order_details.product_variant_id) AS 'quantity_sold', SUM(order_details.order_detail_price_after) AS 'revenue'
FROM orders LEFT JOIN order_details ON orders.order_id = order_details.order_id
WHERE orders.order_is_paid AND orders.order_status = 'Hoàn thành'
GROUP BY order_details.product_variant_id) R
ON view_product_variants.product_variant_id = R.product_variant_id
GROUP BY view_product_variants.product_id
ORDER BY SUM(R.revenue) DESC;


DROP VIEW IF EXISTS
    view_discounts;
CREATE VIEW view_discounts AS SELECT
    *
FROM
    discounts
WHERE
    DATE(discounts.discount_end_date) > CURRENT_TIMESTAMP AND DATE(discounts.discount_start_date) < CURRENT_TIMESTAMP AND discounts.discount_is_display = 1;

DROP VIEW IF EXISTS
    view_user;
CREATE VIEW view_user AS SELECT
    users.user_id,
    users.user_login_name,
    users.user_password,
    users.user_name,
    users.user_avt_img,
    DATE_FORMAT(users.user_birth, '%d/%m/%Y') AS user_birth,
    users.user_sex,
    users.user_email,
    users.user_phone,
    users.user_address,
    users.user_register_date,
    users.user_active,
    customers.customer_id,
    staffs.staff_id,
    staffs.staff_role,
    staffs.staff_description
FROM
    users
LEFT JOIN customers ON users.user_id = customers.user_id
LEFT JOIN staffs ON users.user_id = staffs.user_id;

DROP VIEW IF EXISTS
    view_product_variants;
CREATE VIEW view_product_variants AS SELECT
    products.product_id,
    products.product_name,
    products.product_avt_img,
    products.product_rate,
    products.product_view_count,
    products.product_period,
    categories.category_id,
    categories.category_name,
    product_variants.product_variant_id,
    product_variants.product_variant_name,
    product_variants.product_variant_price,
    product_variants.product_variant_available,
    product_variants.product_variant_is_bestseller,
    view_discounts.discount_amount,
    view_discounts.discount_description
FROM
    products
LEFT JOIN product_variants ON products.product_id = product_variants.product_id
LEFT JOIN view_discounts ON product_variants.discount_id = view_discounts.discount_id
LEFT JOIN categories ON categories.category_id = products.category_id
WHERE
    categories.category_id = products.category_id AND products.product_is_display = 1;


DROP VIEW IF EXISTS
    view_products_resume;
CREATE VIEW view_products_resume AS SELECT
    products.product_id,
    products.product_name,
    products.product_avt_img,
    products.product_rate,
    products.product_view_count,
    categories.category_id,
    categories.category_name,
    A.product_variant_id,
    C.product_variant_is_bestseller,
    A.min_price AS 'product_variant_price',
    B.max_date AS 'product_lastdate_added',
    view_discounts.discount_amount,
    view_discounts.discount_description
FROM
    products
LEFT JOIN(
    SELECT
        product_variants.product_id,
        product_variants.discount_id,
        product_variants.product_variant_id,
        MIN(
            product_variants.product_variant_price
        ) AS 'min_price'
    FROM
        product_variants
    GROUP BY
        product_variants.product_id
) A
ON
    products.product_id = a.product_id
LEFT JOIN view_discounts ON A.discount_id = view_discounts.discount_id
LEFT JOIN categories ON categories.category_id = products.category_id
RIGHT JOIN(
    SELECT
        product_variants.product_id,
        MAX(
            product_variants.product_variant_added_date
        ) AS 'max_date'
    FROM
        product_variants
    GROUP BY
        product_variants.product_id
) B
ON
    products.product_id = B.product_id
LEFT JOIN(
    SELECT
        product_variants.product_id,
        product_variants.product_variant_is_bestseller
    FROM
        product_variants
    WHERE
        product_variants.product_variant_is_bestseller = 1
    GROUP BY
        product_variants.product_id
) C
ON
    products.product_id = C.product_id
WHERE
    products.product_is_display = 1
GROUP BY
    products.product_id;


DROP VIEW IF EXISTS
    view_count_cart;
CREATE VIEW view_count_cart AS SELECT
    customers.customer_id,
    users.user_id,
    COUNT(carts.product_variant_id) AS 'count_cart'
FROM
users LEFT JOIN customers ON users.user_id = customers.customer_id
LEFT JOIN carts ON carts.customer_id = customers.customer_id
GROUP BY
    customers.customer_id;


DROP VIEW IF EXISTS
    view_cart;
CREATE VIEW view_cart AS SELECT
    carts.customer_id,
    carts.cart_quantity,
    view_product_variants.*
FROM
    carts
LEFT JOIN view_product_variants ON carts.product_variant_id = view_product_variants.product_variant_id
ORDER BY
    carts.cart_added_date
DESC;
DROP VIEW IF EXISTS
    view_products_info;
CREATE VIEW view_products_info AS SELECT
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
DROP VIEW IF EXISTS
    view_product_variant_detail;
CREATE VIEW view_product_variant_detail AS SELECT
    product_variants.*,
    view_discounts.discount_name,
    view_discounts.discount_description,
    view_discounts.discount_start_date,
    view_discounts.discount_end_date,
    view_discounts.discount_amount
FROM
    product_variants
LEFT JOIN view_discounts ON product_variants.discount_id = view_discounts.discount_id
WHERE
    product_variants.product_variant_is_display = 1;
DROP VIEW IF EXISTS
    view_product_feedbacks;
CREATE VIEW view_product_feedbacks AS SELECT
    product_variants.product_variant_name,
    product_variants.product_id,
    feedbacks.*,
    feedback_imgs.feedback_img_id,
    feedback_imgs.feedback_img_name, 
    view_user.user_name,
    view_user.user_avt_img
FROM
    product_variants
LEFT JOIN feedbacks ON product_variants.product_variant_id = feedbacks.product_variant_id
LEFT JOIN feedback_imgs ON feedbacks.feedback_id = feedback_imgs.feedback_id
LEFT JOIN view_user ON view_user.customer_id = feedbacks.customer_id
WHERE
    feedbacks.feedback_is_display = 1;

DROP VIEW IF EXISTS
    view_orders;

CREATE VIEW view_orders AS
SELECT orders.*, paying_methods.paying_method_name
FROM 
orders LEFT JOIN paying_methods
ON orders.paying_method_id = paying_methods.paying_method_id;

DROP VIEW IF EXISTS
    view_order_detail;

CREATE VIEW view_order_detail AS
SELECT order_details.*, view_product_variants.product_id, view_product_variants.product_name, view_product_variants.product_avt_img, view_product_variants.product_variant_name
FROM 
order_details LEFT JOIN view_product_variants
ON order_details.product_variant_id = view_product_variants.product_variant_id;


DROP VIEW IF EXISTS view_notifications;

CREATE VIEW view_notifications AS
SELECT
    notifications.*,
    user_notification.user_id,
    user_notification.user_notification_is_read
FROM
    notifications
LEFT JOIN user_notification ON notifications.notification_id = user_notification.notification_id
WHERE
    notifications.notification_is_display = 1;
