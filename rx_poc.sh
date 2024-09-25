#! /bin/bash

#get current date
today=$(date +%Y%m%d)

#raw data file name
weather_report=raw_data_$today

#location
city=Casablanca

#get data from source, ouput in defined raw data file name
curl wttr.in/$city --output $weather_report

#extract temperature data from raw data
grep °C $weather_report > temperatures.txt

#get observed temperature
obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev)

#get forecast temperature
fc_temp=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs | cut -d "C" -f2 | rev | cut -d " " -f2 | rev)

