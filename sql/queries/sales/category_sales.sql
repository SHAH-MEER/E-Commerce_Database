-- Sales by product category
SELECT 
    COALESCE(pct.product_category_name_english, p.product_category_name) AS category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales,
    AVG(oi.price) AS average_price,
    SUM(oi.freight_value) AS total_freight
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN product_category_translation pct ON p.product_category_name = pct.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY total_sales DESC;

-- Top 3 Products by Units Sold per Category
WITH product_sales AS (
    SELECT
        p.product_category_name,
        p.product_id,
        COUNT(*) AS total_units_sold,
        ROW_NUMBER() OVER (PARTITION BY p.product_category_name ORDER BY COUNT(*) DESC) AS rank
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_category_name, p.product_id
)
SELECT
    product_category_name,
    product_id,
    total_units_sold
FROM product_sales
WHERE rank <= 3
ORDER BY product_category_name, rank;

-- Category Performance Trends with Year-over-Year Growth
WITH category_sales AS (
    SELECT 
        pct.product_category_name_english,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS sales_month,
        SUM(oi.price) as total_sales
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN product_category_translation pct ON p.product_category_name = pct.product_category_name
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY pct.product_category_name_english, sales_month
),
category_metrics AS (
    SELECT 
        product_category_name_english,
        sales_month,
        total_sales,
        LAG(total_sales, 12) OVER (
            PARTITION BY product_category_name_english 
            ORDER BY sales_month
        ) as prev_year_sales,
        AVG(total_sales) OVER (
            PARTITION BY product_category_name_english 
            ORDER BY sales_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) as moving_avg_3_months
    FROM category_sales
)
SELECT 
    product_category_name_english,
    sales_month,
    total_sales,
    ROUND((total_sales - prev_year_sales) * 100.0 / NULLIF(prev_year_sales, 0), 2) as yoy_growth,
    moving_avg_3_months,
    RANK() OVER (
        PARTITION BY DATE_TRUNC('year', sales_month)
        ORDER BY total_sales DESC
    ) as category_rank_in_year
FROM category_metrics
WHERE prev_year_sales IS NOT NULL
ORDER BY sales_month DESC, total_sales DESC;
