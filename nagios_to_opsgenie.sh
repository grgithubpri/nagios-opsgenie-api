#!/bin/bash

# Opsgenie API key
API_KEY="API_KEY_HERE"


# Message details
MESSAGE="$1"
ENTITY="$2"
STATE="$3"
ALIAS="$4"
INFO="$5"

#if [ "$3" != "CRITICAL" ] && [ "$3" != "OK" ] && [ "$3" != "WARNING" ]; then
#if [ "$3" != "CRITICAL" ] && [ "$3" != "OK" ] ; then

## select whether you want criticals / warnings / ok sent through and posted to log ##
if [ "$3" != "CRITICAL" ]; then
  echo "$(date) - Received:  $STATE , $ENTITY , $INFO , $ALIAS"  >> /folder-for-log/nagios-param-output
  exit 0
fi


# Opsgenie API URL
API_URL="https://api.opsgenie.com/v2/alerts"


# Construct the JSON payload
json_payload=$(cat <<EOF
{
  "message": "$MESSAGE",
  "alias": "$ALIAS",
  "description": "$INFO",
  "priority": "P2",
  "responders": [
         {
           "type": "schedule",
           "name": "Team_schedule"
         }
       ],
  "details": {
    "type": "Service:$STATE",
    "entity": "$ENTITY",
    "state": "$STATE"
  }
}
EOF
)

# Send the alert to Opsgenie
curl -X POST $API_URL \
     -H "Content-Type: application/json" \
     -H "Authorization: GenieKey $API_KEY" \
     -d "$json_payload"