# fxsim-db-queries
sh scripts for Forex historical transaction data scraping and PostgreSQL queries for aggregation

- Create PostgreSQL database fxsim
> Take a look at db-schema.sql for users and the idea about the structure
- Modify scrapeFX.sh to pull the needed data
  - It will be stored in exchangeRates.csv
- Run queries.sh to
  - Use db-schema on the database fxsim
  - Import exchangeRates.csv to the database
  - Execute sql scripts that sorts and aggregates the data
  > Order of execution in queries.sh is important
