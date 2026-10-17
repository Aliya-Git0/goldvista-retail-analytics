-- Question: Revenue and invoices per salesperson (C-06)
-- Tables: fact_sales, dim_salesperson
CREATE VIEW vw_salesperson_performance AS
SELECT sp.salesperson_name,
	   COUNT(DISTINCT s.invoice_id) AS total_invoices,
	   SUM(s.total_amount)          AS revenue
FROM fact_sales s
JOIN dim_salesperson sp ON s.salesperson_id = sp.salesperson_id
WHERE s.is_return = false
GROUP BY sp.salesperson_name;
