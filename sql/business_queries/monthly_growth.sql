-- Challenge C-07: Monthly revenue and month-over-month growth
-- Question: How does revenue change from one month to the next?
-- Tables: fact_sales
WITH monthly AS (
    SELECT TO_CHAR(invoice_date, 'YYYY-MM') AS month,
           SUM(total_amount) AS revenue
    FROM fact_sales
    WHERE is_return = false
    GROUP BY 1
)
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month,
       ROUND(((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0
             / NULLIF(LAG(revenue) OVER (ORDER BY month), 0))::numeric, 2) AS mom_growth_pct
FROM monthly
ORDER BY month;
