--min/max for multiple minute/hour groups
-- fivemin
WITH subquery AS 
(
    SELECT max(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 300 )) * 300) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE fivemin
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT min(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 300 )) * 300) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE fivemin
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

--tenmin
WITH subquery AS 
(
    SELECT max(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 600 )) * 600) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE tenmin
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT min(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 600 )) * 600) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE tenmin
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

--thirtymin
WITH subquery AS 
(
    SELECT max(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 1800 )) * 1800) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE thirtymin
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT min(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 1800 )) * 1800) 
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE thirtymin
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

------------------------------------------------------------------------

WITH subquery AS 
(
    SELECT max(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 10800 )) * 10800)
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE threehour
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT min(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 10800 )) * 10800)
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE threehour
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

--sixhour
WITH subquery AS 
(
    SELECT max(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 21600 )) * 21600)
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE sixhour
SET max=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';

WITH subquery AS 
(
    SELECT min(bid) as mbid, to_timestamp(floor((extract('epoch' from time) / 21600 )) * 21600)
AT TIME ZONE 'UTC' as mtime
    FROM tick 
    WHERE pair='EUR/USD' 
    GROUP BY mtime
)
UPDATE sixhour
SET min=subquery.mbid
FROM subquery
where (date_trunc('minute', "time")) = subquery.mtime AND pair='EUR/USD';