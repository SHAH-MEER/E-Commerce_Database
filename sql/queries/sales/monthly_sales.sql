-- Total sales by month
SELECT 
    TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales,
    AVG(oi.price) AS average_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- Sales Growth by Month
WITH monthly_sales AS (
    SELECT 
        TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
        SUM(oi.price) AS total_sales
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY month
)
SELECT 
    month,
    total_sales,
    LAG(total_sales) OVER (ORDER BY month) AS prev_month_sales,
    ROUND((total_sales - LAG(total_sales) OVER (ORDER BY month)) * 100.0 / LAG(total_sales) OVER (ORDER BY month), 2) AS sales_growth_percentage
FROM monthly_sales
ORDER BY month;

-- Cumulative Sales by Month
WITH monthly_sales AS (
    SELECT 
        TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
        SUM(oi.price) AS total_sales
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY month
)
SELECT 
    month,
    total_sales,
    SUM(total_sales) OVER (ORDER BY month) AS cumulative_sales
FROM monthly_sales
ORDER BY month;
