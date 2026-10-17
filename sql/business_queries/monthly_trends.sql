-- Challenge C-07: Daily & Seasonal Sales Patterns
-- Question: How do invoices and revenue trend month by month?
-- Tables: fact_sales
-- Monthly Sales Trend
SELECT 
    TO_CHAR(invoice_date, 'YYYY-MM') AS sale_month,
    COUNT(DISTINCT invoice_id) AS total_invoices,
    SUM(total_amount) AS monthly_revenue
FROM fact_sales
WHERE is_return = false
GROUP BY TO_CHAR(invoice_date, 'YYYY-MM')
ORDER BY sale_month ASC;