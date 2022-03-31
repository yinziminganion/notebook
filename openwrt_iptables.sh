iptables -t nat -N SSTCP
iptables -t nat -A SSTCP -d 0.0.0.0/8 -j RETURN
iptables -t nat -A SSTCP -d 10.0.0.0/8 -j RETURN
iptables -t nat -A SSTCP -d 127.0.0.0/8 -j RETURN
iptables -t nat -A SSTCP -d 169.254.0.0/16 -j RETURN
iptables -t nat -A SSTCP -d 172.16.0.0/12 -j RETURN
iptables -t nat -A SSTCP -d 192.168.0.0/16 -j RETURN
iptables -t nat -A SSTCP -d 224.0.0.0/4 -j RETURN
iptables -t nat -A SSTCP -d 240.0.0.0/4 -j RETURN
iptables -t nat -A SSTCP -d 59.72.194.0/23 -j RETURN
iptables -t nat -A SSTCP -d 202.198.8.0/24 -j RETURN
iptables -t nat -A SSTCP -p tcp -j REDIRECT --to-ports 1082
iptables -t nat -A PREROUTING -i br-lan -p tcp -j SSTCP

ip route add local 0.0.0.0/0 dev lo table 100
ip rule add fwmark 1 table 100
iptables -t mangle -N SSUDP
iptables -t mangle -A SSUDP -d 0.0.0.0/8 -j RETURN
iptables -t mangle -A SSUDP -d 10.0.0.0/8 -j RETURN
iptables -t mangle -A SSUDP -d 127.0.0.0/8 -j RETURN
iptables -t mangle -A SSUDP -d 169.254.0.0/16 -j RETURN
iptables -t mangle -A SSUDP -d 172.16.0.0/12 -j RETURN
iptables -t mangle -A SSUDP -d 192.168.0.0/16 -j RETURN
iptables -t mangle -A SSUDP -d 224.0.0.0/4 -j RETURN
iptables -t mangle -A SSUDP -d 240.0.0.0/4 -j RETURN
iptables -t mangle -A SSUDP -d 59.72.194.0/23 -j RETURN
iptables -t mangle -A SSUDP -d 202.198.8.0/24 -j RETURN
iptables -t mangle -A SSUDP -p udp -j TPROXY --on-port 1082 --tproxy-mark 0x01/0x01
iptables -t mangle -A PREROUTING -i br-lan -p udp -j SSUDP
