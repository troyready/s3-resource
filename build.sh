#!/bin/bash
echo 'starting build...'
if [ -d "assets" ]; then
  rm -rf assets
fi
if [ -d "/tmp/s3-resource-build" ]; then
  rm -rf /tmp/s3-resource-build
fi
mkdir -p assets/assets
docker build -t s3-resource-builder .
# docker run -v assets:/assets s3-noanon
docker run -v /tmp:/hosttmp s3-resource-builder
cp -pr /tmp/s3-resource-build/* assets/assets
cd assets || exit
cp assets/Dockerfile ./
docker build -t s3-resource .
