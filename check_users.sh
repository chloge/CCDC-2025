#!/bin/bash
##Initialize arrays##
normalUsers=(root bin daemon adm lp sync shutdown halt mail operator games ftp nobody avahi-autoipd systemd-timesync systemd-network systemd-resolve systemd-bus-proxy dbus polkitd abrt tss colord unbound usbmuxd geoclue qemu avahi saslauth rtkit pulse gdm rpc openvpn chrony rpcuser nfsnobody radvd apache gnome-initial-setup nm-openconnect sshd tcpdump)
actUserList=()

mapfile -t actUserList < <(sudo cat /etc/passwd | awk -F ':' '{print $1}') #Get users from /etc/passwd and write output to actUserList()

##Comparison logic##
for user in "${actUserList[@]}"; do
    if [[ ! " ${normalUsers[*]} " =~ " ${user} " ]]; then
        echo "$user may be abnormal."
    fi
done
