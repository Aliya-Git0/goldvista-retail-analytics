-- Challenge C-05: Old Gold Buy-Back Impact
-- Question: How much old gold (weight and payout) is bought back each month?
-- Tables: fact_old_gold_purchase
SELECT 
    TO_CHAR(purchase_date, 'YYYY-MM') AS activity_month,
    COUNT(purchase_id) AS total_buybacks,
    SUM(gross_weight) AS total_gross_weight_received,
    SUM(total_amount) AS total_payout
FROM fact_old_gold_purchase
GROUP BY TO_CHAR(purchase_date, 'YYYY-MM')
ORDER BY activity_month ASC;