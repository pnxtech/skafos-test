#!/bin/zsh

export STACK_NAME='skafos'
export HOST_IP=`echo "show State:/Network/Global/IPv4" | scutil | grep PrimaryInterface | awk '{print $3}' | xargs ifconfig | grep inet | grep -v inet6 | awk '{print $2}'`

echo "Binding ${STACK_NAME} to ${HOST_IP}"

sudo -- sh -c -e "echo '$HOST_IP\thost' >> /etc/hosts"
mkdir -p ~/data/${STACK_NAME} ~/data/${STACK_NAME}/redis ~/data/${STACK_NAME}/elasticsearch ~/data/${STACK_NAME}/mongo

sudo STACK_NAME=${STACK_NAME} HOST_IP=${HOST_IP} docker stack deploy --compose-file stack-compose.yml --with-registry-auth ${STACK_NAME}

echo "\nStarting microservices 5 seconds"
./countdown.sh 10

echo "\nopen http://localhost:16000"
