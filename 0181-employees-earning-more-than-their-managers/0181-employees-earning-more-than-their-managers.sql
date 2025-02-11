select A.name AS Employee
from Employee A
JOIN Employee B ON A.managerId = B.id
where A.salary > B.salary;