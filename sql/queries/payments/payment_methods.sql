-- Payment method distribution
SELECT 
    payment_type,
    COUNT(*) AS payment_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM order_payments), 2) AS percentage,
    AVG(payment_value) AS avg_payment_value,
    SUM(payment_value) AS total_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY payment_count DESC;

-- Top Payment Methods by Revenue
SELECT 
    op.payment_type,
    SUM(oi.price + oi.freight_value) AS total_payment_value
FROM order_payments op
JOIN order_items oi ON op.order_id = oi.order_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY op.payment_type
ORDER BY total_payment_value DESC;
