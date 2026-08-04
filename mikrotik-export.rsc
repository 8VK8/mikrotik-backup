# 2026-08-05 02:18:59 by RouterOS 7.11.2
# software id = QP00-LR98
#
# model = RB952Ui-5ac2nD
# serial number = D3D50EE48B7A
/interface bridge
add name=bridge-lan
/interface wireless
set [ find default-name=wlan2 ] ssid=MikroTik
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
add authentication-types=wpa2-psk mode=dynamic-keys name=sec-home \
    supplicant-identity=""
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-g/n country=russia disabled=no \
    installation=indoor mode=ap-bridge security-profile=sec-home ssid=Home-8
/ip hotspot profile
set [ find default=yes ] html-directory=hotspot
/ip pool
add name=pool-lan ranges=192.168.32.100-192.168.32.200
add name=dhcp_pool1 ranges=192.168.32.2-192.168.32.254
/ip dhcp-server
add address-pool=dhcp_pool1 interface=bridge-lan name=dhcp1
/interface bridge port
add bridge=bridge-lan interface=ether2
add bridge=bridge-lan interface=ether3
add bridge=bridge-lan interface=ether4
add bridge=bridge-lan interface=ether5
add bridge=bridge-lan interface=wlan1
/ip address
add address=192.168.32.1/24 interface=bridge-lan network=192.168.32.0
/ip dhcp-client
add interface=ether1 use-peer-dns=no use-peer-ntp=no
/ip dhcp-server network
add address=192.168.32.0/24 gateway=192.168.32.1
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,8.8.8.8
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
#error exporting "/ip/ssh" (timeout)
/system clock
set time-zone-name=Europe/Moscow
/system note
set show-at-login=no
