UPDATE Salary
SET sex = 
case when sex ='m' then 'f'
else 'm'
end;