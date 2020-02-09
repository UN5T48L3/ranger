#! /usr/bin /env bash
# Author: un5t48l3
# Usage: bash ranges.sh
# Description: Free open source ASN ip range scraper.


script_name=$(basename "${0}")
script_version="1.0.0"
script_name=$(basename "${0}")
script_version="1.0.0"

if hash whois &> /dev/null; then
    echo "whois is installed"
elif hash jwhois &> /dev/null; then
    echo "jwhois is installed"
else
    echo "jwhois and whois are not installed, please install one of them to proceed"
    echo "The script is now exiting"
    exit 100
fi

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
