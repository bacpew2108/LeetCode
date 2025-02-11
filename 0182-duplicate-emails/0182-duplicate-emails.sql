Select distinct A.email AS Email
from Person A
join Person B on A.email = B.Email
where A.id <> B.id;