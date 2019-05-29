    --close = last price of the current minute
WITH subquery AS 
(
    select distinct on (date_trunc('minute', "time")) date_trunc('minute', "time") as ctime, bid as cbid, pair as cpair
    from tick
    where pair = 'EUR/USD'
    order by (date_trunc('minute', "time")), "time" desc
)
UPDATE min
SET close=subquery.cbid
FROM subquery
where "time" = subquery.ctime AND pair = subquery.cpair;