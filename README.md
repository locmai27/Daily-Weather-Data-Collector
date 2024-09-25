Automate collecting task by sheduling a cronjob by the following steps:

Step 1: Edit your crontab: 
crontab -e

Step 2: Schedule the script:
0 8 * * * /path/to/rx_poc.sh #8 a.m at your local time

Note:
Location for data collection is set to Casablanca, Morocco. Edit variable $location in the script to change to any location you want.
