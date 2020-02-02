#!/bin/bash

echo -e ""
echo -e "\e[32m#################################################################"
echo -e "\e[32m# \e[31m        Free Open Source List Maker By UN5T48L3               \e[32m#"
echo -e "\e[32m# \e[31mhttps://ipinfo.io/countries - you can find bunch of ASnumbers \e[32m#"
echo -e "\e[32m# \e[31m         usage: bash asnscraper.sh ASNUMER123                 \e[32m#"
echo -e "\e[32m#################################################################"
sleep 2


whois -h whois.radb.net -- "-i origin ${1:-AS714}" | grep -Eo "([0-9.]+){4}/[0-9]+" >> ranges.lst

echo -e "\e[34mAll ip ranges saved as ranges.lst\e[34m"
