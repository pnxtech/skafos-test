#!/bin/zsh
export STACK_NAME='skafos'
sudo sed '/[[:space:]]host/d' /etc/hosts > hosts.bak
sudo mv hosts.bak /etc/hosts
docker stack rm ${STACK_NAME}

echo "\nClosing services"
./countdown.sh 10
