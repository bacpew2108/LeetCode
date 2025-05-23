select u.user_id as buyer_id, u.join_date, coalesce(count(o.order_date),0) as orders_in_2019
from Users u
left join Orders o on u.user_id = o.buyer_id and year(order_date) = '2019'
group by u.user_id; 