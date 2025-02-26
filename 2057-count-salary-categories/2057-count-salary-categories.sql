WITH salary_categories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)
select sc.category, count(type.category) as accounts_count
from salary_categories as sc
left join 
(select
case
    when income < 20000 then "Low Salary"
    when income between 20000 and 50000 then "Average Salary"
    else "High Salary"
end as category
from Accounts) as type
on sc.category = type.category
group by sc.category;
