select actor_id, director_id
from(
    select actor_id, director_id,rank() over (partition by actor_id, director_id order by timestamp) as rnk
    from ActorDirector 
) as count
where rnk=3;
