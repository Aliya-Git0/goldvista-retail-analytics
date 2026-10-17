CREATE OR REPLACE VIEW view_clean_sales AS
SELECT 
    s.invoice_id,
    s.invoice_date,
    s.branch_id,
    s.item_id,
    s.customer_id,
    s.salesperson_id,
    s.total_amount,
    s.net_weight,
    s.pure_weight,
    i.purity,             -- Explicitly pulling from item table
    t.item_type_name,     -- Pulling the name from the snowflake table
    b.branch_name
FROM fact_sales s
JOIN dim_item i ON s.item_id = i.item_id
JOIN dim_item_type t ON i.item_type_id = t.item_type_id
JOIN dim_branch b ON s.branch_id = b.branch_id
WHERE s.is_return = false;