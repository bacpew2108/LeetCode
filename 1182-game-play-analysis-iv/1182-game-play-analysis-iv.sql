with theFirstLogin as(
    select player_id, min(event_date) as firstLogin
    from Activity
    group by player_id
)
select round(count(a1.player_id)/(select count(distinct(player_id)) from Activity),2) as fraction
from Activity a1
join theFirstLogin a2 on a1.event_date = DATE_ADD(a2.firstLogin, INTERVAL 1 day)
and a1.player_id = a2.player_id;
