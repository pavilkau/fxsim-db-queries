--aggregate time to hours
insert into threehour(time,pair,close)
select time, pair, close
  from min
  where pair = 'EUR/USD' AND cast(extract(hour from time) as int) % 3  = 0  
  AND cast(extract(minute from time) as int) = 0 order by time;

insert into sixhour(time,pair,close)
select time, pair, close
  from min
  where pair = 'EUR/USD' AND cast(extract(hour from time) as int) % 6  = 0  
  AND cast(extract(minute from time) as int) = 0 order by time;
