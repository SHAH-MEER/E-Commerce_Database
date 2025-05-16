-- Average Days Between Orders
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        o.order_purchase_timestamp,
        LAG(o.order_purchase_timestamp) OVER (
            PARTITION BY c.customer_unique_id 
            ORDER BY o.order_purchase_timestamp
        ) AS prev_order_timestamp
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
)
SELECT
    customer_unique_id,
    ROUND(AVG(EXTRACT(EPOCH FROM (order_purchase_timestamp - prev_order_timestamp)) / 86400), 2) AS avg_days_between_orders
FROM customer_orders
WHERE prev_order_timestamp IS NOT NULL
GROUP BY customer_unique_id;

-- Repeat Customers and Total Spend
WITH order_totals AS (
    SELECT
        o.order_id,
        SUM(oi.price + oi.freight_value) AS total_amount
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
)
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS num_orders,
    SUM(ot.total_amount) AS total_spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_totals ot ON o.order_id = ot.order_id
GROUP BY c.customer_unique_id
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_spend DESC;

-- Customer Lifetime Value (CLV)
WITH customer_revenue AS (
    SELECT 
        c.customer_unique_id,
        SUM(oi.price + oi.freight_value) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
SELECT 
    customer_unique_id,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank;
