insert into min(time, pair)
select distinct  (date_trunc('minute', time)), pair
from tick
where pair = 'EUR/USD'
order by date_trunc('minute', time);