Automate collecting task by using a cronjob by the following steps:

Step 1: Edit your crontab: crontab -e

Step 2: Schedule the script: 0 8 * * * /path/to/rx_poc.sh #8 a.m at your local time (to report weather data at 8 a.m everyday)

Note: shell scripting program takes location as an input parameter

Example usage: 

1) Make sure you have execute privilege: chmod +x [path/to/rx_poc.sh]
2) Call the executable file with location as an argument: ./rx_poc.sh "Toronto" (case insensitive, if not a valid location, it will be automatically set to a random location)

Enjoy!
