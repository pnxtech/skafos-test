#!/bin/zsh
# Syntax: ./build.sh 0.1.1
docker build --no-cache=true -t pnxtech/ai-service:$1 .

