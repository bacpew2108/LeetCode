(select u.name as results
from MovieRating m
join Users u
on m.user_id = u.user_id
group by m.user_id
order by count(m.movie_id) DESC, name ASC
limit 1)
union all
(select m.title 
from MovieRating mr
join Movies m
on mr.movie_id = m.movie_id
where EXTRACT(YEAR FROM mr.created_at) = 2020 
AND EXTRACT(MONTH FROM mr.created_at) = 2 
group by mr.movie_id
order by round(avg(mr.rating), 1) DESC, title ASC
limit 1);