-- Challenge C-05: Average invoice value, buy-back customers vs others
-- Question: Do customers who sold old gold spend more per invoice?
-- Tables: fact_sales, fact_old_gold_purchase
WITH inv AS (
    SELECT customer_id, invoice_id, SUM(total_amount) AS inv_total
    FROM fact_sales
    WHERE is_return = false
    GROUP BY customer_id, invoice_id
),
og AS (SELECT DISTINCT customer_id FROM fact_old_gold_purchase)
SELECT CASE WHEN og.customer_id IS NULL THEN 'No buy-back' ELSE 'Buy-back customer' END AS customer_group,
       COUNT(*) AS invoices,
       ROUND(AVG(inv.inv_total)::numeric, 2) AS avg_invoice_value
FROM inv
LEFT JOIN og ON inv.customer_id = og.customer_id
GROUP BY 1;
