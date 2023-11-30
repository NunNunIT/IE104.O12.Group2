-- Tính tổng order_total before và after là tổng của các order_detail_price * order_detail_quantity trong order_details.
DROP TRIGGER IF EXISTS insert_after_order_details;

CREATE DEFINER = `root`@`localhost` TRIGGER `insert_after_order_details` AFTER INSERT ON
    `order_details` FOR EACH ROW
UPDATE
    orders
SET
    orders.order_total_after =(
    SELECT
        SUM(
            order_details.order_detail_price_after * order_details.order_detail_quantity
        )
    FROM
        order_details
    WHERE
        order_details.order_id = NEW.order_id
    GROUP BY
        order_details.order_id
),
orders.order_total_before =(
    SELECT
        SUM(
            order_details.order_detail_price_before * order_details.order_detail_quantity
        )
    FROM
        order_details
    WHERE
        order_details.order_id = NEW.order_id
    GROUP BY
        order_details.order_id
)
WHERE
    orders.order_id = NEW.order_id


CREATE DEFINER = `root`@`localhost` TRIGGER `update_after_order_details` AFTER UPDATE ON
    `order_details` FOR EACH ROW
UPDATE
    orders
SET
    orders.order_total_after =(
    SELECT
        SUM(
            order_details.order_detail_price_after * order_details.order_detail_quantity
        )
    FROM
        order_details
    WHERE
        order_details.order_id = NEW.order_id
    GROUP BY
        order_details.order_id
),
orders.order_total_before =(
    SELECT
        SUM(
            order_details.order_detail_price_before * order_details.order_detail_quantity
        )
    FROM
        order_details
    WHERE
        order_details.order_id = NEW.order_id
    GROUP BY
        order_details.order_id
)
WHERE
    orders.order_id = NEW.order_id