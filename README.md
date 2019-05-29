# fxsim-db-queries
sh scripts for Forex historical transaction data scraping and PostgreSQL queries for aggregation

Use db-schema.sql as guidance for the database structure
modify scrapeFX.sh to pull the needed data which will be stored in exchangeRates.csv
Import exchangeRates.csv to the database
Run queries.sh to execute sql scripts (order of execution in queries.sh is important)
