#!/bin/bash

workdir=$(dirname "${BASH_SOURCE[0]}")
app=brpc

cd $workdir
workdir=$PWD/_workspace

docker stop $app

docker run -t -d --rm         \
  --name $app                 \
  -v $workdir:/root/sammyne   \
  -w /root/sammyne            \
  sammyne/brpc:0.9.7-ubuntu20.04 bash
