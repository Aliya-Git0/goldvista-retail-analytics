-- Challenge C-04: Payment Mode Trends
-- Question: What share of collected value comes from each payment type?
-- Tables: fact_sales_payment, dim_payment_mode
SELECT p.payment_type,
       COUNT(*) AS payments,
       SUM(f.amount) AS total_collected,
       ROUND((SUM(f.amount) * 100.0 / SUM(SUM(f.amount)) OVER ())::numeric, 2) AS share_pct
FROM fact_sales_payment f
JOIN dim_payment_mode p ON f.payment_mode_id = p.payment_mode_id
GROUP BY p.payment_type
ORDER BY total_collected DESC;