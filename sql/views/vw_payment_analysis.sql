-- Question: Payment amount by mode and type (C-04)
-- Tables: fact_sales_payment, dim_payment_mode
CREATE VIEW vw_payment_analysis AS
SELECT f.invoice_id,
       p.payment_mode_name,
       p.payment_type,
       f.amount
FROM fact_sales_payment f
JOIN dim_payment_mode p ON f.payment_mode_id = p.payment_mode_id;