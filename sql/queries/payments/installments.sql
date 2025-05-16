-- Installment analysis
SELECT 
    payment_installments,
    COUNT(*) AS payment_count,
    AVG(payment_value) AS avg_payment_value,
    SUM(payment_value) AS total_payment_value
FROM order_payments
GROUP BY payment_installments
ORDER BY payment_installments;

-- Payment Installment Distribution by Seller
SELECT 
    s.seller_id,
    op.payment_installments,
    COUNT(*) AS payment_count,
    SUM(op.payment_value) AS total_payment_value
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN order_payments op ON oi.order_id = op.order_id
GROUP BY s.seller_id, op.payment_installments
ORDER BY seller_id, payment_installments;
