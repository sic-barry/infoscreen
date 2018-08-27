#!/bin/bash

cd /home/pi/infoscreen

echo "Update to latest infoscreen client"
git -C transfer pull

for pid in `jps -l | grep sic-info-screen-2.0-client | grep -v 'grep' | awk '{print $1}'`; do
  echo "Killing infoscreen client: $pid"
  kill $pid
done

source ./stop-chromium.sh

echo "Starting Chromium"
/usr/bin/chromium-browser --allow-file-access-from-files --start-fullscreen /home/pi/infoscreen/info-screen-2.html &


client_jar=`find transfer/sic-info-screen -name sic-info-screen-2.0-client-*.jar | sort --numeric-sort --reverse | head -n 1`

echo "Staring infoscreen client: $client_jar"
java -jar $client_jar \
> info-screen-2.0-client.log 2>&1 &
