-- CREATE DATABASE IE104
-- USE IE104

-- TẠO BẢNG -------------------------------------------------------
-- Bảng Categories
CREATE TABLE categories (
  category_id CHAR(9) NOT NULL UNIQUE,
  category_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (category_id)
);

-- Bảng Products
CREATE TABLE products (
  product_id CHAR(9) NOT NULL UNIQUE,
  category_id CHAR(9) NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  product_rate FLOAT NOT NULL,
  product_description TEXT,
  product_period INT,
  product_view_count INT,
  PRIMARY KEY (product_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Bảng Discounts
CREATE TABLE discounts (
  discount_id CHAR(9) NOT NULL UNIQUE,
  discount_name VARCHAR(100) NOT NULL,
  discount_description TEXT,
  discount_start_date DATE NOT NULL,
  discount_end_date DATE NOT NULL,
  discount_amount FLOAT NOT NULL,
  discount_is_display BIT NOT NULL,
  PRIMARY KEY (discount_id)
);

-- Bảng Product Variants
CREATE TABLE product_variants (
  product_variant_id CHAR(9) NOT NULL UNIQUE,
  product_id CHAR(9) NOT NULL,
  discount_id CHAR(9),
  product_variant_name VARCHAR(100) NOT NULL,
  product_variant_price FLOAT NOT NULL,
  product_variant_available INT NOT NULL,
  product_variant_is_stock BIT,
  product_variant_is_bestseller BIT,
  product_variant_is_display BIT NOT NULL,
  PRIMARY KEY (product_variant_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id),
  FOREIGN KEY (discount_id) REFERENCES discounts (discount_id)
);

-- Bảng Product Details
CREATE TABLE product_details (
  product_detail_id CHAR(9) NOT NULL,
  product_id CHAR(9) NOT NULL,
  product_detail_name VARCHAR(100) NOT NULL,
  product_detail_value TEXT,
  product_detail_unit VARCHAR(100),
  PRIMARY KEY (product_detail_id, product_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Bảng Images
CREATE TABLE images (
  image_id CHAR(9) NOT NULL,
  product_variant_id CHAR(9) NOT NULL,
  image_name VARCHAR(100) NOT NULL,
  image_is_display BIT NOT NULL,
  PRIMARY KEY (image_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (product_variant_id)
);


-- Bảng Users
CREATE TABLE users (
  user_id CHAR(9) not null,
  user_login_name VARCHAR(100) NOT NULL,
  user_password VARCHAR(100) NOT NULL,
  user_name VARCHAR(100),
  user_birth DATE,
  user_sex BIT,
  user_email VARCHAR(100),
  user_phone CHAR(10) NOT NULL,
  user_address VARCHAR(255),
  user_register_date DATE,
  user_active BIT,
  PRIMARY KEY (user_id)
);
-- Bảng Customers
CREATE TABLE customers (
  customer_id CHAR(9) NOT NULL,
  user_id CHAR(9) NOT NULL,
  PRIMARY KEY (customer_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);
-- Bảng Staffs
CREATE TABLE staffs (
  staff_id CHAR(9) NOT NULL,
  user_id CHAR(9) NOT NULL,
  staff_role VARCHAR(100) NOT NULL,
  staff_description TEXT,
  PRIMARY KEY (staff_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id)
);

-- Bảng Carts
CREATE TABLE carts (
  customer_id CHAR(9) NOT NULL,
  product_variant_id CHAR(9) NOT NULL,
  cart_quanity INT NOT NULL,
  PRIMARY KEY (customer_id, product_variant_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (product_variant_id)
);

-- Bảng Orders
CREATE TABLE orders (
  order_id CHAR(9) NOT NULL,
  customer_id CHAR(9) NOT NULL,
  staff_id CHAR(9) NOT NULL,
  order_date DATE NOT NULL,
  order_delivery_date DATE NOT NULL,
  order_delivery_address VARCHAR(100) NOT NULL,
  order_note TEXT NOT NULL,
  order_is_payment BIT NOT NULL,
  order_is_delivery BIT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (staff_id) REFERENCES staffs (staff_id)
);

-- Bảng Order_Details
CREATE TABLE order_details (
  order_id CHAR(9) NOT NULL,
  product_variant_id CHAR(9) NOT NULL,
  order_detail_quantity INT NOT NULL,
  order_detail_unit_price FLOAT,
  PRIMARY KEY (order_id, product_variant_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (product_variant_id)
);

-- Bảng Paying_Methods
CREATE TABLE paying_methods (
  paying_method_id CHAR(9) NOT NULL,
  paying_method_name VARCHAR(100) NOT NULL,
  paying_method_is_display BIT NOT NULL,
  PRIMARY KEY (paying_method_id)
);

-- Bảng Payments
CREATE TABLE payments (
  payment_id CHAR(9) NOT NULL,
  order_id CHAR(9) NOT NULL,
  paying_method_id CHAR(9) NOT NULL,
  payment_date DATE NOT NULL,
  payment_total FLOAT NOT NULL,
  payment_status BIT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id),
  FOREIGN KEY (paying_method_id) REFERENCES paying_methods (paying_method_id)
);

-- Bảng Feedbacks
CREATE TABLE feedbacks (
  feedback_id CHAR(9) NOT NULL,
  product_variant_id CHAR(9) NOT NULL,
  customer_id CHAR(9) NOT NULL,
  order_id CHAR(9) NOT NULL,
  feedback_date DATE NOT NULL,
  feedback_rate INT NOT NULL,
  feedback_content TEXT,
  feedback_is_display BIT NOT NULL,
  PRIMARY KEY (feedback_id),
  FOREIGN KEY (product_variant_id) REFERENCES product_variants (product_variant_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- Bảng Notification_Types
CREATE TABLE notification_types (
  notification_types_id CHAR(9) NOT NULL,
  notification_types_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (notification_types_id)
);

-- Bảng Notifications
CREATE TABLE notifications (
  notifications_id CHAR(9) NOT NULL,
  notification_types_id CHAR(9) NOT NULL,
  notifications_title VARCHAR(100) NOT NULL,
  notifications_subtitle TEXT,
  notifications_content TEXT NOT NULL,
  notifications_date DATE NOT NULL,
  notifications_is_display	BIT NOT NULL,
  PRIMARY KEY (notifications_id),
  FOREIGN KEY (notification_types_id) REFERENCES notification_types (notification_types_id)
);
-- Bảng User_Notification
CREATE TABLE user_notification (
  user_id CHAR(9) NOT NULL,
  notifications_id CHAR(9) NOT NULL,
  users_notifications_is_read BIT NOT NULL,
  PRIMARY KEY (user_id, notifications_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (notifications_id) REFERENCES notifications (notifications_id)
);


