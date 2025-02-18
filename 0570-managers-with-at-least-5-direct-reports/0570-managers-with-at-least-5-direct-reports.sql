select e.name 
from Employee as e
join (select managerId from Employee group by managerId having count(managerId) >= 5) as 5dr
on 5dr.managerId = e.id;