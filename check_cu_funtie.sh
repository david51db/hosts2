#!/bin/bash

check_ip() {
        hosts=$1
        ip=$2
        dns=$3

        real_ip=$(nslookup $hosts $dns | grep Adress | tail -n 1| awk '{print $2}')
        if [[ "$real_ip" != "$ip" ]]; then
                echo "Bogus IP for $host in /etc/hosts !"
        fi
}

cat /etc/hosts | while read ip name rest
do
        if [[ "$ip" =~ ^[0-9] ]]; then
                check_ip "$name" "$ip" "8.8.8.8"
        fi
done

echo "David"
