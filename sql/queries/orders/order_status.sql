-- Order status distribution
SELECT 
    order_status,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS percentage
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- Order Completion Rate by Day of Week
SELECT 
    TO_CHAR(order_purchase_timestamp, 'Day') AS day_of_week,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) AS delivered_orders,
    ROUND(SUM(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS delivery_rate
FROM orders
GROUP BY day_of_week
ORDER BY total_orders DESC;
