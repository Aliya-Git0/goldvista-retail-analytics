-- Challenge C-06: Salesperson Effectiveness
-- Question: Who are the top 10 and bottom 10 salespeople by revenue?
-- Tables: fact_sales, dim_salesperson
WITH sp AS (
    SELECT p.salesperson_name,
           SUM(s.total_amount) AS revenue,
           COUNT(DISTINCT s.invoice_id) AS invoices,
           RANK() OVER (ORDER BY SUM(s.total_amount) DESC) AS rank_top,
           RANK() OVER (ORDER BY SUM(s.total_amount) ASC)  AS rank_bottom
    FROM fact_sales s
    JOIN dim_salesperson p ON s.salesperson_id = p.salesperson_id
    WHERE s.is_return = false
    GROUP BY p.salesperson_name
)
SELECT * FROM sp
WHERE rank_top <= 10 OR rank_bottom <= 10
ORDER BY revenue DESC;