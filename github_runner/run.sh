#!/usr/bin/with-contenv bashio
cd

echo '*** Configuring Runner ***'
./config.sh \
    --unattended \
    --url "$(bashio::config 'url')" \
    --token "$(bashio::config 'token')" \
    --labels homeassistant 

cleanup () {
  echo '*** Removing Runner ***'
  ./config.sh remove --unattended --token "$(bashio::config 'token')"
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