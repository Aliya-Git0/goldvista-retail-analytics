-- Challenge C-01: Is each branch growing or declining?
-- Question: What is each branch's 3-month rolling average revenue?
-- Tables: fact_sales, dim_branch
WITH m AS (
    SELECT b.branch_name, TO_CHAR(s.invoice_date, 'YYYY-MM') AS month, SUM(s.total_amount) AS revenue
    FROM fact_sales s
    JOIN dim_branch b ON s.branch_id = b.branch_id
    WHERE s.is_return = false
    GROUP BY 1, 2
)
SELECT branch_name, month, revenue,
       ROUND((AVG(revenue) OVER (PARTITION BY branch_name ORDER BY month
             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW))::numeric, 0) AS rolling_3m_avg
FROM m
ORDER BY branch_name, month;
