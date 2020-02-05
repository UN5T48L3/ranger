#!/bin/bash

echo -e ""
echo -e "\e[32m#################################################################\e[0m"
echo -e "\e[32m# \e[31m        Free Open Source List Maker By UN5T48L3               #\e[0m"
echo -e "\e[32m# \e[31mhttps://ipinfo.io/countries - you can find bunch of ASnumbers #\e[0m"
echo -e "\e[32m#################################################################\e[0m"

while read asn; do
	whois -h whois.radb.net -- "-i origin ${1:-$asn}" | grep -Eo "([0-9.]+){4}/[0-9]+" >> ranges.lst
	echo -e "$asn <-- added to list"
done < asn.txt
echo -e ""
echo -e "\e[34mAll ip ranges saved as ranges.lst\e[0m"
