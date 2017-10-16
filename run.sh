#!/bin/bash

cd /root/.homebridge

if [ "$HOMEBRIDGE_USERNAME" ]; then
  jq --arg USERNAME $HOMEBRIDGE_USERNAME '.bridge.username=$USERNAME' config.json > config.json.tmp && mv config.json.tmp config.json
fi

if [ "$HOMEBRIDGE_PIN" ]; then
  jq --arg USERNAME $HOMEBRIDGE_PIN '.bridge.username=$PIN' config.json > config.json.tmp && mv config.json.tmp config.json
fi

if [ "$LOXONE_IP_ADDRESS" ]; then
  jq --arg IP_ADDRESS $LOXONE_IP_ADDRESS '(.platforms[] | select(.name == "Loxone").host) |= $IP_ADDRESS' config.json > config.json.tmp && mv config.json.tmp config.json
else
  echo "Please specify Loxone Address!"
  exit
fi

if [ "$LOXONE_USERNAME" ]; then
  jq --arg USERNAME $LOXONE_USERNAME '(.platforms[] | select(.name == "Loxone").username) |= $USERNAME' config.json > config.json.tmp && mv config.json.tmp config.json
fi

if [ "$LOXONE_PASSWORD" ]; then
  jq --arg PASSWORD $LOXONE_PASSWORD '(.platforms[] | select(.name == "Loxone").password) |= $PASSWORD' config.json > config.json.tmp && mv config.json.tmp config.json
else
  echo "Please specify Loxone Password!"
  exit
fi

if [ "$LOXONE_PORT" ]; then
  jq --arg PORT $LOXONE_PORT '(.platforms[] | select(.name == "Loxone").port) |= $PORT' config.json > config.json.tmp && mv config.json.tmp config.json
fi



dbus-daemon --system
avahi-daemon -D


# Start Homebridge
homebridge

