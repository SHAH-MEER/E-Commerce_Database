-- Seller distribution by state
SELECT 
    seller_state,
    COUNT(*) AS seller_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sellers), 2) AS percentage
FROM sellers
GROUP BY seller_state
ORDER BY seller_count DESC;

-- Seller Revenue vs. Average Delivery Time
WITH seller_revenue_delivery_time AS (
    SELECT 
        s.seller_id,
        SUM(oi.price + oi.freight_value) AS total_revenue,
        AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) / 86400) AS avg_delivery_days
    FROM sellers s
    JOIN order_items oi ON s.seller_id = oi.seller_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY s.seller_id
)
SELECT 
    seller_id,
    total_revenue,
    avg_delivery_days,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM seller_revenue_delivery_time
ORDER BY revenue_rank;
