#!/bin/bash
#Mosquitto:
docker run -d --restart on-failure --network local -p 1883:1883 -p 8883:8883 -p 9001:9001 --name mosquitto eclipse-mosquitto

#MongoDb:
docker run -d --restart on-failure --network local -p 27017:27017 -v ~/data/mongodb/db:/data/db -v ~/data/mongodb/configdb:/data/configdb --name mongodb mongo:latest

#Node-Red:
docker run -d --restart on-failure --network local -p 1880:1880 --user root -v ~/data/node-red:/data --name node-red nodered/node-red-docker
