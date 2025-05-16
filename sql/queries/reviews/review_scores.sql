-- Review score distribution
SELECT 
    review_score,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM order_reviews), 2) AS percentage
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;
