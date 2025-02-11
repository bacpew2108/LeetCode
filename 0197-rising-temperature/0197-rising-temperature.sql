select A.id
from Weather A
join Weather B
on A.recordDate = B.recordDate + INTERVAL 1 DAY
AND A.temperature > B.temperature;
