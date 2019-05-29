#!/bin/bash
#months="JANUARY FEBRUARY MARCH APRIL MAY JUNE JULY AUGUST SEPTEMBER OCTOBER NOVEMBER DECEMBER"
mon="JANUARY"
for ((k = 16; k < 17; k++))
do
    j=1
    for i in $mon
    do
        wget -P ~/exchangeRates "http://truefx.com/dev/data/20$k/$i-20$k/EURUSD-20$k-`printf "%02d" $j`.zip"
        #http://www.truefx.com/dev/data/2016/JANUARY-2016/EURUSD-2016-01.zip
        ((j++))
    done
done

cd ~/exchangeRates

unzip "*.zip"
rm *.zip

for i in *.csv; do
    awk -F"," '!_[$2]++' $i >> exchangeRates.csv
    echo $i
    rm $i    
done