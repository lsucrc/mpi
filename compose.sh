#!/bin/sh
docker-compose scale head=1 node=3
docker ps 
