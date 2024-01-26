# DDOS protection System + Nginx.

To start application run the simple command:

```bash
docker-compose up
```

It will run the applications:

  * [Nginx](http://localhost:6969/) on port `6969`
  * Web page app(not accessible from outside)
  * Container with UDP ddos(not accessible from outside)
  * Container with ICMP ddos(not accessible from outside)
  * Container with HTTP ddos(not accessible from outside)
  * Container with SYC ddos(not accessible from outside)
  * Container with SLOWLORIS ddos(not accessible from outside)

## UDP DDOS PROTECTION

Disable all ancoming udp traffic except of port 53(DNS). 

```bash
iptables -A INPUT -p udp --dport 53 -j DROP
```

## ICMP DDOS PROTECTION

Disable all ancoming ICMP traffic(no more PING). 

```bash
iptables -A INPUT --proto icmp -j DROP
```

## SYN DDOS PROTECTION

Enable SYN cookies(enabled by default).

```bash
sysctl -n net.ipv4.tcp_syncookies
```

## HTTP DDOS PROTECTION

NODE.JS limit connections to one server.

```bash
server hsa1017-node:6969 max_conns=800;
```

Limit requests and connections from ip address.

```bash
limit_req_zone $binary_remote_addr zone=anti_ddos_req:10m rate=10r/s;
limit_conn_zone $binary_remote_addr zone=anti_ddos_conn:10m;

server {
  location / {
    limit_conn anti_ddos_conn 30;
    limit_req zone=anti_ddos_req;
    ...
  }
}
```

## SLOWLORIS DDOS PROTECTION

Kill really slow queries.

```bash
server {
  client_body_timeout 5s;
  client_header_timeout 5s;
  ...
}
```
