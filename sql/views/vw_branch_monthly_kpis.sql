-- Question: Revenue, weight and invoices per branch per month,
--           built from raw sales (the daily summary table has gaps) (C-01, C-07)
-- Tables: fact_sales, dim_branch
CREATE VIEW vw_branch_monthly_kpis AS
SELECT b.branch_name,
       TO_CHAR(s.invoice_date, 'YYYY-MM') AS month,
       SUM(s.total_amount)                AS revenue,
       SUM(s.gross_weight)                AS weight_grams,
       COUNT(DISTINCT s.invoice_id)       AS invoices
FROM fact_sales s
JOIN dim_branch b ON s.branch_id = b.branch_id
WHERE s.is_return = false
GROUP BY b.branch_name, TO_CHAR(s.invoice_date, 'YYYY-MM');
