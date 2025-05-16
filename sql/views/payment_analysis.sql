CREATE VIEW payment_analysis AS
SELECT 
    o.order_id,
    o.customer_id,
    p.payment_type,
    p.payment_installments,
    p.payment_value,
    DATE_TRUNC('month', o.order_purchase_timestamp) as payment_month,
    c.customer_state,
    c.customer_city
FROM 
    order_payments p
    JOIN orders o ON p.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id;
