select A.name AS Customers
from Customers A
left join Orders B on A.id = B.customerId 
where B.customerId IS NULL;