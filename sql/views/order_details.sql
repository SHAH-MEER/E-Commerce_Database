CREATE VIEW order_details AS
SELECT 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    COUNT(oi.order_item_id) as items_count,
    SUM(oi.price) as items_total,
    SUM(oi.freight_value) as freight_total,
    p.payment_type,
    p.payment_installments,
    r.review_score,
    EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp))/86400.0 as delivery_time_days,
    CASE 
        WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN TRUE
        ELSE FALSE
    END as delivered_on_time
FROM 
    orders o
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN order_payments p ON o.order_id = p.order_id
    LEFT JOIN order_reviews r ON o.order_id = r.order_id
GROUP BY 
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    p.payment_type,
    p.payment_installments,
    r.review_score;
