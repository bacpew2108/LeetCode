with countFr as (
    select id, count(*) as num
    from (select requester_id as id
        from RequestAccepted
        union all
        select accepter_id 
        from RequestAccepted) as listFR
    group by id
)

select id, num
from countFr
where num in (select max(num) from countFr);