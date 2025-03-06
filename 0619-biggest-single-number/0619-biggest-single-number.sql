with single_num as (select num
from MyNumbers
group by num
having count(*) = 1)

select max(num) as num
from single_num;