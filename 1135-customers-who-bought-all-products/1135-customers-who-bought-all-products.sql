select c.customer_id
from Customer c, Product p
group by c.customer_id
having count(distinct c.product_key) = count(distinct p.product_key);