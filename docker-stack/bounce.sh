#!/bin/zsh
export STACK_NAME='skafos'
docker service scale ${STACK_NAME}_$1=0
docker service scale ${STACK_NAME}_$1=1

