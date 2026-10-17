-- Data profiling: are branch_id values unique in dim_branch?
-- Tables: dim_branch
SELECT branch_id, COUNT(*) 
FROM dim_branch 
GROUP BY branch_id 
HAVING COUNT(*) > 1;