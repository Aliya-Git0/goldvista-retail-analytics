-- DATA PROFILING NOTE: Verified Branch 1 on 2025-01-15. 
-- Raw transactions show 126 rows (Total: 345,505), but fact_branch_daily_summary shows 0.
-- Decision: Rely primarily on raw fact tables for accurate downstream aggregations.

-- Total from raw sales for a specific branch on a specific day
SELECT SUM(total_amount) 
FROM fact_sales 
WHERE branch_id = 1 AND invoice_date = '2025-01-15' AND is_return = false;

-- Compare it against the summary table record
SELECT total_amount 
FROM fact_branch_daily_summary 
WHERE branch_id = 1 AND summary_date = '2025-01-15';
