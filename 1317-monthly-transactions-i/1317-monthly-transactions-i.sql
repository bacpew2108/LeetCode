select substring(trans_date,1,7) as month, 
    country,
    count(state) trans_count, 
    sum(state='approved') approved_count, 
    sum(amount) trans_total_amount, 
    sum(if(state='approved',amount,0)) approved_total_amount
from Transactions
group by month, country;