#!/usr/bin/env bash

git clone https://github.com/donn/nudelta nudelta-repo
cd nudelta-repo
git submodule update --init --recursive
rm -rf build
IMAGE=nudelta
CONTAINER=ephemeral
docker build -t  ${IMAGE} . 
docker run -d --name ${CONTAINER}  ${IMAGE}
docker cp ${CONTAINER}:/nudelta/dist/nudelta-0.7.4.AppImage ../
docker cp ${CONTAINER}:/nudelta/build/nudelta ../
docker rm -f ${CONTAINER}
docker image rmi  ${IMAGE}
cd ..
rm -rf nudelta-repo
