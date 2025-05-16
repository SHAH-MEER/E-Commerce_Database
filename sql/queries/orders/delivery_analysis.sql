-- Average Time Between Order Purchase and Delivery
SELECT 
    AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400) AS avg_delivery_time_days
FROM orders
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;

-- Average Delivery Time vs. Estimated
SELECT
    AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400) AS avg_delivery_days,
    AVG(EXTRACT(EPOCH FROM (order_estimated_delivery_date - order_purchase_timestamp)) / 86400) AS avg_estimated_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

-- Delivery time analysis
SELECT 
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
    AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp))/86400) AS avg_delivery_days,
    MIN(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp))/86400) AS min_delivery_days,
    MAX(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp))/86400) AS max_delivery_days
FROM orders
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL
GROUP BY month
ORDER BY month;
