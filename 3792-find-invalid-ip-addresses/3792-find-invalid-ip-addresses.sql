select ip, count(*) as invalid_count
from logs
where ip regexp '\\b(25[6-9]|2[6-9][0-9]|[3-9][0-9]{2})\\b'
or ip regexp '\\b(0[0-9]{1,2})\\b'
or ip not regexp '^([0-9]{1,3}[.]){3}[0-9]{1,3}$'
group by ip
order by invalid_count DESC, ip DESC;