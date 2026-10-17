-- Challenge C-08: Karat & Product Mix
-- Question: What is the revenue and weight split by karat?
-- Tables: fact_sales, dim_item, dim_karat
SELECT COALESCE(k.karat_name, 'No karat') AS karat,
       SUM(s.total_amount) AS revenue,
       SUM(s.gross_weight) AS weight_g,
       ROUND((SUM(s.total_amount) * 100.0 / SUM(SUM(s.total_amount)) OVER ())::numeric, 2) AS revenue_share_pct
FROM fact_sales s
JOIN dim_item i ON s.item_id = i.item_id
LEFT JOIN dim_karat k ON i.karat_id = k.karat_id
WHERE s.is_return = false
GROUP BY k.karat_name
ORDER BY revenue DESC;