CREATE VIEW sales_overview AS
SELECT 
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,
    pct.product_category_name_english,
    oi.price,
    oi.freight_value,
    o.order_status,
    o.order_status,
    o.order_purchase_timestamp,
    DATE_TRUNC('month', o.order_purchase_timestamp) as sales_month
FROM 
    order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_translation pct ON p.product_category_name = pct.product_category_name
JOIN orders o ON oi.order_id = o.order_id;
