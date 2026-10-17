WITH Payment_Totals AS (
    SELECT invoice_id, SUM(amount) AS total_paid
    FROM fact_sales_payment
    GROUP BY invoice_id
),
Invoice_Totals AS (
    SELECT invoice_id, SUM(total_amount) AS invoice_total
    FROM fact_sales
    WHERE is_return = false
    GROUP BY invoice_id
)
SELECT 
    i.invoice_id, 
    i.invoice_total, 
    p.total_paid, 
    (p.total_paid - i.invoice_total) AS discrepancy
FROM Invoice_Totals i
LEFT JOIN Payment_Totals p ON i.invoice_id = p.invoice_id
WHERE ROUND((p.total_paid - i.invoice_total)::numeric, 2) != 0
   OR p.total_paid IS NULL
LIMIT 10;