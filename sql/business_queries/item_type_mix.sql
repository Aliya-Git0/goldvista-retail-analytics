-- Challenge C-08: Item type revenue and making charge per gram
-- Question: Which item types earn the most, and what is their making charge per gram?
-- Tables: fact_sales, dim_item, dim_item_type
SELECT t.item_type_name,
       SUM(s.total_amount) AS revenue,
       SUM(s.gross_weight) AS weight_g,
       ROUND((SUM(s.making_amount) / NULLIF(SUM(s.gross_weight), 0))::numeric, 2) AS making_per_gram
FROM fact_sales s
JOIN dim_item i ON s.item_id = i.item_id
JOIN dim_item_type t ON i.item_type_id = t.item_type_id
WHERE s.is_return = false
GROUP BY t.item_type_name
ORDER BY revenue DESC;