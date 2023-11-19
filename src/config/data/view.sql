
-- Admin/dashboard
CREATE VIEW view_dashboard AS
SELECT COUNT(DISTINCT(categories.category_id)),  COUNT(DISTINCT(products.product_id)), COUNT(DISTINCT(customers.customer_id)), COUNT(DISTINCT(orders.order_id)), SUM(payments.payment_total) 
FROM categories, customers, products, orders, payments;

CREATE VIEW view_total AS
SELECT SUM(payment_total) AS sum_total FROM payments;