-- Challenge C-07: Which days of the week are busiest?
-- Question: How do invoices and revenue vary by weekday?
-- Tables: fact_sales
SELECT EXTRACT(ISODOW FROM invoice_date) AS day_no,
       TO_CHAR(invoice_date, 'Day') AS day_name,
       COUNT(DISTINCT invoice_id) AS invoices,
       SUM(total_amount) AS revenue
FROM fact_sales
WHERE is_return = false
GROUP BY 1, 2
ORDER BY 1;
