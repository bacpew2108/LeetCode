select distinct num as ConsecutiveNums
from (
    select num, lag(num,1) over (order by id) as pv1,lag(num,2) over (order by id) as pv2
    from Logs
) t
where num=pv1 and num=pv2;