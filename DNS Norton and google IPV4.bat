echo Flushes the ARP cache for one or all interfaces.
netsh interface ipv4 delete neighbors
echo IP for main Machine
netsh interface ipv4 add address eth0 192.168.1.30 255.255.255.0 192.168.1.1
echo.
echo.
echo.
echo.
echo DNS Norton and google IPV4
netsh interface ipv4 add dnsservers eth0 8.8.8.8 index=1
netsh interface ipv4 add dnsservers eth0 8.8.4.4 index=2
netsh interface ipv4 add dnsservers eth0 199.85.126.10 index=3
netsh interface ipv4 add dnsservers eth0 199.85.127.10 index=4
netsh interface ipv4 add dnsservers eth0 199.85.126.20 index=5
netsh interface ipv4 add dnsservers eth0 199.85.127.20 index=6
netsh interface ipv4 add dnsservers eth0 199.85.126.30 index=7
netsh interface ipv4 add dnsservers eth0 199.85.127.30 index=8
Pause
echo.
echo.
echo.
echo.
ipconfig /renew
Pause
