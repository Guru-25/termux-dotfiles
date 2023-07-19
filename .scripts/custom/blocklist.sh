#!/bin/bash

echo -e "\n\t\tHaGeZi - Multi PRO++"

curl -s https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/pro.txt | grep -E --color='auto' $1

echo