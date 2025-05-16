CREATE VIEW customer_overview AS
SELECT 
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) as total_orders,
    MIN(o.order_purchase_timestamp) as first_purchase,
    MAX(o.order_purchase_timestamp) as last_purchase,
    SUM(oi.price + oi.freight_value) as total_spent
FROM 
    customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_id,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state;
