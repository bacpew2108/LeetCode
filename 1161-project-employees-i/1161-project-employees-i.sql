select project_id, round(sum(experience_years)/count(experience_years) ,2) as average_years
from Project
join Employee using (employee_id)
group by project_id;