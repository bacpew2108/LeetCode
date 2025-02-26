with countOrder as (
    select buyer_id, count(order_date) as Count
    from Orders 
    where year(order_date) = '2019'
    group by buyer_id
)

select u.user_id as buyer_id, u.join_date, coalesce(co.Count,0) as orders_in_2019
from Users u
left join Orders o on u.user_id = o.buyer_id
left join countOrder co on u.user_id = co.buyer_id
group by u.user_id; 
