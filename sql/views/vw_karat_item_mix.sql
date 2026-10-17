-- Question: Revenue by karat and item type (C-08)
-- Tables: fact_sales, dim_item, dim_karat, dim_item_type
CREATE VIEW vw_karat_item_mix AS
SELECT COALESCE(k.karat_name, 'No karat') AS karat_name,
       t.item_type_name,
       SUM(s.total_amount) AS revenue
FROM fact_sales s
JOIN dim_item i       ON s.item_id = i.item_id
LEFT JOIN dim_karat k ON i.karat_id = k.karat_id
JOIN dim_item_type t  ON i.item_type_id = t.item_type_id
WHERE s.is_return = false
GROUP BY k.karat_name, t.item_type_name;