#!/bin/bash

echo -e "\n\t\tHaGeZi - ULTIMATE"

curl -s https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/ultimate.txt | grep -E --color='auto' "$1"

echo