#!/bin/bash

curl -s https://$SHORTNER_URL/api\?apikey\=$SHORTNER_API\&url\=$1 | jq -r '.short_url'