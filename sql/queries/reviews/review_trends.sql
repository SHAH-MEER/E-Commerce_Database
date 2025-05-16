-- Review Trends Over Time
SELECT 
    TO_CHAR(review_creation_date, 'YYYY-MM') AS month,
    COUNT(*) AS review_count,
    AVG(review_score) AS avg_score,
    COUNT(CASE WHEN review_comment_message IS NOT NULL THEN 1 END) AS comments_count
FROM order_reviews
GROUP BY month
ORDER BY month;

-- Average Response Time for Reviews
SELECT 
    TO_CHAR(review_creation_date, 'YYYY-MM') AS month,
    AVG(EXTRACT(EPOCH FROM (review_answer_timestamp - review_creation_date)) / 3600) AS avg_response_time_hours
FROM order_reviews
WHERE review_answer_timestamp IS NOT NULL
GROUP BY month
ORDER BY month;
