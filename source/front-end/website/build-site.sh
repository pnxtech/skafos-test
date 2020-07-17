#!/bin/zsh
yarn build
rm -rf ../../web-service/public
mkdir -p ../../web-service/public
cp -R ./build/ ../../web-service/public

echo "Don't forget to rebuild the webserver and redeploy"
