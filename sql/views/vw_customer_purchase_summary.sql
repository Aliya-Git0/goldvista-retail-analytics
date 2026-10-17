-- Question: How many distinct visits and how much spend per customer? (C-02)
-- Tables: fact_sales
CREATE VIEW vw_customer_purchase_summary AS
SELECT customer_id,
	   COUNT(DISTINCT invoice_id) AS total_visits,
	   SUM(total_amount)          AS total_spend
FROM fact_sales
WHERE is_return = false
GROUP BY customer_id;
