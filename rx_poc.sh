#! /bin/bash

#get current date
today=$(date +%Y%m%d)

#raw data file name
weather_report=raw_data_$today

#location
# read -p "Enter city name(if not specified will be your current location): " city -> program now takes city as an argument

#check if city is provided
if [ -z $1 ]
then
    city=""
else
    city=$1
fi

#get data from source, ouput in defined raw data file name
curl wttr.in/$city --output $weather_report

res=$(head $weather_report | grep "UNKNOWN LOCATION")

#extract temperature data from raw data
grep °C $weather_report > temperatures.txt

#get observed temperature
#the temperature value is the second last value
obs_data=$(head -1 temperatures.txt | tr -s " " | xargs) # ->  take first line of temperature.txt, remove extra spaces, convert to single line
obs_tmp=$(echo $obs_data | rev | cut -d " " -f2 | rev) # -> take the second last field

#get forecast temperature
fc_data=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs) # -> take first 3 lines of temperature.txt, remove extra spaces, convert to single line
fc_temp=$(echo $fc_data | cut -d "C" -f2 | rev | cut -d " " -f2 | rev) # -> take the second line and take the second last field from that line


#get location's current timezone
hour=$(TZ=$city date -u +%H) 
day=$(TZ=$city date -u +%d) 
month=$(TZ=$city date +%m)
year=$(TZ=$city date +%Y)

#write data to report file
record=$(echo -e "$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_temp")
echo $record>>rx_poc.log