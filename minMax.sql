WITH subquery AS 
(
    SELECT MIN(bid) as mbid, date_trunc('minute', "time") as mtime
    FROM tick 
    WHERE pair='EUR/USD'
    GROUP BY (date_trunc('minute', "time"))
)
UPDATE min
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT MAX(bid) as mbid, date_trunc('minute', "time") as mtime
    FROM tick 
    WHERE pair='EUR/USD'
    GROUP BY (date_trunc('minute', "time"))
)
UPDATE min
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';