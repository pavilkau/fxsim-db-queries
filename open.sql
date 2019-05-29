--open=close from previous row

--Insert open values to "min" table
with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from min
  where pair = 'EUR/USD'
)
update min
set open = subquery.openn
from subquery
where min.time = subquery.time AND min.pair=subquery.pair;

--Insert open values to "fivemin" table

with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from fivemin
  where pair = 'EUR/USD'
)
update fivemin
set open = subquery.openn
from subquery
where fivemin.time = subquery.time AND fivemin.pair=subquery.pair;

--Insert open values to "tenmin" table

with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from tenmin
  where pair = 'EUR/USD'
)
update tenmin
set open = subquery.openn
from subquery
where tenmin.time = subquery.time AND tenmin.pair=subquery.pair;

--Insert open values to "thirtymin" table

with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from thirtymin
  where pair = 'EUR/USD'
)
update thirtymin
set open = subquery.openn
from subquery
where thirtymin.time = subquery.time AND thirtymin.pair=subquery.pair;

--Insert open values to "threehour" table

with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from threehour
  where pair = 'EUR/USD'
)
update threehour
set open = subquery.openn
from subquery
where threehour.time = subquery.time AND threehour.pair=subquery.pair;

--Insert open values to "sixhour" table

with subquery as
(
  select time, pair, lag(close,1,close) over (order by "time") as openn 
  from sixhour
  where pair = 'EUR/USD'
)
update sixhour
set open = subquery.openn
from subquery
where sixhour.time = subquery.time AND sixhour.pair=subquery.pair;