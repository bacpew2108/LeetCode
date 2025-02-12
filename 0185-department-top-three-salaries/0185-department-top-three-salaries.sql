with topThreeUnique as (
    select e.id, e.name, e.salary, e.departmentId, DENSE_RANK() over (partition by e.departmentId order by e.salary DESC) salary_rank
    from Employee e
)

select d.name Department, t.name Employee, t.salary Salary
from topThreeUnique t
join Department d on t.departmentId = d.id
where t.salary_rank <=3;

