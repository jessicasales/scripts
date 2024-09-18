#!/bin/bash

CONTAINER=$(docker ps --format '{{.Names}}' | awk 'NR==1')
PASTA=$(docker inspect $CONTAINER | grep "com.docker.compose.project.working_dir" | awk -F ":" '{print $2}' | tr -d '",')
cd $PASTA
echo "Entrando na pasta:" $PASTA
docker-compose down
echo "Executando docker-compose down"
echo "Restartando serviço docker"
systemctl restart docker
docker-compose build && docker-compose up -d
echo "Subindo containers novamente"
docker ps