-- Challenge C-07: Cumulative revenue by month
-- Question: How does revenue build up over the 13 months?
-- Tables: fact_sales
WITH monthly AS (
    SELECT TO_CHAR(invoice_date, 'YYYY-MM') AS month, SUM(total_amount) AS revenue
    FROM fact_sales
    WHERE is_return = false
    GROUP BY 1
)
SELECT month, revenue,
       SUM(revenue) OVER (ORDER BY month) AS running_total
FROM monthly
ORDER BY month;
