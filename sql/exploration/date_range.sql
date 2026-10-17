-- Data profiling: date coverage of sales, returns and old gold purchases
-- Tables: fact_sales, fact_returns, fact_old_gold_purchase
SELECT 'Sales' AS transaction_type, MIN(invoice_date) AS start_date, MAX(invoice_date) AS end_date FROM fact_sales
UNION ALL 
SELECT 'Returns', MIN(return_date), MAX(return_date) FROM fact_returns
UNION ALL 
SELECT 'Old Gold Purchases', MIN(purchase_date), MAX(purchase_date) FROM fact_old_gold_purchase;

