-- Challenge C-01: Company-wide totals
-- Question: What are total invoices, revenue and weight across all branches?
-- Tables: fact_sales
-- Overall Revenue, Weight, and Invoice Count
SELECT 
    COUNT(DISTINCT invoice_id) AS total_invoices,
    SUM(total_amount) AS total_revenue,
    SUM(net_weight) AS total_net_weight_grams,
    SUM(pure_weight) AS total_pure_weight_grams
FROM fact_sales
WHERE is_return = false;