-- Data profiling: how many rows and how much value are flagged is_return?
-- Tables: fact_sales
SELECT is_return, COUNT(*), SUM(total_amount) 
FROM fact_sales 
GROUP BY is_return;