-- Data profiling: rows in fact_sales with missing customer, item or branch keys
-- Tables: fact_sales
SELECT COUNT(*) 
FROM fact_sales 
WHERE customer_id IS NULL OR item_id IS NULL OR branch_id IS NULL;