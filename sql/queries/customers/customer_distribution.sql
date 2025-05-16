-- Customer distribution by state
SELECT 
    customer_state,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY customer_state
ORDER BY customer_count DESC;

-- Customer purchase frequency
SELECT 
    purchase_count,
    COUNT(*) AS customer_count
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS purchase_count
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) AS customer_purchases
GROUP BY purchase_count
ORDER BY purchase_count;
