-- Challenge C-03: Return Rate Analysis
-- Question: What is the return rate (distinct return IDs / distinct sale invoices) per branch?
-- Tables: fact_sales, fact_returns, dim_branch
WITH sales_cte AS (
    SELECT branch_id, COUNT(DISTINCT invoice_id) AS sale_invoices
    FROM fact_sales
    WHERE is_return = false
    GROUP BY branch_id
),
returns_cte AS (
    SELECT branch_id, COUNT(DISTINCT return_id) AS return_count
    FROM fact_returns
    GROUP BY branch_id
)
SELECT b.branch_name,
       s.sale_invoices,
       COALESCE(r.return_count, 0) AS return_count,
       ROUND(COALESCE(r.return_count, 0)::numeric / NULLIF(s.sale_invoices, 0) * 100, 2) AS return_rate_pct
FROM sales_cte s
JOIN dim_branch b ON s.branch_id = b.branch_id
LEFT JOIN returns_cte r ON s.branch_id = r.branch_id
ORDER BY return_rate_pct DESC;