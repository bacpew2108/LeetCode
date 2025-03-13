with cte as (select p.product_name, sum(o.unit) over (partition by o.product_id order by o.product_id) as unit
from Products p
left join Orders o using(product_id)
where (order_date between '2020-02-01' and '2020-02-29'))

select distinct product_name, unit 
from cte
where unit>=100;