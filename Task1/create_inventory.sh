#!/bin/bash

echo "[local_network]" > inventory.env

for i in `seq 1 254`; do
  ip=$1.${i}
  ping -c 1 -W 1 ${ip} > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "${ip}" >> inventory.env
  fi
done
