with CTE as (
    select *, id - row_number() over (order by visit_date) as grp
    from Stadium 
    where people >= 100
)

select id, visit_date, people
from CTE
WHERE grp IN (
    SELECT grp
    FROM CTE
    GROUP BY grp
    HAVING COUNT(grp) >= 3
)
ORDER BY visit_date