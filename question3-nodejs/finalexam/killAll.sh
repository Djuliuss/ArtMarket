#!/bin/bash
docker rmi --force $(docker images -q dev-peer*)

docker rm $(docker ps -a -q)
docker kill $(docker ps -q) 
docker rm $(docker ps -a -q)