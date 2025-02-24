select id,
Case
    when p_id IS NULL then "Root"
    when id in (select t1.id from Tree t1 left join Tree t2 on t2.p_id = t1.id where t2.p_id IS NULL) then "Leaf"
    else "Inner"
end as type
from Tree;

