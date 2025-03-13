with cte as 
(select product_id, sale_date,
case 
    when sale_date between '2019-01-01' and '2019-03-31' then 1
    else 2
end as date_index
from Sales
order by product_id)


select p.product_id, p.product_name
from Product p
join cte c using (product_id)
group by product_id
having min(c.date_index = 1);