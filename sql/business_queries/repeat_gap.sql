-- Challenge C-02: Time between first and second purchase
-- Question: On average, how many days pass before a customer buys again?
-- Tables: fact_sales
WITH inv AS (
    SELECT customer_id, invoice_id, MIN(invoice_date) AS invoice_date
    FROM fact_sales
    WHERE is_return = false
    GROUP BY customer_id, invoice_id
),
ranked AS (
    SELECT customer_id, invoice_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY invoice_date, invoice_id) AS rn
    FROM inv
)
SELECT ROUND(AVG(r2.invoice_date - r1.invoice_date)::numeric, 1) AS avg_days_to_second_purchase,
       COUNT(*) AS repeat_customers
FROM ranked r1
JOIN ranked r2 ON r1.customer_id = r2.customer_id AND r1.rn = 1 AND r2.rn = 2;
