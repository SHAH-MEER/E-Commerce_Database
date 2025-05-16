CREATE VIEW seller_performance AS
SELECT 
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) as total_orders,
    COUNT(DISTINCT oi.product_id) as unique_products_sold,
    SUM(oi.price) as total_revenue,
    AVG(r.review_score) as avg_review_score,
    AVG(
        EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))/86400.0
    ) as avg_delivery_time_days
FROM 
    sellers s
    LEFT JOIN order_items oi ON s.seller_id = oi.seller_id
    LEFT JOIN orders o ON oi.order_id = o.order_id
    LEFT JOIN order_reviews r ON o.order_id = r.order_id
WHERE 
    o.order_delivered_customer_date IS NOT NULL
GROUP BY 
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state;
