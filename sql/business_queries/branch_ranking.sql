-- Challenge C-01: Branch Performance Gap
-- Question: How do branches rank by revenue vs by weight sold?
-- Tables: fact_sales, dim_branch
SELECT b.branch_name,
       SUM(s.total_amount) AS total_revenue,
       SUM(s.gross_weight) AS weight_g,
       RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS revenue_rank,
       RANK() OVER (ORDER BY SUM(s.gross_weight) DESC) AS weight_rank
FROM fact_sales s
JOIN dim_branch b ON s.branch_id = b.branch_id
WHERE s.is_return = false
GROUP BY b.branch_name
ORDER BY revenue_rank;