--aggregate time to multiple minutes
insert into fivemin(time,pair,close)
select time, pair, close
  from min
  where pair = 'EUR/USD' AND cast(extract(minute from time) as int) % 5  = 0 order by time;

insert into tenmin(time,pair,close)
select time, pair, close
  from min
  where pair = 'EUR/USD' AND cast(extract(minute from time) as int) % 10 = 0 order by time;

insert into thirtymin(time,pair,close)
select time, pair, close
  from min
  where pair = 'EUR/USD' AND cast(extract(minute from time) as int) % 30  = 0 order by time;
