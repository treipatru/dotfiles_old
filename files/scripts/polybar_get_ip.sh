#!/usr/bin/env bash
#

IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
DISCONNECTED="dig: couldn't get address for 'resolver1.opendns.com': failure"

if [ "$IP" != "$DISCONNECTED" ]; then
    echo "$IP"
else
  echo "Disconnected"
fi
