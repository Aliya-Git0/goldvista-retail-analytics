-- Question: Return count and value per branch, from fact_returns (C-03)
-- Tables: fact_returns, dim_branch
CREATE VIEW vw_returns_analysis AS
SELECT b.branch_name,
       COUNT(DISTINCT r.return_id) AS return_count,
       SUM(r.total_amount)         AS return_value
FROM fact_returns r
JOIN dim_branch b ON r.branch_id = b.branch_id
GROUP BY b.branch_name;