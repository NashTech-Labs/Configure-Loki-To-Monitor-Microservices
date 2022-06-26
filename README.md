## What is loki?
*Loki* is a widely used tool for monitoring pods and containers. Loki is basically just the aggregator as the logs are pushed to grafana and there we can explore it further with grafana’s visualisation capabalities.

## Promtail and docker-compose.yml
Promtail is used to ship logs to loki . 2 volumes have been mounted in grafana and loki so that we can persist log data and grafana configs across restarts.

## Bash script
Using Bash script file we are first installing the loki driver plugin for docker so that docker can find loki. The rest of the code is all about setting up the persistent volumes as per the id of the user in loki and grafana containers respectively. Finally we can run the docker-compose command to run the containers. You can navigate to port 3000 of the IP . Login with admin/admin , change the password and add loki as data source. Loki url source will be http://loki:3100. Rest assured this will be a one time thing as the volumes have been set up.

## Monitor Microservices
In order for loki to collect logs, the container needs to push the logs to loki driver. This we can do by adding a section in docker compose of the service. As an example , I have deployed a nginx service and indicated where the logging section needs to be added below:-

``` 
version: "3.4"

services:
  my-nginx-service:
    image: nginx
    container_name: my-nginx-service
    ports:
      - 8000:80
    #This section needs to be added to log 
    logging:   
      driver: loki
      options:
        loki-url: http://localhost:3100/loki/api/v1/push
```

That's all .