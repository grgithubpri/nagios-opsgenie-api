# nagios-opsgenie-api
Scripts to integrate nagios core to ops genie api without the nagios plugin 

There was no easy to find documentation for integrating nagios core without the plugin

https://docs.opsgenie.com/docs/alert-api (ops genie docs)
----------------------------------------------------

From ops Genie go to team > your-team > integration 

add integrations choose the general api call it your desired name click create and it will give you the desired API key 

turn the integrations on and make sure the rules will listen to all alerts incoming 

add the attached scripts to the correct location in your nagios edit the files to use the API-KEY you created 

add the folder locations of your scripts 

restart nagios 

files 

nagios_to_opsgenie.sh is the create alert script 

close_nagios_to_opsgenie.sh close the open alert of state OK

command-example.cfg for the commands you need to send the service/host alerts

contact-example.cfg to send to the opsgenie contact

generic-service-example.cfg to make sure the close event gets sent automatically 

note that your service alert will need to be created 



```
define service{
        use                             generic-service         ; Name of service template to use
        host_name                       hostname
        service_description             service to monitor
        check_command                   check_command
        }
```
