#!/bin/bash

# Parameters
state=$1
alias=$2

# Log file path
log_file="/folder-location/opsgenie_nagios.log"

# Log the date, time, state, and alias
echo "$(date) - State: $state, Alias: $alias" >> $log_file

# Check if the service state is OK
if [ "$state" == "OK" ]; then

# Opsgenie API key
API_KEY='API_KEY_HERE'


# Encode the alias to handle spaces and other URL characters
encoded_alias=$(printf '%b' "${alias// /%20}")

# Opsgenie endpoint for closing the alert
url="https://api.opsgenie.com/v2/alerts/$encoded_alias/close?identifierType=alias"


# Construct the JSON payload
json_payload=$(cat <<EOF
{
}
EOF
)

# Send request to Opsgenie to close the alert
curl -s -S -X POST $url \
    -H "Authorization: GenieKey $API_KEY" \
    -H "Content-Type: application/json"  \
    -d '{}' \
    -o /dev/null >> $log_file 2>&1
echo "$url" >> /folder-location/url-output
fi