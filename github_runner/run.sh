#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

URL=$(jq --raw-output '.url // empty' $CONFIG_PATH)
TOKEN=$(jq --raw-output '.token // empty' $CONFIG_PATH)

echo "${USERNAME}"
cd

echo '*** Configuring Runner ***'
./config.sh \
    --unattended \
    --url "$URL" \
    --token "$TOKEN" \
    --labels homeassistant 

cleanup () {
  echo '*** Removing Runner ***'
  ./config.sh remove --unattended --token "$TOKEN"
}

trap 'cleanup' EXIT

# The runner process might exit when it updates itself to a newer version. We
# just wait five seconds and then restart.
while sleep 5
do
  echo '*** Starting Runner ***'
  if ./run.sh
  then
    echo '*** Runner exited ***'
  else
    echo '*** Runner died ($?) ***'
  fi
done