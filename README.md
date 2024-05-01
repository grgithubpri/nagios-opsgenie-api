# nagios-opsgenie-api
Scripts to integrate nagios core to ops genie api without the nagios plugin 

There was no easy to find documentation for integrating nagios core without the plugin

https://docs.opsgenie.com/docs/alert-api (REF HERE)
----------------------------------------------------

From ops Genie go to team > your-team > integration 

add integrations choose the general api call it your desired name click create and it will give you the desired API key 

turn the integrations on and make sure the rules will listen to all alerts incoming 

add the attached scripts to the correct location in your nagios edit the files to use the API-KEY you created 

add the folder locations of your scripts 

restart nagios 
