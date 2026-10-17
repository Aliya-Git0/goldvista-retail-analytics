-- Question: Monthly old gold buy-back weight and payout by branch (C-05)
-- Tables: fact_old_gold_purchase, dim_branch
CREATE VIEW vw_old_gold_summary AS
SELECT b.branch_name,
       TO_CHAR(g.purchase_date, 'YYYY-MM') AS month,
       SUM(g.gross_weight)                 AS weight_g,
       SUM(g.total_amount)                 AS payout
FROM fact_old_gold_purchase g
JOIN dim_branch b ON g.branch_id = b.branch_id
GROUP BY b.branch_name, TO_CHAR(g.purchase_date, 'YYYY-MM');