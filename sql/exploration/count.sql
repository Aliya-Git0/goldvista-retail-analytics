-- Data profiling: row counts of the main fact and dimension tables
-- Tables: fact_sales, fact_sales_payment, fact_returns, fact_old_gold_purchase, dim_customer, dim_item
SELECT 'fact_sales' AS table_name, COUNT(*) AS row_count FROM fact_sales
UNION ALL 
SELECT 'fact_sales_payment', COUNT(*) FROM fact_sales_payment
UNION ALL 
SELECT 'fact_returns', COUNT(*) FROM fact_returns
UNION ALL 
SELECT 'fact_old_gold_purchase', COUNT(*) FROM fact_old_gold_purchase
UNION ALL 
SELECT 'dim_customer', COUNT(*) FROM dim_customer
UNION ALL 
SELECT 'dim_item', COUNT(*) FROM dim_item;

