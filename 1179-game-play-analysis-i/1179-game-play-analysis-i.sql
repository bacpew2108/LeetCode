SELECT A1.player_id, A1.event_date AS first_login
FROM Activity A1
LEFT JOIN Activity A2
ON A1.player_id = A2.player_id 
AND A1.event_date > A2.event_date
WHERE A2.player_id IS NULL;