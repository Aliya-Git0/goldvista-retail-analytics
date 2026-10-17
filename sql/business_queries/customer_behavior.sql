-- Challenge C-02: Customer segmentation
-- Question: How many customers are one-time, occasional (2-3), regular (4-6) or VIP (7+)?
-- Tables: fact_sales
WITH counts AS (
    SELECT customer_id, COUNT(DISTINCT invoice_id) AS purchases
    FROM fact_sales
    WHERE is_return = false
    GROUP BY customer_id
)
SELECT CASE WHEN purchases = 1 THEN '1 One-time'
            WHEN purchases <= 3 THEN '2 Occasional'
            WHEN purchases <= 6 THEN '3 Regular'
            ELSE '4 VIP' END AS segment,
       COUNT(*) AS customers
FROM counts
GROUP BY 1
ORDER BY 1;