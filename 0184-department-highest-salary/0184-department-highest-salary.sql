with theMaxSalary as (
    select departmentId, MAX(salary) max_salary
    from Employee
    group by departmentId
)

select distinct D.name Department, E.name Employee, E.salary Salary
from Employee E
join theMaxSalary M on E.departmentId = M.departmentId and M.max_salary = E.salary
join Department D on E.departmentId = D.id;