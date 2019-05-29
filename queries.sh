#!/bin/bash
psql -f db-schema.sql fxsim
psql fxsim -c "COPY tick FROM '/path/to/exchangeRates/exchangeRates.csv' WITH (FORMAT csv)"
psql fxsim -a -f ./aggregateTime.sql
psql fxsim -a -f ./close.sql
psql fxsim -a -f ./aggregateMin.sql
psql fxsim -a -f ./aggregateHour.sql
psql fxsim -a -f ./open.sql
psql fxsim -a -f ./minMax.sql
psql fxsim -a -f ./minMaxN.sql