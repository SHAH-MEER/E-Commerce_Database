CREATE VIEW review_metrics AS
SELECT 
    r.order_id,
    r.review_id,
    r.review_score,
    r.review_creation_date,
    r.review_answer_timestamp,
    EXTRACT(EPOCH FROM (r.review_answer_timestamp - r.review_creation_date))/3600.0 as response_time_hours,
    o.order_purchase_timestamp,
    p.product_category_name,
    pct.product_category_name_english,
    s.seller_id,
    s.seller_state
FROM 
    order_reviews r
    JOIN orders o ON r.order_id = o.order_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN product_category_translation pct ON p.product_category_name = pct.product_category_name
    JOIN sellers s ON oi.seller_id = s.seller_id;
