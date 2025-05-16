-- Top sellers by revenue
SELECT 
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_revenue
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY total_revenue DESC
LIMIT 20;

-- Top Sellers by Average Order Value
WITH seller_order_avg AS (
    SELECT 
        s.seller_id,
        AVG(oi.price) AS avg_order_value
    FROM sellers s
    JOIN order_items oi ON s.seller_id = oi.seller_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY s.seller_id
)
SELECT 
    seller_id,
    avg_order_value,
    RANK() OVER (ORDER BY avg_order_value DESC) AS rank
FROM seller_order_avg
ORDER BY rank;
