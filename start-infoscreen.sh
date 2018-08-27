#!/bin/bash

cd /home/pi/infoscreen

# stop infoscreen and chromium if still running
source ./stop-infoscreen.sh

echo "Starting Chromium"
/usr/bin/chromium-browser --allow-file-access-from-files --start-fullscreen /home/pi/infoscreen/info-screen-2.html &

client_jar=`find . -name sic-info-screen-2.0-client-*.jar | sort --numeric-sort --reverse | head -n 1`

echo "Staring infoscreen client: $client_jar"
source settings.env
java -Dclient.mail.server=${SERVER} -Dsic.client.mail.user=${USER} -Dsic.client.mail.password=${PW} -jar $client_jar \
> info-screen-2.0-client.log 2>&1 &
