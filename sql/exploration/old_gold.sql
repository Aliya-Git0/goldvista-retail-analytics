-- Data profiling: are old-gold categories also appearing in retail sales?
-- Tables: fact_sales, dim_item, dim_category
SELECT 
    c.category_name, 
    COUNT(s.item_id) as times_sold_as_new
FROM fact_sales s
JOIN dim_item i ON s.item_id = i.item_id
JOIN dim_category c ON i.category_id = c.category_id
WHERE c.category_name ILIKE '%old%' OR c.category_name ILIKE '%buy%'
GROUP BY c.category_name;